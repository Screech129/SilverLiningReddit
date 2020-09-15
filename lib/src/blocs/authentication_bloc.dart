import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:silverliningspodcasts/src/dtos/auth_info_dto.dart';
import 'package:silverliningspodcasts/src/helpers/constants.dart';
import 'package:silverliningspodcasts/src/helpers/secure_storage.dart';
import 'package:silverliningspodcasts/src/repositories/repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(AuthenticationState initialState) : super(initialState);

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final String token = await repository.getToken();
      if (token != null) {
        yield Authenticated(null);
      } else {
        var authInfo = await _getAuthInfo();
        yield NotAuthenticated(authInfo);
      }
    }

    if (event is UseBiometricsSwitched) {
      yield BiometricsSwitched(event.authInfo);
    }

    if (event is LoginButtonPressed) {
      yield PendingAuthentication(null);
      String errorMessage = ErrorConstants.authError;

      if (event.authInfo.userName != null && event.authInfo.password != null) {
        var response = await repository.login(
            event.authInfo.userName.trim(), event.authInfo.password);

        if (response != null) {
          await secureStorage.storage.write(
              key: StorageKeyConstants.useBiometrics,
              value: event.authInfo.useBiometrics.toString());

          if (event.authInfo.useBiometrics) {
            await secureStorage.storage.write(
              key: StorageKeyConstants.userName,
              value: event.authInfo.userName.toString(),
            );
            await secureStorage.storage.write(
              key: StorageKeyConstants.password,
              value: event.authInfo.password.toString(),
            );
          }
          yield Authenticated(null);
        } else {
          yield FailedAuthentication(
            errorMessage,
            event.authInfo,
          );
        }
      } else {
        if (event.authInfo.password == null) {
          errorMessage += ErrorConstants.passwordRequired;
        }
        if (event.authInfo.userName == null) {
          errorMessage += ErrorConstants.userNameRequired;
        }
        yield FailedAuthentication(
          errorMessage,
          event.authInfo,
        );
      }
    }

    if (event is LogOutButtonPressed) {
      yield PendingAuthentication(null);
      repository.logout();
      var authInfo = await _getAuthInfo();
      yield NotAuthenticated(authInfo);
    }
  }

  Future<AuthInfoDto> _getAuthInfo() async {
    AuthInfoDto _authInfo = AuthInfoDto();

    String _useBiometricsRaw = await secureStorage.storage
        .read(key: StorageKeyConstants.useBiometrics);

    _authInfo.useBiometrics = _useBiometricsRaw == 'true';

    if (_authInfo.useBiometrics) {
      _authInfo.userName =
          await secureStorage.storage.read(key: StorageKeyConstants.userName);
      _authInfo.password =
          await secureStorage.storage.read(key: StorageKeyConstants.password);
    }

    return _authInfo;
  }
}
