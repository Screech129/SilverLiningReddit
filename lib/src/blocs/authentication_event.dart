part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class GetAccessToken extends AuthenticationEvent {
  final String authToken;
  GetAccessToken(this.authToken);
}

class UseBiometricsSwitched extends AuthenticationEvent {
  final AuthInfoDto authInfo;
  UseBiometricsSwitched(this.authInfo);
}

class LogOutButtonPressed extends AuthenticationEvent {}
