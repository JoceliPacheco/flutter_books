import 'package:flutter_books/src/helpers/transformers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sale_info.g.dart';

@JsonSerializable(createToJson: true)
class SaleInfo {
  @JsonKey(name: 'buyLink')
  String buyLink;

  SaleInfo({
    this.buyLink = '',
  });

  static List<SaleInfo> fromList(List<dynamic> list) {
    return list.map((map) => SaleInfo.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() => _$SaleInfoToJson(this);

  factory SaleInfo.fromJson(Map<String, dynamic> map) =>
      _$SaleInfoFromJson(map);
}
