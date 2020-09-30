// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source()
    ..url = json['url'] as String
    ..width = (json['width'] as num)?.toDouble()
    ..height = (json['height'] as num)?.toDouble();
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
