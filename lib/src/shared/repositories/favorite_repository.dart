import 'package:flutter_books/src/shared/models/dominio/book/book.dart';
import 'package:flutter_books/src/shared/models/dominio/book/favorite.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';

import '../../database/database_manager.dart';
import '../transformers/book_to_favorite.dart';

class FavoriteRepository {
  DatabaseManager database = Modular.get();
  Future<bool> add(Book book) async {
    var db = await database.database.future;
    await db.insert(
      'favorite',
      BookToFavorite.transform(book).toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return true;
  }

  Future<int> rm(String id) async {
    final db = await database.database.future;
    return db.delete('favorite', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Favorite>> getFavorites() async {
    var db = await database.database.future;
    return db.query('favorite').then((_) => Favorite.fromList(_));
  }

  Future<List<Favorite>> getFavorite(String id) async {
    var db = await database.database.future;
    return db.query(
      'favorite',
      where: 'id = ?',
      whereArgs: [id],
    ).then((_) => Favorite.fromList(_));
  }
}
