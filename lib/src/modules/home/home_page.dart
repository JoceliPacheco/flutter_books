import 'package:flutter/material.dart';
import 'package:flutter_books/src/core/app_controller.dart';
import 'package:flutter_books/src/modules/home/home_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/components/app_bar/button_language.dart';
import '../../shared/components/book/card_book.dart';
import '../../shared/components/simple_content/simple_content_widget.dart';

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
    controller.initScroll();
  }

  handleScroll() {
    print('handleScroll');
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
        builder: (context) {
          return SimpleContentContainer(
            expand: true,
            child: _buildBody,
            bottom: controller.loading
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  )
                : null,
          );
        },
      ),
    );
  }

  Widget get _buildBody => ListView.builder(
        controller: controller.scroll,
        itemCount: controller.books.length,
        itemBuilder: (context, index) => CardBook(controller.books[index]),
      );
}
