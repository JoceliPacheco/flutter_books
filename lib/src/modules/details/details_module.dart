import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/repositories/book_repository.dart';
import 'details_page.dart';

class DetailsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => BookRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => DetailsPage()),
      ];
}
