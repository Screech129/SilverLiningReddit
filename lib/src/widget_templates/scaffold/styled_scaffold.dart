import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silverliningsreddit/src/widget_templates/scaffold/scaffold_view_model.dart';

import '../navigation_drawer.dart';

class StyledScaffold extends HookWidget {
  final String pageTitle;
  final Widget body;
  final bool showAppDrawer;
  StyledScaffold(this.pageTitle, this.body, {this.showAppDrawer = true});
  @override
  Widget build(BuildContext context) {
    final subreddits = useProvider(subredditProvider);

    return subreddits.when(
      data: (subs) => Scaffold(
        appBar: _buildAppbar(context),
        body: body,
        drawer: showAppDrawer ? NavigationDrawer(subs) : null,
      ),
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text(
        err.toString(),
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(pageTitle),
      centerTitle: true,
    );
  }
}
