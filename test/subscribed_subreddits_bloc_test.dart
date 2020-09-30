import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:silverliningsreddit/src/blocs/subscribed_subreddits_bloc.dart';

import 'package:bloc_test/bloc_test.dart';

void main() {
  group('subcribedSubredditsBloc', () {
    SubscribedSubredditsBloc subredditsBloc;

    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      subredditsBloc = SubscribedSubredditsBloc();
    });

    blocTest(
      'Contains Data',
      build: () => subredditsBloc,
      act: (bloc) => bloc.add(LoadSubscribedSubredditsEvent()),
      expect: [],
    );
  });
}
