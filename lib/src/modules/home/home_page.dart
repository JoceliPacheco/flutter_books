import 'package:flutter/material.dart';
import 'package:flutter_books/src/core/app_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/components/app_bar/button_language.dart';
import '../../shared/components/book/card_book.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  AppController controller = Modular.get();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.title),
          actions: [
            ButtonLanguage('pt'),
            ButtonLanguage('en'),
            ButtonLanguage('es'),
          ],
        ),
        body: ListView.builder(
          itemCount: controller.books.length,
          itemBuilder: (context, index) => CardBook(controller.books[index]),
        ));
  }
}
