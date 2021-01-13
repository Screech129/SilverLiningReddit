import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silverliningsreddit/src/widgets/scaffold/subscribed_subreddits_bloc.dart';
import 'package:silverliningsreddit/src/models/models.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';
import 'package:silverliningsreddit/src/widget_templates/navigation_drawer.dart';

class StyledScaffold extends StatelessWidget {
  final String pageTitle;
  final Widget body;
  final bool showAppDrawer;
  final Repository repository;
  StyledScaffold(this.pageTitle, this.body, this.repository,
      {this.showAppDrawer = true});
  @override
  Widget build(BuildContext context) {
    List<Subreddit> subs;

    return BlocProvider(
      create: (context) => SubscribedSubredditsBloc(repository),
      child: BlocBuilder<SubscribedSubredditsBloc, SubscribedSubredditsState>(
        builder: (context, state) {
          if (showAppDrawer) {
            if (state is SubscribedSubredditsInitialState) {
              BlocProvider.of<SubscribedSubredditsBloc>(context)
                  .add(LoadSubscribedSubredditsEvent());
            }
            if (state is SubscribedSubredditsLoadedState) {
              subs = state.subreddits;
            }
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
      title: Text(pageTitle),
      centerTitle: true,
    );
  }
}
