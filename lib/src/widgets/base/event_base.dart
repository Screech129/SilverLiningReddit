import 'package:equatable/equatable.dart';

abstract class EventBase extends Equatable {
  const EventBase();

  @override
  List<Object> get props => [];
}

class LoadPageEvent extends EventBase {}

class RefreshPageEvent extends EventBase {}

class ClickedEvent extends EventBase {}
