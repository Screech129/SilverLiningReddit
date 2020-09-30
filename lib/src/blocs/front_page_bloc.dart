import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:silverliningsreddit/src/models/models.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

part 'front_page_event.dart';
part 'front_page_state.dart';

class FrontPageBloc extends Bloc<FrontPageEvent, FrontPageState> {
  FrontPageBloc(this._repository) : super(FrontPageInitialState());

  final Repository _repository;

  @override
  Stream<FrontPageState> mapEventToState(
    FrontPageEvent event,
  ) async* {
    if (event is LoadFrontPageEvent) {
      List<Post> posts;
      try {
        posts = await _repository.getFrontPage();
      } catch (e) {
        addError(e);
      }
      yield FrontPageLoadedState(posts);
    }
  }
}
