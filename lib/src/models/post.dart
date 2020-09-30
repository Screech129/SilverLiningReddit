import 'package:json_annotation/json_annotation.dart';
import 'package:silverliningsreddit/src/models/preview.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  String subreddit;
  String selftext;
  String authorFullname;
  bool saved;
  bool clicked;
  String title;
  String subredditNamePrefixed;
  bool hidden;
  int downs;
  int ups;
  int score;
  String permalink;
  String url;
  String thumbnail;
  Preview preview;
  Post();

  factory Post.fromJson(json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
