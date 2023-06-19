import 'package:flutter_books/src/shared/models/dominio/book/simple_book.dart';
import 'package:flutter_books/src/shared/services/alerts/toast_service.dart';
import 'package:flutter_books/src/shared/transformers/list_book_to_list_simple_book.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../models/http/book_api/book_api.dart';
import '../../repositories/book_repository.dart';
import '../../repositories/favorite_repository.dart';

class FindBookService {
  final BookRepository _bookRepository = Modular.get();
  final FavoriteRepository _favoriteRepository = Modular.get();

  Future<List<SimpleBook>> find({
    required String keyword,
    required int offset,
    required int limit,
    List<SimpleBook> currentList = const [],
  }) async {
    try {
      List<BookApi> list =
          await _bookRepository.findBook(keyword, offset, limit);

      currentList.addAll(
        await resolveBookFavorites(
          ListBookToListSimpleBook.transform(list),
        ),
      );
    } catch (err) {
      ToastService.show(err.toString());
    }

    return currentList;
  }

  Future<List<SimpleBook>> resolveBookFavorites(List<SimpleBook> list) async {
    List<SimpleBook> favorites = await _favoriteRepository.getFavorites();

    for (var item in list) {
      List<SimpleBook> result =
          favorites.where((fav) => fav.id == item.id).toList();
      if (result.isNotEmpty) {
        item.isFavorite = true;
      }
    }

    return list;
  }
}
