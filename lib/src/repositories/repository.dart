import 'package:silverliningspodcasts/src/dtos/auth_response_dto.dart';
import 'package:silverliningspodcasts/src/helpers/constants.dart';
import 'package:silverliningspodcasts/src/helpers/secure_storage.dart';
import 'package:silverliningspodcasts/src/repositories/api_provider.dart';

class Repository {
  ApiProvider _apiProvider = ApiProvider();

  Future<String> getToken() async {
    var token =
        await secureStorage.storage.read(key: StorageKeyConstants.accessToken);
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

  void logout() async {
    await secureStorage.storage.delete(key: StorageKeyConstants.xsrfToken);
  }

  //Future<Podcast> searchPodcasts(String criteria) {}
}

Repository repository = Repository();
