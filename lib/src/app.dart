import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silverliningsreddit/src/widgets/auth/auth_view_model.dart';
import 'package:silverliningsreddit/src/widgets/post.dart';

import 'helpers/helpers.dart';
import 'widgets/auth/login.dart';
import 'widgets/home/home.dart';

class App extends HookWidget {
  const App({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var homePage = useProvider(authProvider).when(
      data: (isAuthenticated) {
        if (isAuthenticated) {
          return Home();
        } else {
          return Login();
        }
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text(
        err.toString(),
        style: TextStyle(color: Colors.red),
      ),
    );
    return MaterialApp(
        title: 'silverliningsreddit',
        theme: lightTheme,
        routes: {
          NavigationConstants.home: (context) {
            return homePage;
          },
          NavigationConstants.post: (context) => PostPage(),
        });
  }
}
