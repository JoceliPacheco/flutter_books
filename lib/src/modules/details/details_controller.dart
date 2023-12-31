import 'package:flutter_books/src/shared/repositories/favorite_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/dominio/book/simple_book.dart';

part 'details_controller.g.dart';

class DetailsController = DetailsControllerBase with _$DetailsController;

abstract class DetailsControllerBase with Store {
  final FavoriteRepository _favoriteRepository = Modular.get();

  @observable
  bool isFavorite = false;

  init(SimpleBook book) {
    isFavorite = book.isFavorite;
  }

  handleFavorite(SimpleBook book) async {
    isFavorite = !isFavorite;
    book.isFavorite = isFavorite;

    if (isFavorite) {
      await _favoriteRepository.insert(book);
    } else {
      await _favoriteRepository.remove(book.id);
    }
  }
}
