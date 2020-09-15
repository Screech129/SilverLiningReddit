part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class LoginButtonPressed extends AuthenticationEvent {
  final AuthInfoDto authInfo;
  LoginButtonPressed(this.authInfo);
}

class UseBiometricsSwitched extends AuthenticationEvent {
  final AuthInfoDto authInfo;
  UseBiometricsSwitched(this.authInfo);
}

class LogOutButtonPressed extends AuthenticationEvent {}
