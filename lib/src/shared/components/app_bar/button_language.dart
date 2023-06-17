import 'package:flutter/material.dart';
import 'package:flutter_books/src/core/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonLanguage extends StatelessWidget {
  final AppController controller = Modular.get();
  final String language;

  ButtonLanguage(
    this.language, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String localeName = AppLocalizations.of(context)!.localeName;
    return TextButton(
      onPressed: () => controller.setLang(language),
      child: Text(
        language.toUpperCase(),
        style: TextStyle(
          color: localeName == language ? Colors.red : Colors.white,
        ),
      ),
    );
  }
}
