import '../base/base_service.dart';

abstract class NetworkService extends BaseService {
  Future<dynamic> get(
    Uri uri, {
    Map<String, String>? headers,
  });
}
