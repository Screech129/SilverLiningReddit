// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['Id'] as int,
    json['UserName'] as String,
    json['Password'] as String,
    json['FirstName'] as String,
    json['LastName'] as String,
    json['Email'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Id': instance.id,
      'UserName': instance.userName,
      'Password': instance.password,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Email': instance.email,
    };
