import 'package:flutter_books/src/helpers/transformers.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sale_info.dart';
import 'volume_info.dart';

part 'favorite.g.dart';

@JsonSerializable(createToJson: true)
class Favorite {
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

  @JsonKey(name: 'imageLinks', fromJson: parseImage)
  String image;

  Favorite({
    required this.id,
    this.title = '',
    this.subtitle = '',
    this.description = '',
    this.publisher = '',
    this.image = '',
  });

  static List<Favorite> fromList(List<dynamic> list) {
    return list.map((map) => Favorite.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() => _$FavoriteToJson(this);

  factory Favorite.fromJson(Map<String, dynamic> map) =>
      _$FavoriteFromJson(map);
}
