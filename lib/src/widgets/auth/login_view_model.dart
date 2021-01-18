import 'package:hooks_riverpod/all.dart';
import 'package:silverliningsreddit/src/dtos/dtos.dart';
import 'package:silverliningsreddit/src/helpers/helpers.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

final Provider<LoginViewModel> loginViewModelProvider = Provider((ref) {
  return LoginViewModel(ref.read);
});

class LoginViewModel {
  final Reader read;
  LoginViewModel(this.read);

  Future<bool> isAuthenticated() async {
    var repo = read(repositoryProvider);
    var secureStorage = read(secureStorageProvider);

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
  }

  Future<void> saveAccessToken(String authToken) async {
    var repo = read(repositoryProvider);
    var secureStorage = read(secureStorageProvider);

    var response = await repo.getAccessToken(authToken);
    _saveTokenInfo(response, secureStorage);
    secureStorage.storage.write(
        key: StorageKeyConstants.refreshToken, value: response.refreshToken);
  }

  void saveAuthToken(String authToken) {
    var secureStorage = read(secureStorageProvider);
    secureStorage.storage
        .write(key: StorageKeyConstants.authToken, value: authToken);
  }

  void logout() {
    var repo = read(repositoryProvider);
    repo.logout();
  }

  void _saveTokenInfo(AuthResponseDto response, SecureStorage secureStorage) {
    secureStorage.storage.write(
        key: StorageKeyConstants.accessToken, value: response.accessToken);
    secureStorage.storage.write(
        key: StorageKeyConstants.expiresIn,
        value: DateTime.now()
            .add(Duration(seconds: response.expiresIn))
            .toString());
  }
}
