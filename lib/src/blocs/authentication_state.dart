part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {
  final AuthInfoDto authInfo;

  AuthenticationState(this.authInfo);
}

class AuthenticationInitial extends AuthenticationState {
  final bool biometricsAvailable;
  AuthenticationInitial(this.biometricsAvailable, AuthInfoDto authInfo)
      : super(authInfo);
}

class NotAuthenticated extends AuthenticationState {
  NotAuthenticated(AuthInfoDto authInfo) : super(authInfo);
}

class Authenticated extends AuthenticationState {
  Authenticated(AuthInfoDto authInfo) : super(authInfo);
}

class PendingAuthentication extends AuthenticationState {
  PendingAuthentication(AuthInfoDto authInfo) : super(authInfo);
}

class FailedAuthentication extends AuthenticationState {
  final String errorMessage;
  FailedAuthentication(this.errorMessage, AuthInfoDto authInfo)
      : super(authInfo);
}

class BiometricsSwitched extends AuthenticationState {
  BiometricsSwitched(AuthInfoDto authInfo) : super(authInfo);
}
