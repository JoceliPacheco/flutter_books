import 'package:flutter_books/src/core/app_controller.dart';
import 'package:flutter_books/src/database/database_manager.dart';
import 'package:flutter_books/src/shared/services/http/api_request.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../modules/details/details_module.dart';
import '../modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //Core
        Bind((i) => AppController()),
        Bind((i) => ApiRequest()),
        Bind((i) => DatabaseManager()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/details', module: DetailsModule()),
      ];
}
