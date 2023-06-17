import 'package:flutter_books/src/config/api_url.dart';
import 'package:flutter_books/src/shared/models/dominio/book.dart';
import 'package:flutter_books/src/shared/services/http/api_request.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BookRepository {
  final ApiRequest _apiRequest = Modular.get();
  Future<List<Book>> findBook(String keyword) async {
    return await _apiRequest
        .request(ApiUrl.findBooks(
      keyword,
    ))
        .then((data) {
      print(data['items']);
      return Book.fromList(data['items']);
    }).catchError(
      (onError) {
        print(onError);
      },
    );
  }
}
