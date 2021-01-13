import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silverliningsreddit/src/widgets/base/bloc_base.dart';
import 'package:silverliningsreddit/src/widgets/base/event_base.dart';
import 'package:silverliningsreddit/src/widgets/base/state_base.dart';

import 'package:silverliningsreddit/src/repositories/repository.dart';
import 'package:silverliningsreddit/src/widgets/scaffold/styled_scaffold.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget(this._repository, this._pageName, {Key key})
      : super(key: key);
  final Repository _repository;
  final String _pageName;
  @override
  Widget build(BuildContext context) {
    return StyledScaffold(_pageName, _buildBody(context), _repository);
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<BaseBloc, StateBase>(
      builder: (context, state) {
        if (state is InitialState) {
          onInitialState(context);
        }
        if (state is LoadingState) {
          return onLoadingState();
        }
        if (state is LoadedState) {
          return onLoadedState(state);
        }
        return Container();
      },
    );
  }

  onInitialState(BuildContext context) {
    BlocProvider.of<BaseBloc>(context).add(LoadPageEvent());
  }

  Widget onLoadedState(StateBase state) {
    return Text("Not implemented");
  }

  Center onLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
