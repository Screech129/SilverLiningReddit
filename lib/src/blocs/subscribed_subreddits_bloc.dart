import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:silverliningsreddit/src/models/models.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

part 'subscribed_subreddits_event.dart';
part 'subscribed_subreddits_state.dart';

class SubscribedSubredditsBloc
    extends Bloc<SubscribedSubredditsEvent, SubscribedSubredditsState> {
  SubscribedSubredditsBloc(this._repository)
      : super(SubscribedSubredditsInitialState());

  final Repository _repository;

  @override
  Stream<SubscribedSubredditsState> mapEventToState(
    SubscribedSubredditsEvent event,
  ) async* {
    if (event is LoadSubscribedSubredditsEvent) {
      yield SubscribedSubredditsLoadingState();
      try {
        var subReddits = await _repository.getSubscribedSubreddits();
        yield SubscribedSubredditsLoadedState(subReddits);
      } catch (e) {
        yield SubscribedSubredditsFaieldState();
      }
    }
  }
}
