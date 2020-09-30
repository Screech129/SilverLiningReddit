import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'preview.g.dart';

@JsonSerializable()
class Preview {
  List<Image> images;

  Preview();

  factory Preview.fromJson(json) => _$PreviewFromJson(json);
  Map<String, dynamic> toJson() => _$PreviewToJson(this);
}
