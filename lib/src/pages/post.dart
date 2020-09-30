import 'package:flutter/material.dart';
import 'package:silverliningsreddit/src/dtos/dtos.dart';
import 'package:silverliningsreddit/src/widgets/styled_scaffold.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PostNavDto navDto = ModalRoute.of(context).settings.arguments;
    return StyledScaffold(
        navDto.pageTitle, _buildBody(context), navDto.repository);
  }

  Widget _buildBody(BuildContext context) {}
}
