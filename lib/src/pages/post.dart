import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silverliningsreddit/src/blocs/blocs.dart';
import 'package:silverliningsreddit/src/dtos/dtos.dart';
import 'package:silverliningsreddit/src/widgets/styled_scaffold.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PostNavDto navDto = ModalRoute.of(context).settings.arguments;
    return StyledScaffold(
        navDto.pageTitle, _buildBody(context, navDto), navDto.repository);
  }

  Widget _buildBody(BuildContext context, PostNavDto navDto) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostInitialState) {
          BlocProvider.of<PostBloc>(context).add(LoadPostEvent());
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: [
              Container(
                child: Text(navDto.post.title),
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(5.0),
              ),
              Divider(
                color: Colors.green,
                height: 20,
                thickness: 6,
              )
            ],
          );
        }
      },
    );
  }
}
