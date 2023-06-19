// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleBook _$SimpleBookFromJson(Map<String, dynamic> json) => SimpleBook(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      description: json['description'] as String? ?? '',
      publisher: json['publisher'] as String? ?? '',
      image: json['image'] as String? ?? '',
      buyLink: json['buy'] as String? ?? '',
    );

Map<String, dynamic> _$SimpleBookToJson(SimpleBook instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'publisher': instance.publisher,
      'image': instance.image,
      'buy': instance.buyLink,
    };
