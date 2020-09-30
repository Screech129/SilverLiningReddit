import 'package:silverliningsreddit/src/models/post.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

class PostNavDto {
  final String pageTitle;
  final Repository repository;
  final Post post;
  PostNavDto(this.pageTitle, this.repository, this.post);
}
