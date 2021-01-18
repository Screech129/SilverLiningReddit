import 'package:flutter/material.dart';

import 'package:silverliningsreddit/src/dtos/dtos.dart';
import 'package:silverliningsreddit/src/widget_templates/scaffold/styled_scaffold.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PostNavDto navDto = ModalRoute.of(context).settings.arguments;
    return StyledScaffold(navDto.pageTitle, _buildBody(context, navDto));
  }

  Widget _buildBody(BuildContext context, PostNavDto navDto) {
    // BlocProvider.of<PostBloc>(context)
    //     .add(LoadPostEvent(navDto.post.subreddit, navDto.post.id));
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  //  else {
  //   return Column(
  //     children: [
  //       Container(
  //         child: Text(navDto.post.title),
  //         padding: EdgeInsets.all(5.0),
  //         margin: EdgeInsets.all(5.0),
  //       ),
  //       Divider(
  //         color: Colors.green,
  //         height: 20,
  //         thickness: 6,
  //       )
  //     ],
  //   );
  // }
}
