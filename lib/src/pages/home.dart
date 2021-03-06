import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silverliningsreddit/src/blocs/blocs.dart';
import 'package:silverliningsreddit/src/dtos/dtos.dart';

import 'package:silverliningsreddit/src/helpers/helpers.dart';
import 'package:silverliningsreddit/src/models/models.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';
import 'package:silverliningsreddit/src/widgets/styled_scaffold.dart';

class Home extends StatelessWidget {
  const Home(this.repository, {Key key}) : super(key: key);
  final Repository repository;
  @override
  Widget build(BuildContext context) {
    return StyledScaffold("Home", _buildBody(context), repository);
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<FrontPageBloc, FrontPageState>(
      builder: (context, state) {
        if (state is FrontPageInitialState) {
          BlocProvider.of<FrontPageBloc>(context).add(LoadFrontPageEvent());
        }
        if (state is FrontPageLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FrontPageLoadedState) {
          return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return _buildPostsItem(context, index, state.posts, repository);
              });
        }
        return Container();
      },
    );
  }

  Widget _buildPostsItem(BuildContext context, int index, List<Post> posts,
      Repository repository) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, NavigationConstants.post,
            arguments: PostNavDto(posts[index].title, repository, posts[index]))
      },
      child: Card(
        elevation: 15,
        shadowColor: Theme.of(context).accentColor,
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              posts[index].subredditNamePrefixed,
              textAlign: TextAlign.left,
            ),
            Text(posts[index].title, textAlign: TextAlign.left),
            posts[index].preview != null &&
                    posts[index].preview.images[0].resolutions.length > 0
                ? Center(
                    child: Image(
                      image: NetworkImage(posts[index].thumbnail),
                    ),
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
