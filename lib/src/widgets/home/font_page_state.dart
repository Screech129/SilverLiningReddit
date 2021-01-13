import 'package:silverliningsreddit/src/models/post.dart';
import 'package:silverliningsreddit/src/widgets/base/state_base.dart';

class FrontPageState extends LoadedState {
  final List<Post> posts;

  FrontPageState(this.posts);
}
