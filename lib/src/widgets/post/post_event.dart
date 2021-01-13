part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class LoadPostEvent extends PostEvent {
  final String subreddit;
  final String postId;
  LoadPostEvent(this.subreddit, this.postId);
}
