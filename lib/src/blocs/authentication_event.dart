part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class GetAccessToken extends AuthenticationEvent {
  final String authToken;
  GetAccessToken(this.authToken);
}

class UseBiometricsSwitchedEvent extends AuthenticationEvent {
  final AuthInfoDto authInfo;
  UseBiometricsSwitchedEvent(this.authInfo);
}

class LogOutButtonPressedEvent extends AuthenticationEvent {}
