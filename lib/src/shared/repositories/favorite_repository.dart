import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';

import '../../database/database_manager.dart';
import '../models/dominio/book/simple_book.dart';
import '../models/http/book_api/book_api.dart';
import '../transformers/book_to_simple_book.dart';

class FavoriteRepository {
  DatabaseManager database = Modular.get();
  Future<bool> add(SimpleBook book) async {
    var db = await database.database.future;
    await db.insert(
      'favorite',
      book.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return true;
  }

  Future<int> rm(String id) async {
    final db = await database.database.future;
    return db.delete('favorite', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<SimpleBook>> getFavorites() async {
    var db = await database.database.future;
    return db.query('favorite').then((_) => SimpleBook.fromList(_));
  }

  Future<List<SimpleBook>> getFavorite(String id) async {
    var db = await database.database.future;
    return db.query(
      'favorite',
      where: 'id = ?',
      whereArgs: [id],
    ).then((_) => SimpleBook.fromList(_));
  }
}
