import 'package:json_annotation/json_annotation.dart';
import 'package:silverliningsreddit/src/helpers/helpers.dart';

part 'user.g.dart';

@reflector
@JsonSerializable()
class User {
  final int id;
  final String userName;
  final String password;
  final String firstName;
  final String lastName;
  final String email;

  User(
    this.id,
    this.userName,
    this.password,
    this.firstName,
    this.lastName,
    this.email,
  );

  @ignore
  factory User.fromJson(json) => _$UserFromJson(json);
  @ignore
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
