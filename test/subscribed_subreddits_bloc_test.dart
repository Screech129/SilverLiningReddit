import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:silverliningsreddit/src/models/models.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';
import 'package:silverliningsreddit/src/widgets/scaffold/subscribed_subreddits_bloc.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  group('subcribedSubredditsBloc', () {
    SubscribedSubredditsBloc subredditsBloc;
    Repository repository;

    setUp(() {
      repository = MockRepository();
      subredditsBloc = SubscribedSubredditsBloc(repository);
    });

    blocTest(
      'Faield state returned if getting subscribed subs fails',
      build: () {
        when(repository.getSubscribedSubreddits())
            .thenThrow(Exception('failure'));
        return subredditsBloc;
      },
      act: (bloc) => bloc.add(LoadSubscribedSubredditsEvent()),
      expect: <SubscribedSubredditsState>[
        SubscribedSubredditsLoadingState(),
        SubscribedSubredditsFaieldState()
      ],
    );

    blocTest(
      'Returns loaded state if succesful',
      build: () => subredditsBloc,
      act: (bloc) => bloc.add(LoadSubscribedSubredditsEvent()),
      expect: <SubscribedSubredditsState>[
        SubscribedSubredditsLoadingState(),
        SubscribedSubredditsLoadedState(List<Subreddit>())
      ],
    );
  });
}
