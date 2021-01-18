import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silverliningsreddit/src/widgets/post.dart';

import 'helpers/helpers.dart';
import 'widgets/auth/login.dart';
import 'widgets/auth/login_view_model.dart';
import 'widgets/home/home.dart';

class App extends HookWidget {
  const App({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var getAuthentication =
        useProvider(loginViewModelProvider).isAuthenticated();

    return MaterialApp(
        title: 'silverliningsreddit',
        theme: lightTheme,
        routes: {
          NavigationConstants.home: (context) {
            return FutureBuilder(
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  final isAuthenticated = snapshot.data;
                  if (isAuthenticated) {
                    return Home();
                  } else {
                    return Login();
                  }
                }
              },
              future: getAuthentication,
            );
          },
          NavigationConstants.post: (context) => PostPage(),
        });
  }
}
