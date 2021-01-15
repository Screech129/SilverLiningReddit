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
  return LoginViewModel();
});

class LoginViewModel {
  LoginViewModel();
}
