import 'package:flutter_books/src/shared/models/dominio/book/favorite.dart';
import 'package:flutter_books/src/shared/repositories/favorite_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/dominio/book/book.dart';
part 'favorites_controller.g.dart';

class FavoritesController = FavoritesControllerBase with _$FavoritesController;

abstract class FavoritesControllerBase with Store {
  FavoriteRepository _favoriteRepository = Modular.get();
  @observable
  List<Favorite> favorites = [];

  getBooks() async {
    favorites = await _favoriteRepository.getFavorites();
  }
}
