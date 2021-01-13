import 'package:bloc/bloc.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

import 'event_base.dart';
import 'state_base.dart';

abstract class BaseBloc extends Bloc<EventBase, StateBase> {
  BaseBloc(this._repository) : super(InitialState());

  final Repository _repository;
  List<dynamic> items;

  Future<void> getItems();

  T yieldLoadedState<T>();

  @override
  Stream<StateBase> mapEventToState(
    EventBase event,
  ) async* {
    if (event is LoadPageEvent) {
      yield LoadingState();
      try {
        await getItems();
      } catch (e) {
        addError(e);
      }
      yield yieldLoadedState();
    }
  }
}
