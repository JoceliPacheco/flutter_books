import 'package:flutter/material.dart';
import 'package:flutter_books/src/shared/models/dominio/book/simple_book.dart';
import 'package:flutter_books/src/shared/services/books/find_book_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/repositories/book_repository.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final BookRepository _bookRepository = Modular.get();
  final FindBookService _findBookService = Modular.get();

  late ScrollController scroll;

  @observable
  bool loading = false;

  @observable
  int offset = 0;

  int limit = 20;
  double tolerancia = 50;

  @observable
  String keyword = '';

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
  List<SimpleBook> books = [];

  init() {
    getBooks();
  }

  @action
  Future getBooks() async {
    if (keyword.isEmpty) {
      return;
    }

    loading = true;

    books = await _findBookService.find(
      keyword: keyword,
      limit: limit,
      offset: offset,
      currentList: books,
    );

    loading = false;
    offset += limit;
  }

  search(String text) {
    keyword = text;
    books = [];
    offset = 0;

    getBooks();
  }
}
