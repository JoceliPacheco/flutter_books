import 'package:flutter_books/src/config/credendial.dart';
import 'package:flutter_books/src/shared/models/dominio/api_url_method.dart';

abstract class ApiUrl {
  static ApiUrlMethod findBooks(String keyword) => ApiUrlMethod(
        baseUrl: 'https://www.googleapis.com/',
        path: '/books/v1/volumes',
        httpMethod: 'GET',
      );
}
