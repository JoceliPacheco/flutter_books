import 'package:json_annotation/json_annotation.dart';

part 'simple_book.g.dart';

@JsonSerializable(createToJson: true)
class SimpleBook {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'subtitle')
  String subtitle;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'publisher')
  String publisher;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'buy')
  String buyLink;

  @JsonKey(ignore: true)
  bool isFavorite = false;

  SimpleBook({
    required this.id,
    this.title = '',
    this.subtitle = '',
    this.description = '',
    this.publisher = '',
    this.image = '',
    this.buyLink = '',
    this.isFavorite = false,
  });

  static List<SimpleBook> fromList(List<dynamic> list) {
    return list.map((map) => SimpleBook.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() => _$SimpleBookToJson(this);

  factory SimpleBook.fromJson(Map<String, dynamic> map) =>
      _$SimpleBookFromJson(map);
}
