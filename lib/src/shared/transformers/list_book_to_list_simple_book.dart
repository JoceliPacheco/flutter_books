import 'package:flutter_books/src/shared/models/dominio/book/simple_book.dart';

import '../models/http/book_api/book_api.dart';
import 'book_to_simple_book.dart';

class ListBookToListSimpleBook {
  static List<SimpleBook> transform(List<BookApi> books) {
    List<SimpleBook> result = [];

    for (var book in books) {
      result.add(BookToSimpleBook.transform(book));
    }

    return result;
  }
}
