import 'package:flutter_books/src/modules/details/details_controller.dart';
import 'package:flutter_books/src/shared/repositories/favorite_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/repositories/book_repository.dart';
import 'details_page.dart';

class DetailsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => DetailsController()),
        Bind((i) => BookRepository()),
        Bind((i) => FavoriteRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => DetailsPage(
                  book: args.data['book'],
                )),
      ];
}
