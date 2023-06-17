// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: 'HomeControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$offsetAtom =
      Atom(name: 'HomeControllerBase.offset', context: context);

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  late final _$booksAtom =
      Atom(name: 'HomeControllerBase.books', context: context);

  @override
  List<Book> get books {
    _$booksAtom.reportRead();
    return super.books;
  }

  @override
  set books(List<Book> value) {
    _$booksAtom.reportWrite(value, super.books, () {
      super.books = value;
    });
  }

  late final _$getBooksAsyncAction =
      AsyncAction('HomeControllerBase.getBooks', context: context);

  @override
  Future<dynamic> getBooks() {
    return _$getBooksAsyncAction.run(() => super.getBooks());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
offset: ${offset},
books: ${books}
    ''';
  }
}
