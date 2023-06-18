import 'package:flutter_books/src/shared/models/dominio/book/book.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';

import '../../database/database_manager.dart';
import '../transformers/book_to_favorite.dart';

class FavoriteRepository {
  DatabaseManager database = Modular.get();
  Future<bool> adicionar(Book book) async {
    print('ADICIONANDO');

    var db = await database.database.future;
    await db.insert(
      'favorite',
      BookToFavorite.transform(book).toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return true;
  }
}
