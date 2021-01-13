import 'package:silverliningsreddit/src/repositories/repository.dart';
import 'package:silverliningsreddit/src/widgets/base/bloc_base.dart';
import 'package:silverliningsreddit/src/widgets/base/state_base.dart';

import 'font_page_state.dart';

class FrontPageBloc extends BaseBloc {
  FrontPageBloc(this._repository) : super(_repository);

  final Repository _repository;

  @override
  Future<void> getItems() async {
    items = await _repository.getFrontPage();
  }

  @override
  FrontPageState yieldLoadedState<FrontPageState>() {
    return new FrontPageState(items);
  }
}
