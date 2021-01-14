import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:silverliningsreddit/src/dtos/dtos.dart';

import 'package:silverliningsreddit/src/helpers/helpers.dart';
import 'package:silverliningsreddit/src/models/models.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';
import 'package:silverliningsreddit/src/widget_templates/scaffold/styled_scaffold.dart';
import 'package:silverliningsreddit/src/widgets/home/home_view_model.dart';

class Home extends HookWidget {
  const Home(this.repository, {Key key}) : super(key: key);
  final Repository repository;
  @override
  Widget build(BuildContext context) {
    return StyledScaffold("Home", _buildBody(context), repository);
  }

  _buildBody(BuildContext context) {
    final posts = useProvider(postProvider);
    return posts.when(
      data: (posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return _buildPostsItem(context, index, posts, repository);
        },
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) => Text(
        err.toString(),
        style: TextStyle(color: Colors.red),
      ),
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
