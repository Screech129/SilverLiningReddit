import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silverliningsreddit/src/dtos/dtos.dart';
import 'package:silverliningsreddit/src/helpers/helpers.dart';
import 'package:silverliningsreddit/src/models/models.dart';

final repositoryProvider = Provider((ref) {
  return Repository(ref.read(secureStorageProvider));
});

class Repository {
  SecureStorage secureStorage;
  Repository(SecureStorage secureStorage) {
    this.secureStorage = secureStorage;
  }

  Future<String> getToken() async {
    var token =
        await secureStorage.storage.read(key: StorageKeyConstants.accessToken);
    return token;
  }

  Future<String> getRefreshToken() async {
    var token =
        await secureStorage.storage.read(key: StorageKeyConstants.refreshToken);
    return token;
  }

  Future<String> getTokenExpiration() async {
    var tokenExpiration =
        await secureStorage.storage.read(key: StorageKeyConstants.expiresIn);
    return tokenExpiration;
  }

  Future<AuthResponseDto> getAccessToken(String authToken) async {
    return await _apiProvider.getAccessToken(authToken);
  }

  Future<AuthResponseDto> refreshAccessToken(String refreshToken) async {
    return await _apiProvider.refreshAccessToken(refreshToken);
  }

  void logout() async {
    await secureStorage.storage.delete(key: StorageKeyConstants.xsrfToken);
  }

  Future<List<Subreddit>> getSubscribedSubreddits() async {
    var token = await getToken();
    return await _apiProvider.getSubscribedSubreddits(token);
  }

  Future<List<Post>> getFrontPage() async {
    var token = await getToken();
    return await _apiProvider.getFrontPage(token);
  }

  Future<List<String>> getComments(String subreddit, String postId) async {
    var token = await getToken();
    return await _apiProvider.getComments(subreddit, postId, token);
  }
}
