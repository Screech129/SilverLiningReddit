import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silverliningsreddit/src/blocs/authentication_bloc.dart';
import 'package:silverliningsreddit/src/helpers/constants.dart';
import 'package:silverliningsreddit/src/helpers/secure_storage.dart';
import 'package:silverliningsreddit/src/widgets/styled_scaffold.dart';
import 'package:uuid/uuid.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is NotAuthenticatedState) {
          var stateGuid = Uuid().v4();
          var fullAuthUrl = Uri.encodeFull(
              '${NetworkConstants.authCodeUrl}${NetworkConstants.clientId}&${NetworkConstants.redirectUri}&${NetworkConstants.scopes}&duration=permanent&response_type=code&state=$stateGuid');

          return WebView(
            initialUrl: fullAuthUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (url) {
              if (url.contains('${StorageKeyConstants.accessToken}=') &&
                  url.contains('callback')) {
                var queryParams = Uri.splitQueryString(url);
                String authToken;
                queryParams.forEach((key, value) {
                  if (key.contains('state') && value != stateGuid.toString()) {
                    return;
                  }

                  if (key.contains(StorageKeyConstants.accessToken)) {
                    authToken = value;
                    secureStorage.storage.write(
                        key: StorageKeyConstants.authToken, value: value);
                  }
                });

                BlocProvider.of<AuthenticationBloc>(context)
                    .add(GetAccessToken(authToken));
              }
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
