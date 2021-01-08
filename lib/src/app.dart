import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:silverliningsreddit/src/pages/home.dart';
import 'package:silverliningsreddit/src/pages/login.dart';
import 'package:silverliningsreddit/src/pages/post.dart';

import 'helpers/helpers.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Bloc.observer = AppBlocObserver();
    return BlocProvider(
      create: (_) => ThemeCubit(lightTheme),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            title: 'silverliningsreddit',
            theme: state,
            routes: {
              NavigationConstants.home: (context) {
                return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticatedState) {
                      return BlocProvider(
                          create: (context) => FrontPageBloc(_repository),
                          child: Home(_repository));
                    }
                    if (state is NotAuthenticatedState) {
                      return Login();
                    } else {
                      return Login();
                    }
                  },
                );
              },
              NavigationConstants.post: (context) => PostPage(),
            },
          );
        },
      ),
    );
  }
}
