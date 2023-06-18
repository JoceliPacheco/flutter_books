import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_books/src/modules/favorites/favorites_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/components/book/card_book.dart';
import '../../shared/transformers/book_to_favorite.dart';
import '../../shared/transformers/favorite_to_book.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  FavoritesController controller = Modular.get();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Observer(
      builder: (context) {
        return ListView.builder(
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) => CardBook(
            FavoriteToBook.transform(controller.favorites[index]),
          ),
        );
      },
    );
  }
}
