import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/dominio/book.dart';
import '../../shared/repositories/book_repository.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  BookRepository _bookRepository = Modular.get();

  @observable
  List<Book> books = [];

  init() {
    getBooks();
  }

  @action
  Future getBooks() async {
    books = await _bookRepository.findBook('a');
  }
}
