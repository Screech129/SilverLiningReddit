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
  static const String authToken = 'auth_token';
  static const String refreshToken = 'refresh_token';
  static const String accessToken = 'code';
  static const String expiresIn = 'expires_in';
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
      'https://oauth.reddit.com'; //Change depending on environment and ngrok
  static const String authCodeUrl =
      'https://www.reddit.com/api/v1/authorize.compact?';
  static const String tokenUrl = 'https://www.reddit.com/api/v1/access_token';
  static const String responseType = 'response_type=code';
  static const String login = 'Login';
  static const String clientId = "client_id=Suk5o6ck-9F7kQ";
  static const String clientIdRaw = "Suk5o6ck-9F7kQ";
  static const String clientSecret = "12ed5e7a3fb74b5c9b60e52f0547f05c";
  static const String redirectUri =
      "redirect_uri=http://localhost:8888/callback";
  static const String redirectUriRaw = "http://localhost:8888/callback";
  static const String scopes = 'scope=*';
}

class UrlConstants {
  static const String subscribedSubs = '/subreddits/mine/subscriber';
  static const String defaulSubs = '/subreddits/default';
}

class WidgetConstants {
  static const String userName = 'Username';
  static const String password = 'Password';
  static const String thumbPrint = 'Scan thumbprint to login.';
  static const String faceId = 'Scan face to login.';
  static const String login = 'Login';
  static const String scanSuccess = 'Scan Success';
}
