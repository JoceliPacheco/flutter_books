import 'package:flutter_books/src/shared/models/dominio/book/book.dart';
import 'package:flutter_books/src/shared/models/dominio/book/volume_info.dart';

import '../models/dominio/book/favorite.dart';

class FavoriteToBook {
  static Book transform(Favorite favorite) {
    return Book(
        id: favorite.id,
        volumeInfo: VolumeInfo(
          title: favorite.title,
          description: favorite.description,
          subtitle: favorite.subtitle,
          publisher: favorite.publisher,
          image: favorite.image,
        ));
  }
}
