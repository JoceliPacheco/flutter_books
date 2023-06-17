import 'package:flutter_books/src/helpers/transformers.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: true)
class Book {
  @JsonKey(name: 'id', fromJson: dynamicToString)
  String id;

  @JsonKey(name: 'title', fromJson: dynamicToString)
  String title;

  @JsonKey(name: 'subtitle', fromJson: dynamicToString)
  String subtitle;

  @JsonKey(name: 'description', fromJson: dynamicToString)
  String description;

  Book({
    required this.id,
    this.title = '',
    this.subtitle = '',
    this.description = '',
  });

  static List<Book> fromList(List<dynamic> list) {
    return list.map((_) => Book.fromJson(_)).toList();
  }

  factory Book.fromJson(dynamic map) => Book(
        id: map['id'].toString(),
        title: map['title'].toString(),
        description: map['description'].toString(),
        subtitle: map['subtitle'].toString(),
      );
}
