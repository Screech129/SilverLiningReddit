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
      final String tokenExpiration = await repository.getTokenExpiration();
      if (token != null &&
          DateTime.parse(tokenExpiration).isAfter(DateTime.now())) {
        yield Authenticated(null);
      } else {
        yield NotAuthenticated(null);
      }
    }

    if (event is GetAccessToken) {
      repository.getAccessToken(event.authToken);
    }

    if (event is LogOutButtonPressed) {
      yield PendingAuthentication(null);
      repository.logout();
      yield NotAuthenticated(null);
    }
  }
}
