import 'package:flutter_books/src/shared/models/dominio/table/base_table.dart';
import 'package:flutter_books/src/shared/models/dominio/table/column_type.dart';

class BookTable extends BaseTable {
  String tableName = 'book';

  Map<String, String> columns = {
    'id': ColumnType.Text,
    'title': ColumnType.Text,
    'subtitle': ColumnType.Text,
    'publisher': ColumnType.Text,
    'description': ColumnType.Text,
  };

  List<String> primaryKey = ['id'];

  Map<String, dynamic> indexes = {};

  static final BookTable instance = BookTable._();
  factory BookTable() => instance;
  BookTable._();
}
