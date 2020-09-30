// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preview _$PreviewFromJson(Map<String, dynamic> json) {
  return Preview()
    ..images = (json['images'] as List)
        ?.map((e) => e == null ? null : Image.fromJson(e))
        ?.toList();
}

Map<String, dynamic> _$PreviewToJson(Preview instance) => <String, dynamic>{
      'images': instance.images,
    };
