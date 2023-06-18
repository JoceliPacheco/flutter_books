import 'package:flutter_books/src/modules/details/details_controller.dart';
import 'package:flutter_books/src/shared/repositories/favorite_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/repositories/book_repository.dart';
import 'favorites_controller.dart';
import 'favorites_page.dart';

class FavoritesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => FavoritesController()),
        Bind((i) => FavoriteRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => FavoritesPage()),
      ];
}
