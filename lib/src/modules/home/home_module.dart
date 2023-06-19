import 'package:flutter_books/src/shared/repositories/favorite_repository.dart';
import 'package:flutter_books/src/shared/services/books/find_book_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/repositories/book_repository.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => BookRepository()),
        Bind((i) => FavoriteRepository()),
        Bind((i) => FindBookService()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomePage()),
      ];
}
