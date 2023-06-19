import 'package:flutter_books/src/shared/models/dominio/table/column_type.dart';

abstract class BaseTable<T> {
  String tableName = '';
  Map<String, String> columns = {};
  List<String> primaryKey = [];
  Map<String, dynamic> indexes = {};
  Map<String, String> defaults = {};

  String createTableQuery() {
    String cols = "";

    columns.forEach((String field, String type) {
      String defaultCollumn = defaults[field].toString();
      cols += "$field $type ";
      cols += " DEFAULT $defaultCollumn";
      if ((type == ColumnType.Integer || type == ColumnType.Real) &&
          defaultCollumn == null) {
        cols += " DEFAULT 0";
      }
      cols += ", ";
    });
    cols = "($cols)".replaceAll(", )", ")");
    if (primaryKey.isNotEmpty) {
      cols = cols.replaceAll(")", ", ${_createPrimaryKey()} )");
    }
    return "CREATE TABLE $tableName $cols";
  }

  String _createPrimaryKey() {
    if (primaryKey.isNotEmpty) {
      return 'CONSTRAINT ${this.tableName}_pk PRIMARY KEY (${primaryKey.join(', ')})';
    }
    return '';
  }

  String dropTableQuery() => "DROP TABLE IF EXISTS $tableName";

  List<String> createIndexes() {
    List<String> queries = [];

    if (indexes.isNotEmpty) {
      indexes.forEach((String index, dynamic fields) {
        String field = fields.toString();
        if (fields is List) {
          field = fields.join(', ');
        }
        queries
            .add('CREATE INDEX IF NOT EXISTS $index ON $tableName ($field);');
      });
    }

    return queries;
  }

  String addColumn(String columnName) {
    String type = columns[columns].toString();
    String defaultCollumn = defaults[columnName].toString();

    String sql = 'ALTER TABLE ${this.tableName} ADD $columnName $type';

    sql += " DEFAULT $defaultCollumn";

    if ((type == ColumnType.Integer || type == ColumnType.Real) &&
        defaultCollumn == null) {
      sql += " DEFAULT 0";
    }

    return sql;
  }

  @override
  String toString() {
    return this.tableName;
  }
}
