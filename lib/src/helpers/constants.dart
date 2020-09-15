class NavigationConstants {
  static const String home = '/';
}

class PageTitleConstants {
  static const String login = 'Login';
  static const String home = 'Home';
}

class StorageKeyConstants {
  static const String useBiometrics = 'useBiometrics';
  static const String userName = 'userName';
  static const String password = 'password';
  static const String xsrfToken = 'xsrfToken';
  static const String cookies = 'cookies';
}

class ErrorConstants {
  static const String authError =
      'Authentication failed. Check credentials and try again';
  static const String passwordRequired = ' Password is required.';
  static const String userNameRequired = ' Username is required.';
}

class NetworkConstants {
  static const String baseUrl =
      'http://33a5abfa3cad.ngrok.io/ExecuteCommand'; //Change depending on environment and ngrok
  static const String login = 'Login';
  static const String clientId = "{}";
  static const String clientSecret = "{}";
  static const String redirectUri = "{}";
}

class WidgetConstants {
  static const String userName = 'Username';
  static const String password = 'Password';
  static const String thumbPrint = 'Scan thumbprint to login.';
  static const String faceId = 'Scan face to login.';
  static const String login = 'Login';
  static const String scanSuccess = 'Scan Success';
}
