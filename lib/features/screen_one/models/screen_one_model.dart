import 'dart:convert';

List<PricesModel> pricesFromJson(String str) => List<PricesModel>.from(json.decode(str).map((x) => PricesModel.fromJson(x)));

class PricesModelResponse {
  const PricesModelResponse({this.prices});

  factory PricesModelResponse.fromJson(List<dynamic> json) {
    return PricesModelResponse(
        prices: List<PricesModel>.from(
      json.map((x) => PricesModel.fromJson(x)),
    ));
  }
  final List<PricesModel>? prices;
}

class PricesModel {
  PricesModel({
    required this.symbol,
    required this.price,
  });

  final String? symbol;
  final String? price;

  factory PricesModel.fromJson(Map<String, dynamic> json) => PricesModel(
        symbol: json["symbol"],
        price: json["price"],
      );
}
