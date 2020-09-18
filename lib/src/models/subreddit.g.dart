// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subreddit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subreddit _$SubredditFromJson(Map<String, dynamic> json) {
  return Subreddit(
    displayName: json['display_name'] as String,
    displayNamePrefixed: json['display_name_prefixed'] as String,
    title: json['title'] as String,
    publicDescription: json['public_description'] as String,
  );
}

Map<String, dynamic> _$SubredditToJson(Subreddit instance) => <String, dynamic>{
      'display_name': instance.displayName,
      'display_name_prefixed': instance.displayNamePrefixed,
      'title': instance.title,
      'public_description': instance.publicDescription,
    };
