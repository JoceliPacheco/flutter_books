import 'dart:async';

import 'package:flutter_books/src/database/tables/favorite_table.dart';
import 'package:flutter_books/src/shared/models/dominio/table/base_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../helpers/transformers.dart';

class DatabaseManager {
  static const int schemaVersion = 3;

  static final DatabaseManager _instance = DatabaseManager._internal();

  factory DatabaseManager() => _instance;

  List<BaseTable> tables = [
    FavoriteTable(),
  ];

  Completer<Database> database = Completer<Database>();

  DatabaseManager._internal() {
    print('Inicializou o banco de dados');
    _initDatabase().then((Database db) async {
      database.complete(db);
      await db.rawQuery('PRAGMA journal_mode = WAL');
      await db.rawQuery('PRAGMA synchronous = NORMAL');
    });
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'books.db'),
      onCreate: this._onCreate,
      onUpgrade: this._onUpgrade,
      onDowngrade: this._onUpgrade,
      version: schemaVersion,
    );
  }

  _onCreate(Database db, version) async {
    await this._onUpgrade(db, version, version);
  }

  _onUpgrade(Database db, fromVersion, toVersion) async {
    print('Atualizando versões das tabelas');
    await _ajustaCriacaoTabelas(db, fromVersion, toVersion);
    await _ajustaCriacaoColunas(db, fromVersion, toVersion);
    await _ajustaCriacaoPrimaryKeys(db, fromVersion, toVersion);
    await _ajustaCriacaoIndices(db, fromVersion, toVersion);
  }

  /// Verifica se precisa criar novas tabelas
  /// ou dropar tabelas não mais utilizadas
  /// Somente serão preservadas as tabelas contidas no array tables
  _ajustaCriacaoTabelas(Database db, fromVersion, toVersion) async {
    List<String> createdTables = await _getAllTables(db);
    List<String> tablesCreated = [];

    // Verifica por tabelas que precisam ser criadas
    for (BaseTable table in tables) {
      // Tabela não existe, criar ela
      if (createdTables.indexOf(table.tableName) < 0) {
        await db.rawQuery(table.createTableQuery());
      }
      tablesCreated.add(table.tableName);
    }

    // Dropa tabelas que não são mais usadas
    for (String tableName in createdTables) {
      // Tabela não é mais utilizada, dropar ela
      if (tablesCreated.indexOf(tableName) < 0) {
        await db.rawQuery("DROP TABLE IF EXISTS $tableName");
      }
    }
  }

  /// Verifica se precisa criar novos campos nas tabelas
  /// ou atualizar/remover algum
  _ajustaCriacaoColunas(Database db, fromVersion, toVersion) async {
    for (BaseTable table in tables) {
      try {
        var createdColumns = await _getColumns(db, table.tableName);
        table.columns.forEach((String column, String type) async {
          /// Coluna não existe
          if (createdColumns[column] == null) {
            await db.rawQuery(table.addColumn(column));
          }
        });
      } catch (e) {
        await _recriarTabela(db, table);
      }
    }
  }

  /// Verifica se existem índices nas tabelas
  /// Recria eles
  _ajustaCriacaoIndices(Database db, fromVersion, toVersion) async {
    for (BaseTable table in tables) {
      try {
        if (table.indexes.length > 0) {
          // Dropa indexes
          table.indexes.forEach((String index, dynamic columns) async {
            await db.rawQuery("DROP INDEX IF EXISTS $index");
          });

          // Recria eles
          table
              .createIndexes()
              .forEach((String sql) async => await db.rawQuery(sql));
        }
      } catch (e) {
        await _recriarTabela(db, table);
      }
    }
  }

  /// Verifica se existem índices nas tabelas
  /// Recria eles
  _ajustaCriacaoPrimaryKeys(Database db, fromVersion, toVersion) async {
    for (BaseTable table in tables) {
      try {
        var columns =
            await db.rawQuery("PRAGMA table_info(${table.tableName})");

        var pks =
            columns.where((element) => dynamicToInt(element['pk']) > 0).length;

        List _pks = columns
            .where((element) => dynamicToInt(element['pk']) > 0)
            .toList();

        bool need = false;

        /// Tabela não tinha primary key, mas agora tem, recria ela
        if (table.primaryKey.length != pks) {
          need = true;
        }

        /// Tabela mudou pks
        _pks.forEach((item) {
          if (table.primaryKey.where((i) => i == item['name']).length <= 0) {
            need = true;
          }
        });

        if (need) {
          print('Recriando tabela ${table.tableName} por mudanças de PKs');
          await _recriarTabela(db, table);
        }
      } catch (e) {
        await _recriarTabela(db, table);
      }
    }
  }

  /// Recria a tabela caso dê problema com indices ou colunas
  Future _recriarTabela(Database db, BaseTable table) async {
    try {
      await (db.rawQuery(table.dropTableQuery()));
      await (db.rawQuery(table.createTableQuery()));
      table
          .createIndexes()
          .forEach((String sql) async => await db.rawQuery(sql));
    } catch (e) {}
  }

  /// Obtém listagem de todas as tabelas
  Future<List<String>> _getAllTables(Database db) async {
    var tables = await db.rawQuery('''
      SELECT name
        FROM sqlite_master
       WHERE type ='table'
         AND name NOT LIKE 'sqlite_%'
         AND name NOT LIKE 'android_%' ''');

    return tables.map<String>((table) => table['name'].toString()).toList();
  }

  /// Obtém listagem de todas as colunas de uma tabela
  Future<Map<String, String>> _getColumns(Database db, tableName) async {
    List _columns = await db.rawQuery('PRAGMA table_info($tableName)');
    Map<String, String> columns = {};

    _columns.forEach(
      (column) => columns
          .addAll({column['name'].toString(): column['type'].toString()}),
    );

    return columns;
  }
}
