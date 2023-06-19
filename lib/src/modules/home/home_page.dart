import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.init();
    controller.initScroll();
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
            head: _buildhead,
            child: _buildBody,
            bottom: _buildBottom,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Modular.to.pushNamed('/favorites'),
        child: Icon(Icons.favorite),
      ),
    );
  }

  Widget get _buildBody => ListView.builder(
        controller: controller.scroll,
        itemCount: controller.books.length,
        itemBuilder: (context, index) => CardBook(
          controller.books[index],
          onTap: () => Modular.to.pushNamed(
            '/details',
            arguments: {'book': controller.books[index]},
          ),
        ),
      );

  Widget get _buildhead => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          controller: textEditingController,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            hintText: AppLocalizations.of(context)!.labelSearch,
            suffix: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                FocusScope.of(context).unfocus();

                controller.search(textEditingController.value.text);
              },
            ),
          ),
          onSubmitted: (value) => controller.search(value),
        ),
      );

  Widget get _buildBottom => controller.loading
      ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        )
      : Container();
}
