
import 'package:flutter_books/src/config/api_url.dart';
import 'package:flutter_books/src/shared/services/http/api_request.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../helpers/exception.dart';
import '../models/http/book_api/book_api.dart';

class BookRepository {
  final ApiRequest _apiRequest = Modular.get();
  Future<List<BookApi>> findBook(
    String keyword,
    int offset,
    int limit,
  ) async {
    return await _apiRequest
        .request(ApiUrl.findBooks(
      keyword,
      offset,
      limit,
    ))
        .then((data) {
      return BookApi.fromList(data!['items'] ?? []);
    }).catchError(
      (e) {
        throw Exception(getMessage(e));
      },
    );
  }
}
