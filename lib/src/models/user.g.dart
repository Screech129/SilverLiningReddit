// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['user_name'] as String,
    json['password'] as String,
    json['first_name'] as String,
    json['last_name'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'password': instance.password,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
    };
