// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post()
    ..subreddit = json['subreddit'] as String
    ..selftext = json['selftext'] as String
    ..authorFullname = json['author_fullname'] as String
    ..saved = json['saved'] as bool
    ..clicked = json['clicked'] as bool
    ..title = json['title'] as String
    ..subredditNamePrefixed = json['subreddit_name_prefixed'] as String
    ..hidden = json['hidden'] as bool
    ..downs = json['downs'] as int
    ..ups = json['ups'] as int
    ..score = json['score'] as int
    ..permalink = json['permalink'] as String
    ..url = json['url'] as String
    ..thumbnail = json['thumbnail'] as String
    ..preview =
        json['preview'] == null ? null : Preview.fromJson(json['preview']);
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'subreddit': instance.subreddit,
      'selftext': instance.selftext,
      'author_fullname': instance.authorFullname,
      'saved': instance.saved,
      'clicked': instance.clicked,
      'title': instance.title,
      'subreddit_name_prefixed': instance.subredditNamePrefixed,
      'hidden': instance.hidden,
      'downs': instance.downs,
      'ups': instance.ups,
      'score': instance.score,
      'permalink': instance.permalink,
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'preview': instance.preview,
    };
