import 'package:silverliningsreddit/src/dtos/dtos.dart';
import 'package:silverliningsreddit/src/models/models.dart';

abstract class IRepository {
  Future<String> getToken();

  Future<String> getRefreshToken();

  Future<String> getTokenExpiration();

  Future<AuthResponseDto> getAccessToken(String authToken);

  Future<AuthResponseDto> refreshAccessToken(String refreshToken);

  void logout();

  Future<List<Subreddit>> getSubscribedSubreddits();

  Future<List<Post>> getFrontPage();

  Future<List<String>> getComments(String subreddit, String postId);
}
