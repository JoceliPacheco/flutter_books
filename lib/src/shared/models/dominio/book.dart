import 'package:flutter_books/src/helpers/transformers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable(createToJson: true)
class Book {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'subtitle')
  String subtitle;

  @JsonKey(name: 'description')
  String description;

  Book({
    required this.id,
    this.title = '',
    this.subtitle = '',
    this.description = '',
  });

  static List<Book> fromList(List<dynamic> list) {
    return list.map((map) => Book.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() => _$BookToJson(this);

  factory Book.fromJson(Map<String, dynamic> map) => _$BookFromJson(map);
}
