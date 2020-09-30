import 'package:silverliningsreddit/src/dtos/dtos.dart';
import 'package:silverliningsreddit/src/helpers/helpers.dart';
import 'package:silverliningsreddit/src/models/models.dart';
import 'package:silverliningsreddit/src/repositories/api_provider.dart';

class Repository {
  ApiProvider _apiProvider = ApiProvider();

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
}
