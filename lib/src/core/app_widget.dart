import 'package:flutter/material.dart';
import 'package:flutter_books/src/core/app_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppController controller = Modular.get();

    return Material(
      child: FutureBuilder<bool>(
        future: controller.init(),
        builder: (_, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return _buildApp(context, controller);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildApp(BuildContext context, AppController controller) {
    return MaterialApp.router(
      title: 'Flutter books',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('pt', 'BR'),
      ],
      builder: (BuildContext context, Widget? child) => Material(
        child: _buildLocale(context, controller, child),
      ),
    );
  }

  Widget _buildLocale(
    BuildContext context,
    AppController controller,
    Widget? child,
  ) {
    return Observer(
      builder: (ctx) => Localizations.override(
        context: ctx,
        locale: Locale(controller.lang),
        child: child,
      ),
    );
  }
}
