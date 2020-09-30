import 'package:flutter/material.dart';
import 'package:silverliningsreddit/src/models/models.dart';

class NavigationDrawer extends StatelessWidget {
  final List<Subreddit> subs;
  NavigationDrawer(this.subs);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: subs.length,
        itemBuilder: (context, index) {
          return _buildListTile(context, index, subs);
        },
      ),
    );
  }

  _buildListTile(BuildContext context, int index, List<Subreddit> subs) {
    return ListTile(
      title: Text(subs[index].displayNamePrefixed),
    );
  }
}
