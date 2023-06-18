import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/dominio/book/book.dart';
import '../../shared/repositories/book_repository.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final BookRepository _bookRepository = Modular.get();

  late ScrollController scroll;

  @observable
  bool loading = false;

  @observable
  int offset = 0;

  int limit = 20;
  double tolerancia = 50;

  initScroll() {
    scroll = ScrollController();
    scroll.addListener(handleScroll);
  }

  handleScroll() {
    print('handleScroll');
    if (scroll.position.pixels + tolerancia >=
            scroll.position.maxScrollExtent &&
        !loading) {
      getBooks();
    }
  }

  @observable
  List<Book> books = [];

  init() {
    getBooks();
  }

  @action
  Future getBooks() async {
    loading = true;

    List<Book> _lista = books;

    _lista.addAll(await _bookRepository.findBook('a', offset, limit));
    books = _lista;
    print(_lista.length);

    loading = false;
    offset += limit;
  }
}
