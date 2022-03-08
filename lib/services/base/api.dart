class API {
  final String host;

  API.production() : host = 'api.binance.com';
  static const String scheme = 'https';

  Uri get getPrices => Uri(scheme: scheme, host: host, path: 'api/v3/ticker/price');
}
