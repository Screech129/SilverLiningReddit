part of 'subscribed_subreddits_bloc.dart';

abstract class SubscribedSubredditsState extends Equatable {
  const SubscribedSubredditsState();

  @override
  List<Object> get props => [];
}

class SubscribedSubredditsInitialState extends SubscribedSubredditsState {}

class SubredditsLoadingState extends SubscribedSubredditsState {}

class SubscribedSubredditsLoadedState extends SubscribedSubredditsState {
  final List<Subreddit> subreddits;

  SubscribedSubredditsLoadedState(this.subreddits);
}
