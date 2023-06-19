import 'dart:convert';
import 'dart:ui';

int? dynamicToInt(source, {bool nullable = false}) {
  if (nullable && source == null) {
    return 0;
  }

  if (source.runtimeType == bool) {
    return source ? 1 : 0;
  }

  return source == null || source.toString().isEmpty
      ? 0
      : int.tryParse(source.toString());
}

int? dynamicToIntNullable(source) {
  return dynamicToInt(source, nullable: true);
}

double? stringToDouble(String source) {
  return source == null || source.isEmpty ? 0 : double.tryParse(source);
}

double? dynamicToDouble(source, {bool nullable = false}) {
  if (source == null && nullable) {
    return null;
  }
  return source == null || source.toString().isEmpty
      ? 0
      : double.tryParse(source.toString());
}

double? dynamicToDoubleNullable(source) {
  return dynamicToDouble(source, nullable: true);
}

DateTime? intToDateTime(int timestamp) {
  if (timestamp != null && timestamp > 0) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }
  return null;
}

String? intToDate(int timestamp) {
  if (timestamp != null && timestamp > 0) {
    String data = DateTime.fromMillisecondsSinceEpoch(timestamp).toString();
    return data.split(' ').first;
  }
  return null;
}

DateTime? stringToDate(String date) {
  return date != null ? DateTime.parse(date) : null;
}

bool? intToBool(dynamic source, {bool nullable = false}) {
  if (nullable && source == null) {
    return null;
  }
  if (source == null) {
    return false;
  }
  return source != 0;
}

bool? intToBoolNullable(dynamic source) {
  return intToBool(source, nullable: true);
}

bool dynamicToBool(dynamic source, {bool nullable = false}) {
  if (source.toString() == 'true') {
    return true;
  } else if (source.toString() == 'false') {
    return false;
  }
  return dynamicToInt(source) != 0;
}

bool? dynamicToBoolNullable(dynamic source) {
  return dynamicToBool(source, nullable: true);
}

int? boolToInt(dynamic source, {bool nullable = false}) {
  if (nullable && source == null) {
    return null;
  }
  return source == true ? 1 : 0;
}

int? boolToIntNullable(dynamic source) {
  return boolToInt(source, nullable: true);
}

String? dynamicToString(dynamic? source) {
  if (source != null) {
    return source.toString();
  }
  return '';
}

String parseImage(map) {
  if (map['thumbnail'] != null) {
    return map['thumbnail'].toString();
  }
  return '';
}
