import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:silverliningsreddit/src/dtos/auth_info_dto.dart';
import 'package:silverliningsreddit/src/dtos/auth_response_dto.dart';
import 'package:silverliningsreddit/src/helpers/constants.dart';
import 'package:silverliningsreddit/src/helpers/secure_storage.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

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
      final String tokenExpiration = await repository.getTokenExpiration();
      if (token != null) {
        if (DateTime.parse(tokenExpiration).isBefore(DateTime.now())) {
          final String refreshToken = await repository.getRefreshToken();
          var response = await repository.refreshAccessToken(refreshToken);
          _saveTokenInfo(response);
        }
        yield Authenticated(null);
      } else {
        yield NotAuthenticated(null);
      }
    }

    if (event is GetAccessToken) {
      var response = await repository.getAccessToken(event.authToken);
      _saveTokenInfo(response);
      secureStorage.storage.write(
          key: StorageKeyConstants.refreshToken, value: response.refreshToken);
    }

    if (event is LogOutButtonPressed) {
      yield PendingAuthentication(null);
      repository.logout();
      yield NotAuthenticated(null);
    }
  }

  void _saveTokenInfo(AuthResponseDto response) {
    secureStorage.storage.write(
        key: StorageKeyConstants.accessToken, value: response.accessToken);
    secureStorage.storage.write(
        key: StorageKeyConstants.expiresIn,
        value: DateTime.now()
            .add(Duration(seconds: response.expiresIn))
            .toString());
  }
}
