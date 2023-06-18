import '../models/dominio/book/book.dart';
import '../models/dominio/book/favorite.dart';

class BookToFavorite {
  static Favorite transform(Book book) {
    return Favorite(
      id: book.id,
      title: book.volumeInfo.title,
    );
  }
}
