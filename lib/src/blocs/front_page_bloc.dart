import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:silverliningsreddit/src/models/post.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

part 'front_page_event.dart';
part 'front_page_state.dart';

class FrontPageBloc extends Bloc<FrontPageEvent, FrontPageState> {
  FrontPageBloc() : super(FrontPageInitialState());

  @override
  Stream<FrontPageState> mapEventToState(
    FrontPageEvent event,
  ) async* {
    if (event is LoadFrontPageEvent) {
      List<Post> posts;
      try {
        posts = await repository.getFrontPage();
      } catch (e) {
        addError(e);
      }
      yield FrontPageLoadedState(posts);
    }
  }
}
