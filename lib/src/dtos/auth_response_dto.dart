import 'package:json_annotation/json_annotation.dart';
import 'package:silverliningspodcasts/src/helpers/reflector.dart';

part 'auth_response_dto.g.dart';

@reflector
@JsonSerializable()
class AuthResponseDto {
  String accessToken;
  String expiresIn;
  String state;

  AuthResponseDto({this.accessToken, this.expiresIn, this.state});

  factory AuthResponseDto.fromJson(json) => _$AuthResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseDtoToJson(this);
}
