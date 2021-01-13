import 'package:flutter/material.dart';
import 'package:silverliningsreddit/src/dtos/dtos.dart';
import 'package:silverliningsreddit/src/widgets/base/state_base.dart';

import 'package:silverliningsreddit/src/helpers/helpers.dart';
import 'package:silverliningsreddit/src/models/models.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';
import 'package:silverliningsreddit/src/widgets/base/widget_base.dart';

import 'font_page_state.dart';

class Home extends BaseWidget {
  const Home(this.repository, {Key key}) : super(repository, "Home");
  final Repository repository;

  @override
  onLoadedState(LoadedState state) {
    var frontPageState = (FrontPageState) state;

    return ListView.builder(
        itemCount: frontPageState.posts.length,
        itemBuilder: (context, index) {
          return _buildPostsItem(
              context, index, frontPageState.posts, repository);
        });
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
