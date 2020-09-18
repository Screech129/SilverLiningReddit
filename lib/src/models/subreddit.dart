import 'package:json_annotation/json_annotation.dart';

part 'subreddit.g.dart';

@JsonSerializable()
class Subreddit {
  String displayName;
  String displayNamePrefixed;
  String title;
  String publicDescription;

  Subreddit({
    this.displayName,
    this.displayNamePrefixed,
    this.title,
    this.publicDescription,
  });

  factory Subreddit.fromJson(json) => _$SubredditFromJson(json);
  Map<String, dynamic> toJson() => _$SubredditToJson(this);
}
