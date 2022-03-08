class Failure {
  final String message;
  final int? statusCode;

  const Failure(this.message, {this.statusCode});

  factory Failure.fromJson(Map<String, dynamic> json) =>
      Failure(json["message"]);

  @override
  String toString() => message;
}
