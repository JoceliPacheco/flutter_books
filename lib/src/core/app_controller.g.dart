// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppController on AppControllerBase, Store {
  late final _$langAtom =
      Atom(name: 'AppControllerBase.lang', context: context);

  @override
  String get lang {
    _$langAtom.reportRead();
    return super.lang;
  }

  @override
  set lang(String value) {
    _$langAtom.reportWrite(value, super.lang, () {
      super.lang = value;
    });
  }

  late final _$AppControllerBaseActionController =
      ActionController(name: 'AppControllerBase', context: context);

  @override
  dynamic setLang(String newLanguage) {
    final _$actionInfo = _$AppControllerBaseActionController.startAction(
        name: 'AppControllerBase.setLang');
    try {
      return super.setLang(newLanguage);
    } finally {
      _$AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lang: ${lang}
    ''';
  }
}
