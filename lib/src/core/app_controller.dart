import 'package:flutter_books/src/shared/repositories/book_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../database/database_manager.dart';
import '../shared/models/dominio/book.dart';
part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  DatabaseManager databaseManager = Modular.get();
  BookRepository _bookRepository = Modular.get();

  @observable
  String lang = 'en';

  @action
  setLang(String newLanguage) {
    lang = newLanguage;
  }

  Future<bool> init() async {
    await _initDatabase();

    await getBooks();

    return true;
  }

  Future _initDatabase() async {
    await databaseManager.database.future;
  }

  @observable
  List<Book> books = [];

  @action
  Future getBooks() async {
    books = await _bookRepository.findBook('a');
  }
}
