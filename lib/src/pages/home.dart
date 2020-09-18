import 'package:flutter/material.dart';
import 'package:silverliningsreddit/src/widgets/styled_scaffold.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StyledScaffold("Home", _buildBody(context));
  }

  _buildBody(BuildContext context) {}
}
