import 'package:json_annotation/json_annotation.dart';

import 'sale_info.dart';
import 'volume_info.dart';

part 'book_api.g.dart';

@JsonSerializable(createToJson: true)
class BookApi {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'volumeInfo')
  VolumeInfo volumeInfo;

  @JsonKey(name: 'saleInfo')
  SaleInfo? saleInfo;

  bool isFavorite = false;

  BookApi({
    required this.id,
    required this.volumeInfo,
    this.saleInfo,
    this.isFavorite = false,
  });

  static List<BookApi> fromList(List<dynamic> list) {
    return list.map((map) => BookApi.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() => _$BookApiToJson(this);

  factory BookApi.fromJson(Map<String, dynamic> map) => _$BookApiFromJson(map);
}
