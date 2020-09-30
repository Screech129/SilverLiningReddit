import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silverliningsreddit/src/blocs/subscribed_subreddits_bloc.dart';
import 'package:silverliningsreddit/src/models/models.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';
import 'package:silverliningsreddit/src/widgets/navigation_drawer.dart';

class StyledScaffold extends StatelessWidget {
  final String pageTtile;
  final Widget body;
  final bool showAppDrawer;
  final BuildContext context;
  StyledScaffold(this.pageTtile, this.body, this.context,
      {this.showAppDrawer = true});
  @override
  Widget build(BuildContext context) {
    List<Subreddit> subs;

    return BlocProvider(
      create: (context) =>
          SubscribedSubredditsBloc(context.repository<Repository>()),
      child: BlocBuilder<SubscribedSubredditsBloc, SubscribedSubredditsState>(
        builder: (context, state) {
          if (state is SubscribedSubredditsInitialState) {
            BlocProvider.of<SubscribedSubredditsBloc>(context)
                .add(LoadSubscribedSubredditsEvent());
          }
          if (state is SubscribedSubredditsLoadedState) {
            subs = state.subreddits;
          }
          return Scaffold(
            appBar: _buildAppbar(context),
            body: body,
            drawer: showAppDrawer ? NavigationDrawer(subs) : null,
          );
        },
      ),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(pageTtile),
      centerTitle: true,
    );
  }
}
