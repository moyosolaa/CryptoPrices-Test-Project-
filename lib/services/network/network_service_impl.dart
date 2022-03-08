import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../shared_contents/models/failure.dart';
import '../base/api.dart';
import 'network_service.dart';

class NetworkServiceImpl implements NetworkService {
  @override
  API get getAPI => API.production();

  void _throwOnFail(http.Response res) {
    // print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    // print(res.statusCode);
    // print(res.body);
    switch (res.statusCode) {
      case 200:
      case 201:
        break;
      case 502:
      case 422:
        final errorString = res.body;
        if (jsonDecode(errorString)['error']['message'] is! String) {
          final exception = Failure(jsonDecode(errorString)['message'], statusCode: res.statusCode);
          throw exception;
        }
        final exception = Failure(jsonDecode(errorString)['error']['message'], statusCode: res.statusCode);
        throw exception;
      case 400:
        final errorString = res.body;
        if (jsonDecode(errorString)['message'] is! String) {
          final exception = Failure(jsonDecode(errorString)['message'], statusCode: res.statusCode);
          throw exception;
        }
        final exception = Failure(jsonDecode(errorString)['message'], statusCode: res.statusCode);
        throw exception;
      case 500:
        final errorString = res.body;
        if (jsonDecode(errorString)['message'] is! String) {
          final exception = Failure(jsonDecode(errorString)['message'], statusCode: res.statusCode);
          throw exception;
        }
        final exception = Failure(jsonDecode(errorString)['message'], statusCode: res.statusCode);
        throw exception;
      case 504:
        final exception = Failure('Unauthorised', statusCode: res.statusCode);
        print('Failure: message ${exception.message.toString()}');
        throw exception;

      default:
        final errorString = res.body;
        if (jsonDecode(errorString)['message'] is! String) {
          final exception = Failure(jsonDecode(errorString)['message'], statusCode: res.statusCode);
          throw exception;
        }
        final exception = Failure.fromJson(json.decode(errorString));
        print('Failure: Message ${exception.message}');
        throw exception;
    }
  }

  @override
  Future<dynamic> get(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.get(uri, headers: headers);
      log(response.request.toString());
      _throwOnFail(response);
      return jsonDecode(response.body);
    } on SocketException {
      log('Failure: SocketException');
      throw const Failure('Please check your internet connection 😑');
    } on FormatException {
      log('Failure: FormatException');
      throw const Failure('Bad response format 👎');
    } catch (ex) {
      log('Failure: Message {${ex.toString()}}');
      throw Failure(ex.toString());
    }
  }
}
