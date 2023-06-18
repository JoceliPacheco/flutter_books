import 'package:flutter_books/src/shared/models/dominio/book/favorite.dart';
import 'package:flutter_books/src/shared/repositories/favorite_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class IsFavoriteService {
  FavoriteRepository _favoriteRepository = Modular.get();
  Future<bool> validate(String id) async {
    List<Favorite> list = await _favoriteRepository.getFavorite(id);

    return list.isNotEmpty;
  }
}
