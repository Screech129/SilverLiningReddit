import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:silverliningspodcasts/src/blocs/authentication_bloc.dart';
import 'package:silverliningspodcasts/src/dtos/auth_info_dto.dart';
import 'package:silverliningspodcasts/src/helpers/constants.dart';
import 'package:silverliningspodcasts/src/widgets/styled_scaffold.dart';
import 'package:silverliningspodcasts/src/widgets/styled_text_field.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StyledScaffold(
      PageTitleConstants.login,
      _buildBody(context),
      showAppDrawer: false,
    );
  }

  Widget _buildBody(context) {
    AuthInfoDto authInfo = AuthInfoDto();

    bool _biometricsAvailable = true;
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is NotAuthenticated) {
          _handleNotAuthenticated(authInfo, state.authInfo, context);
        }
        if (state is FailedAuthentication) {
          _handleFailedAuthentication(context, state);
        }
      },
      builder: (context, state) {
        if (state is AuthenticationInitial) {
          _biometricsAvailable = state.biometricsAvailable;
        }
        if (state is! Authenticated && state is! PendingAuthentication) {
          authInfo = state.authInfo;
        }
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildLoginFields(authInfo),
              _buildBiometricsField(_biometricsAvailable, authInfo, context),
              _buildLoginButton(state, context, authInfo)
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoginFields(AuthInfoDto authInfo) {
    return Column(
      children: [
        StyledTextField(
          label: WidgetConstants.userName,
          onTextChanged: (value, valid) {
            authInfo.userName = value;
          },
          value: authInfo.userName,
        ),
        SizedBox(
          height: 25,
        ),
        StyledTextField(
          label: WidgetConstants.password,
          onTextChanged: (value, valid) {
            authInfo.password = value;
          },
          value: authInfo.password,
        ),
      ],
    );
  }

  Container _buildBiometricsField(
      bool _biometricsAvailable, AuthInfoDto authInfo, BuildContext context) {
    return _biometricsAvailable
        ? Container(
            margin: EdgeInsets.only(left: 20, right: 30),
            child: SwitchListTile(
              title: Text(WidgetConstants.thumbPrint),
              value: authInfo.useBiometrics,
              onChanged: (bool value) {
                authInfo.useBiometrics = value;
                BlocProvider.of<AuthenticationBloc>(context).add(
                  UseBiometricsSwitched(authInfo),
                );
              },
            ),
          )
        : Container();
  }

  Container _buildLoginButton(
      AuthenticationState state, BuildContext context, AuthInfoDto authInfo) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      child: state is PendingAuthentication
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RaisedButton(
              child: Text(WidgetConstants.login),
              color: Theme.of(context).accentColor,
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoginButtonPressed(authInfo),
                );
              },
            ),
    );
  }

  void _handleFailedAuthentication(
      BuildContext context, FailedAuthentication state) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
          content: Text('${state.errorMessage}'), backgroundColor: Colors.red),
    );
  }

  void _handleNotAuthenticated(
    AuthInfoDto authInfo,
    AuthInfoDto stateAuthoInfo,
    BuildContext context,
  ) {
    authInfo.useBiometrics = stateAuthoInfo.useBiometrics;
    if (authInfo.useBiometrics) {
      authInfo.userName = stateAuthoInfo.userName;
      authInfo.password = stateAuthoInfo.password;

      var localAuth = LocalAuthentication();
      try {
        var authenticated = localAuth.authenticateWithBiometrics(
            localizedReason: WidgetConstants.thumbPrint);
        authenticated.then((value) {
          if (value) {
            final scaffold = Scaffold.of(context);
            scaffold.showSnackBar(
              SnackBar(
                  content: Text(WidgetConstants.scanSuccess),
                  backgroundColor: Colors.green),
            );

            BlocProvider.of<AuthenticationBloc>(context).add(
              LoginButtonPressed(authInfo),
            );
          }
        });
      } on PlatformException catch (e) {
        final scaffold = Scaffold.of(context);
        scaffold.showSnackBar(
          SnackBar(
              content: Text('Authentication Failed'),
              backgroundColor: Colors.green),
        );
        print(e);
      }
    }
  }
}
