import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:silverliningsreddit/src/models/subreddit.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

part 'subscribed_subreddits_event.dart';
part 'subscribed_subreddits_state.dart';

class SubscribedSubredditsBloc
    extends Bloc<SubscribedSubredditsEvent, SubscribedSubredditsState> {
  SubscribedSubredditsBloc() : super(SubscribedSubredditsInitial());

  @override
  Stream<SubscribedSubredditsState> mapEventToState(
    SubscribedSubredditsEvent event,
  ) async* {
    if (event is LoadSubscribedSubreddits) {
      var subReddits = await repository.getSubreddits();
      yield SubscribedSubredditsLoaded(subReddits);
    }
  }
}
