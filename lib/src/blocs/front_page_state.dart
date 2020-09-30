part of 'front_page_bloc.dart';

abstract class FrontPageState extends Equatable {
  const FrontPageState();

  @override
  List<Object> get props => [];
}

class FrontPageInitialState extends FrontPageState {}

class FrontPageLoadedState extends FrontPageState {
  final List<Post> posts;

  FrontPageLoadedState(this.posts);
}

class FrontPageRefreshingState extends FrontPageState {}
