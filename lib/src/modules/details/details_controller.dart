import 'package:flutter_books/src/shared/repositories/favorite_repository.dart';
import 'package:flutter_books/src/shared/services/favorites/is_favorite_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/dominio/book/book.dart';
part 'details_controller.g.dart';

class DetailsController = DetailsControllerBase with _$DetailsController;

abstract class DetailsControllerBase with Store {
  FavoriteRepository _favoriteRepository = Modular.get();
  IsFavoriteService _isFavoriteService = Modular.get();

  @observable
  bool isFavorite = false;

  init(Book book) {
    validFavorite(book.id);
  }

  validFavorite(String id) async {
    isFavorite = await _isFavoriteService.validate(id);
  }

  add(Book book) async {
    isFavorite = !isFavorite;
    book.isFavorite = isFavorite;

    if (isFavorite) {
      await _favoriteRepository.add(book);
    } else {
      await _favoriteRepository.rm(book.id);
    }
  }
}
