import 'package:flutter_books/src/helpers/transformers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'volume_info.g.dart';

@JsonSerializable(createToJson: true)
class VolumeInfo {
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'subtitle')
  String subtitle;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'publisher')
  String publisher;

  @JsonKey(name: 'imageLinks', fromJson: _parseImage)
  String image;

  VolumeInfo({
    this.title = '',
    this.subtitle = '',
    this.description = '',
    this.publisher = '',
    this.image = '',
  });

  static List<VolumeInfo> fromList(List<dynamic> list) {
    return list.map((map) => VolumeInfo.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() => _$VolumeInfoToJson(this);

  factory VolumeInfo.fromJson(Map<String, dynamic> map) =>
      _$VolumeInfoFromJson(map);

  static _parseImage(map) {
    if (map['thumbnail'] != null) {
      return map['thumbnail'].toString();
    }
  }
}
