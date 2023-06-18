import 'package:flutter_books/src/shared/repositories/favorite_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/dominio/book/book.dart';
part 'details_controller.g.dart';

class DetailsController = DetailsControllerBase with _$DetailsController;

abstract class DetailsControllerBase with Store {
  FavoriteRepository _favoriteRepository = Modular.get();

  add(Book book) async {
    await _favoriteRepository.adicionar(book);
  }
}
