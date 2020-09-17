import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silverliningspodcasts/src/helpers/constants.dart';
import 'package:silverliningspodcasts/src/pages/home.dart';
import 'package:silverliningspodcasts/src/pages/login.dart';

import 'blocs/authentication_bloc.dart';
import 'blocs/theme_cubit.dart';
import 'blocs/theme_observer.dart';
import 'helpers/theme.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Bloc.observer = ThemeObserver();
    return BlocProvider(
      create: (_) => ThemeCubit(lightTheme),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            title: 'silverliningspodcasts',
            theme: state,
            onGenerateRoute: _buildRoutes,
          );
        },
      ),
    );
  }
}

Route _buildRoutes(RouteSettings settings) {
  switch (settings.name) {
    case NavigationConstants.home:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return Home();
              }
              if (state is NotAuthenticated) {
                return Login();
              } else {
                return Login();
              }
            },
          );
        },
      );
      break;
    default:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return Home();
        },
      );
      break;
  }
}
