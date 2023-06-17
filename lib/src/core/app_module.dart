import 'package:flutter_books/src/core/app_controller.dart';
import 'package:flutter_books/src/database/database_manager.dart';
import 'package:flutter_books/src/shared/repositories/book_repository.dart';
import 'package:flutter_books/src/shared/services/http/api_request.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../modules/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //Core
        Bind((i) => AppController()),
        Bind((i) => ApiRequest()),
        Bind((i) => DatabaseManager()),
        Bind((i) => BookRepository())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => HomePage(),
        )
      ];
}
