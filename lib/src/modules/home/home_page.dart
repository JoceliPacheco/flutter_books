import 'package:flutter/material.dart';
import 'package:flutter_books/src/core/app_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  AppController controller = Modular.get();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.idioma),
      ),
      body: Column(
        children: [
          Center(
            child: Text(AppLocalizations.of(context)!.idioma),
          ),
          Observer(builder: (context) => Text(controller.lang)),
          TextButton(
              onPressed: () => controller.setLang('pt'), child: Text('PT')),
          TextButton(
              onPressed: () => controller.setLang('en'), child: Text('EN')),
          TextButton(
              onPressed: () => controller.setLang('es'), child: Text('ES')),
        ],
      ),
    );
  }
}
