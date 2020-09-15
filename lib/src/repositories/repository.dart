import 'package:sparkitecture/src/helpers/constants.dart';
import 'package:sparkitecture/src/helpers/secure_storage.dart';
import 'package:sparkitecture/src/models/user.dart';
import 'package:sparkitecture/src/repositories/api_provider.dart';

class Repository {
  ApiProvider _apiProvider = ApiProvider();

  Future<String> getToken() async {
    var token =
        await secureStorage.storage.read(key: StorageKeyConstants.xsrfToken);
    return token;
  }

  Future<User> login(String userName, String password) async {
    var user = await _apiProvider.login(userName, password);
    return user;
  }

  void logout() async {
    await secureStorage.storage.delete(key: StorageKeyConstants.xsrfToken);
  }

  //Future<Podcast> searchPodcasts(String criteria) {}
}

Repository repository = Repository();
