import 'package:flutter/material.dart';
import 'package:flutter_books/src/core/app_controller.dart';
import 'package:flutter_books/src/modules/home/home_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/components/app_bar/button_language.dart';
import '../../shared/components/book/card_book.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Modular.get();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.init();
  }

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
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: controller.books.length,
          itemBuilder: (context, index) => CardBook(controller.books[index]),
        ),
      ),
    );
  }
}
