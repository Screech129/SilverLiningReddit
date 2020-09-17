// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseDto _$AuthResponseDtoFromJson(Map<String, dynamic> json) {
  return AuthResponseDto(
    accessToken: json['access_token'] as String,
    expiresIn: json['expires_in'] as String,
    state: json['state'] as String,
  );
}

Map<String, dynamic> _$AuthResponseDtoToJson(AuthResponseDto instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'state': instance.state,
    };
