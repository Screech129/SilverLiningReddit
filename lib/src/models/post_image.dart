import 'package:json_annotation/json_annotation.dart';
import 'package:silverliningsreddit/src/models/models.dart';

part 'image.g.dart';

@JsonSerializable()
class PostImage {
  Source source;
  List<Source> resolutions;
  String id;

  PostImage();

  factory PostImage.fromJson(json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
