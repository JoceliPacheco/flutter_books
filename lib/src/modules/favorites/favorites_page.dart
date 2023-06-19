import 'package:flutter/material.dart';
import 'package:flutter_books/src/modules/favorites/favorites_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/components/book/card_book.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  FavoritesController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.favorites),
      ),
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return Observer(
      builder: (context) {
        if (controller.favorites.isEmpty) {
          return const EmptyWidget();
        }
        return SizedBox(
          width: double.infinity,
          child: ListView.builder(
            itemCount: controller.favorites.length,
            itemBuilder: (context, index) => CardBook(
              controller.favorites[index],
              onTap: () => Modular.to.pushNamed(
                '/details',
                arguments: {'book': controller.favorites[index]},
              ).then((_) {
                controller.getBooks();
              }),
            ),
          ),
        );
      },
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.heartCrack,
              color: Colors.grey,
              size: 72,
            ),
            Text(
              AppLocalizations.of(context)!.noFavorites,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
