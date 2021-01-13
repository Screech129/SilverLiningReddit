part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {
  final AuthInfoDto authInfo;

  AuthenticationState(this.authInfo);
}

class AuthenticationInitialState extends AuthenticationState {
  final bool biometricsAvailable;
  AuthenticationInitialState(this.biometricsAvailable, AuthInfoDto authInfo)
      : super(authInfo);
}

class NotAuthenticatedState extends AuthenticationState {
  NotAuthenticatedState(AuthInfoDto authInfo) : super(authInfo);
}

class AuthenticatedState extends AuthenticationState {
  AuthenticatedState(AuthInfoDto authInfo) : super(authInfo);
}

class PendingAuthenticationState extends AuthenticationState {
  PendingAuthenticationState(AuthInfoDto authInfo) : super(authInfo);
}

class FailedAuthenticationState extends AuthenticationState {
  final String errorMessage;
  FailedAuthenticationState(this.errorMessage, AuthInfoDto authInfo)
      : super(authInfo);
}

class BiometricsSwitchedState extends AuthenticationState {
  BiometricsSwitchedState(AuthInfoDto authInfo) : super(authInfo);
}
