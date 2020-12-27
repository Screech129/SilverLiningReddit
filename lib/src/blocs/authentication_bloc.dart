import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:silverliningsreddit/src/dtos/dtos.dart';
import 'package:silverliningsreddit/src/helpers/helpers.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(AuthenticationState initialState, this._repository)
      : super(initialState);

  final Repository _repository;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final String token = await _repository.getToken();
      final String tokenExpiration = await _repository.getTokenExpiration();
      if (token != null) {
        if (DateTime.parse(tokenExpiration).isBefore(DateTime.now())) {
          final String refreshToken = await _repository.getRefreshToken();
          var response = await _repository.refreshAccessToken(refreshToken);
          _saveTokenInfo(response, secureStorage);
        }
        yield AuthenticatedState(null);
      } else {
        yield NotAuthenticatedState(null);
      }
    }

    if (event is GetAccessToken) {
      var response = await _repository.getAccessToken(event.authToken);
      _saveTokenInfo(response, secureStorage);
      secureStorage.storage.write(
          key: StorageKeyConstants.refreshToken, value: response.refreshToken);
      yield AuthenticatedState(null);
    }

    if (event is LogOutButtonPressedEvent) {
      yield PendingAuthenticationState(null);
      _repository.logout();
      yield NotAuthenticatedState(null);
    }
  }

  void _saveTokenInfo(AuthResponseDto response, SecureStorage secureStorage) {
    secureStorage.storage.write(
        key: StorageKeyConstants.accessToken, value: response.accessToken);
    secureStorage.storage.write(
        key: StorageKeyConstants.expiresIn,
        value: DateTime.now()
            .add(Duration(seconds: response.expiresIn))
            .toString());
  }
}
