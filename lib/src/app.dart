import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:silverliningsreddit/src/repositories/repository.dart';
import 'package:silverliningsreddit/src/styles/theme_cubit.dart';
import 'package:silverliningsreddit/src/styles/theme_observer.dart';
import 'package:silverliningsreddit/src/widgets/auth/authentication_bloc.dart';
import 'package:silverliningsreddit/src/widgets/base/bloc_base.dart';
import 'package:silverliningsreddit/src/widgets/home/home.dart';
import 'package:silverliningsreddit/src/widgets/auth/login.dart';
import 'package:silverliningsreddit/src/widgets/post/post.dart';

import 'helpers/helpers.dart';

class App extends StatelessWidget {
  const App(this._repository, {Key key}) : super(key: key);
  final Repository _repository;
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
                          create: (context) => BaseBloc(_repository),
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
