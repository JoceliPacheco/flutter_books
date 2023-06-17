class ApiUrlMethod {
  String baseUrl;
  String path;
  String httpMethod;
  dynamic body;
  String token;

  ApiUrlMethod({
    required this.baseUrl,
    this.path = '',
    this.httpMethod = 'GET',
    this.body,
    this.token = '',
  });

  String get url => "$baseUrl$path";
}
