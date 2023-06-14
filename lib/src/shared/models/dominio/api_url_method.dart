class ApiUrlMethod {
  String baseUrl;
  String path;
  String httpMethod;
  dynamic body;

  ApiUrlMethod({
    required this.baseUrl,
    this.path = '',
    this.httpMethod = 'GET',
    this.body,
  });

  String get url => "$baseUrl$path";
}
