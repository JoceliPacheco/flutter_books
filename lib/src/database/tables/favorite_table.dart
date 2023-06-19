import 'package:flutter_books/src/shared/models/dominio/table/base_table.dart';
import 'package:flutter_books/src/shared/models/dominio/table/column_type.dart';

class FavoriteTable extends BaseTable {
  String tableName = 'favorite';

  Map<String, String> columns = {
    'id': ColumnType.Text,
    'title': ColumnType.Text,
    'subtitle': ColumnType.Text,
    'publisher': ColumnType.Text,
    'description': ColumnType.Text,
    'image': ColumnType.Text,
    'buy': ColumnType.Text,
    'is_favorite': ColumnType.Integer,
  };

  List<String> primaryKey = ['id'];

  Map<String, dynamic> indexes = {};

  static final FavoriteTable instance = FavoriteTable._();
  factory FavoriteTable() => instance;
  FavoriteTable._();
}
