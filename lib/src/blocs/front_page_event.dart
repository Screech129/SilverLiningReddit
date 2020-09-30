part of 'front_page_bloc.dart';

abstract class FrontPageEvent extends Equatable {
  const FrontPageEvent();

  @override
  List<Object> get props => [];
}

class LoadFrontPageEvent extends FrontPageEvent {}

class RefreshFrontPageEvent extends FrontPageEvent {}

class FrontPagePostClickedEvent extends FrontPageEvent {}
