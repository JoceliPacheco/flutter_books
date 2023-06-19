import 'package:flutter_books/src/shared/models/dominio/book/simple_book.dart';

import '../models/http/book_api/book_api.dart';

class BookToSimpleBook {
  static SimpleBook transform(BookApi book) {
    return SimpleBook(
      id: book.id,
      title: book.volumeInfo.title,
      description: book.volumeInfo.description,
      subtitle: book.volumeInfo.subtitle,
      publisher: book.volumeInfo.publisher,
      image: book.volumeInfo.image,
      buyLink: book.saleInfo?.buyLink ?? '',
    );
  }
}
