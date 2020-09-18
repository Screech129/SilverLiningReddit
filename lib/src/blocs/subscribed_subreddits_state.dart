part of 'subscribed_subreddits_bloc.dart';

abstract class SubscribedSubredditsState extends Equatable {
  const SubscribedSubredditsState();

  @override
  List<Object> get props => [];
}

class SubscribedSubredditsInitial extends SubscribedSubredditsState {}

class SubredditsLoading extends SubscribedSubredditsState {}

class SubscribedSubredditsLoaded extends SubscribedSubredditsState {
  final List<Subreddit> subreddits;

  SubscribedSubredditsLoaded(this.subreddits);
}

class SubredditsRefreshing extends SubscribedSubredditsState {}
