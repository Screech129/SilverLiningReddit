import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
// ignore: unused_import
import 'package:reflectable/reflectable.dart';
import 'package:silverliningsreddit/src/app.dart';
import 'package:silverliningsreddit/src/blocs/authentication_bloc.dart';
import 'package:silverliningsreddit/src/dtos/auth_info_dto.dart';
import 'package:silverliningsreddit/src/helpers/secure_storage.dart';
import 'package:silverliningsreddit/src/repositories/db_provider.dart';
import 'main.reflectable.dart';

import 'package:silverliningsreddit/src/helpers/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeReflectable();

  await dbProvider.init();

  var localAuth = LocalAuthentication();
  var hasBiometrics = await localAuth.canCheckBiometrics;

  AuthInfoDto _authInfo = AuthInfoDto();

  if (hasBiometrics) {
    String useBiometricsRaw = await secureStorage.storage
        .read(key: StorageKeyConstants.useBiometrics);

    _authInfo.useBiometrics = useBiometricsRaw == 'true';

    if (_authInfo.useBiometrics) {
      _authInfo.userName =
          await secureStorage.storage.read(key: StorageKeyConstants.userName);
      _authInfo.password =
          await secureStorage.storage.read(key: StorageKeyConstants.password);
    }
  }
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(
            AuthenticationInitialState(hasBiometrics, _authInfo))
          ..add(AppStarted());
      },
      child: App(),
    ),
  );
}
