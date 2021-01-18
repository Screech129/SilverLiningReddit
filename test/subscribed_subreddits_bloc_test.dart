import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

import 'package:silverliningsreddit/src/repositories/ireposistory.dart';
import 'package:silverliningsreddit/src/widgets/auth/login_view_model.dart';

class MockRepository extends Mock implements IRepository {}

class MockLoginViewModel extends Mock implements LoginViewModel {
  MockLoginViewModel() {
    var testing = ProviderContainer();

    var here = 14;
  }
}

void main() {
  group('viewModelTest', () {
    final repository = MockRepository();
    when(repository.getToken()).thenAnswer((_) => Future.value("1234567777"));
    when(repository.getTokenExpiration())
        .thenAnswer((_) => Future.value("01/15/2021"));
    test("Testing", () async {
      var tokenTest = await repository.getToken();
      var tokenExpirationTest = await repository.getTokenExpiration();
      // final container = ProviderContainer(overrides: [
      //   token.overrideWithProvider(
      //       FutureProvider((ref) async => await repository.getToken())),
      //   tokenExpiration.overrideWithProvider(FutureProvider(
      //       (ref) async => await repository.getTokenExpiration())),
      //   loginViewModelProvider.overrideWithProvider(Provider((ref) {
      //     return MockLoginViewModel();
      //   }))
      // ]);

      // var temp = container.read(loginViewModelProvider);
      // var anotehrTemp = 14;
    });
  });
}
