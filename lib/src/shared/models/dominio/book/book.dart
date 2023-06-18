import 'package:flutter_books/src/helpers/transformers.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sale_info.dart';
import 'volume_info.dart';

part 'book.g.dart';

@JsonSerializable(createToJson: true)
class Book {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'volumeInfo')
  VolumeInfo volumeInfo;

  @JsonKey(name: 'saleInfo')
  SaleInfo? saleInfo;

  bool isFavorite = false;

  Book({
    required this.id,
    required this.volumeInfo,
    this.saleInfo,
    this.isFavorite = true,
  });

  static List<Book> fromList(List<dynamic> list) {
    return list.map((map) => Book.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() => _$BookToJson(this);

  factory Book.fromJson(Map<String, dynamic> map) => _$BookFromJson(map);
}
