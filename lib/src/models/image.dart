import 'package:json_annotation/json_annotation.dart';
import 'package:silverliningsreddit/src/models/source.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  Source source;
  List<Source> resolutions;
  String id;

  Image();

  factory Image.fromJson(json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
