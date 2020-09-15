import 'package:flutter/material.dart';
import 'package:silverliningspodcasts/src/widgets/navigation_drawer.dart';

class StyledScaffold extends StatelessWidget {
  final String pageTtile;
  final Widget body;
  final bool showAppDrawer;
  StyledScaffold(this.pageTtile, this.body, {this.showAppDrawer = true});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: body,
      drawer: showAppDrawer ? NavigationDrawer() : null,
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(pageTtile),
      centerTitle: true,
    );
  }
}
