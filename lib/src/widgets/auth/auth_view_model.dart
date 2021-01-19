import 'package:hooks_riverpod/all.dart';
import 'package:silverliningsreddit/src/dtos/dtos.dart';
import 'package:silverliningsreddit/src/helpers/helpers.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

final authProvider = FutureProvider<bool>((ref) async {
  var repo = ref.read(repositoryProvider);
  var secureStorage = ref.read(secureStorageProvider);

  var token = await repo.getToken();
  var tokenExpiration = await repo.getTokenExpiration();

  if (token != null) {
    if (DateTime.parse(tokenExpiration).isBefore(DateTime.now())) {
      final String refreshToken = await repo.getRefreshToken();
      var response = await repo.refreshAccessToken(refreshToken);
      _saveTokenInfo(response, secureStorage);
      return true;
    }
    return true;
  }
  return false;
});

void _saveTokenInfo(AuthResponseDto response, SecureStorage secureStorage) {
  secureStorage.storage
      .write(key: StorageKeyConstants.accessToken, value: response.accessToken);
  secureStorage.storage.write(
      key: StorageKeyConstants.expiresIn,
      value:
          DateTime.now().add(Duration(seconds: response.expiresIn)).toString());
}
