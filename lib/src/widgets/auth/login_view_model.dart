import 'package:hooks_riverpod/all.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

final token = FutureProvider<String>((ref) async {
  var repository = ref.read(repositoryProvider);
  return await repository.getToken();
});

final tokenExpiration = FutureProvider<String>((ref) async {
  var repository = ref.read(repositoryProvider);
  return await repository.getTokenExpiration();
});

final loginViewModelProvider = Provider((ref) {
  return LoginViewModel(ref.read(token), ref.read(tokenExpiration));
});

class LoginViewModel {
  String token;
  String tokenExpiration;
  LoginViewModel(AsyncValue<String> token, AsyncValue<String> tokenExpiration) {
    this.token = token.data.value;
    this.tokenExpiration = tokenExpiration.data.value;
  }
}
