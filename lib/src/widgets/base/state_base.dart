import 'package:equatable/equatable.dart';

class StateBase extends Equatable {
  const StateBase();

  @override
  List<Object> get props => [];
}

class InitialState extends StateBase {}

class LoadingState extends StateBase {}

class LoadedState extends StateBase {}

class ErrorState extends StateBase {}
