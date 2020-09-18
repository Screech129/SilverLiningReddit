import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silverliningsreddit/src/blocs/subscribed_subreddits_bloc.dart';
import 'package:silverliningsreddit/src/models/subreddit.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscribedSubredditsBloc, SubscribedSubredditsState>(
        builder: (context, state) {
      if (state is SubscribedSubredditsInitial) {
        BlocProvider.of<SubscribedSubredditsBloc>(context)
            .add(LoadSubscribedSubreddits());
      }
      if (state is SubscribedSubredditsLoaded) {
        var subs = state.subreddits;

        return Drawer(
            child: ListView.builder(
                itemCount: subs.length,
                itemBuilder: (context, index) {
                  return _buildListTile(context, index, subs);
                }));
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  _buildListTile(BuildContext context, int index, List<Subreddit> subs) {
    return ListTile(
      title: Text(subs[index].displayNamePrefixed),
    );
  }
}
