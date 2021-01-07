import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(this._repository) : super(PostInitialState());

  final Repository _repository;

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is LoadPostEvent) {
      var postComments =
          await _repository.getComments(event.subreddit, event.postId);
      var temp = postComments;
    }
  }
}
