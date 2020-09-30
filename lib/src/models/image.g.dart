// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostImage _$ImageFromJson(Map<String, dynamic> json) {
  return PostImage()
    ..source = json['source'] == null ? null : Source.fromJson(json['source'])
    ..resolutions = (json['resolutions'] as List)
        ?.map((e) => e == null ? null : Source.fromJson(e))
        ?.toList()
    ..id = json['id'] as String;
}

Map<String, dynamic> _$ImageToJson(PostImage instance) => <String, dynamic>{
      'source': instance.source,
      'resolutions': instance.resolutions,
      'id': instance.id,
    };
