part of 'subscribed_subreddits_bloc.dart';

abstract class SubscribedSubredditsEvent extends Equatable {
  const SubscribedSubredditsEvent();

  @override
  List<Object> get props => [];
}

class LoadSubscribedSubreddits extends SubscribedSubredditsEvent {}

class RefreshSubreddit extends SubscribedSubredditsEvent {}
