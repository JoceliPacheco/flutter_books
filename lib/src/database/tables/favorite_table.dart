// ignore_for_file: overridden_fields

import 'package:flutter_books/src/database/tables/_base_table.dart';
import 'package:flutter_books/src/shared/constants/column_type.dart';

class FavoriteTable extends BaseTable {
  @override
  String tableName = 'favorite';

  @override
  Map<String, String> columns = {
    'id': ColumnType.typeText,
    'title': ColumnType.typeText,
    'subtitle': ColumnType.typeText,
    'publisher': ColumnType.typeText,
    'description': ColumnType.typeText,
    'image': ColumnType.typeText,
    'buy': ColumnType.typeText,
    'is_favorite': ColumnType.typeInteger,
  };

  @override
  List<String> primaryKey = ['id'];

  @override
  Map<String, dynamic> indexes = {};

  static final FavoriteTable instance = FavoriteTable._();
  factory FavoriteTable() => instance;
  FavoriteTable._();
}
