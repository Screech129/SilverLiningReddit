import 'package:json_annotation/json_annotation.dart';
import 'package:silverliningsreddit/src/helpers/helpers.dart';

part 'auth_response_dto.g.dart';

@reflector
@JsonSerializable()
class AuthResponseDto {
  String accessToken;
  int expiresIn;
  String refreshToken;

  AuthResponseDto({this.accessToken, this.expiresIn, this.refreshToken});

  factory AuthResponseDto.fromJson(json) => _$AuthResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseDtoToJson(this);
}
