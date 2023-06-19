import 'package:flutter_books/src/config/_env.dart';
import 'package:flutter_books/src/shared/models/dominio/api_url_method.dart';

abstract class ApiUrl {
  static ApiUrlMethod findBooks(String keyword, int offset, int limit) =>
      ApiUrlMethod(
        baseUrl: apiUrl,
        path:
            '/books/v1/volumes?q=$keyword&key=$token&startIndex=$offset&maxResults=$limit',
        httpMethod: 'GET',
      );
}
