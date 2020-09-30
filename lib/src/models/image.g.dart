// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image()
    ..source = json['source'] == null ? null : Source.fromJson(json['source'])
    ..resolutions = (json['resolutions'] as List)
        ?.map((e) => e == null ? null : Source.fromJson(e))
        ?.toList()
    ..id = json['id'] as String;
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'source': instance.source,
      'resolutions': instance.resolutions,
      'id': instance.id,
    };
