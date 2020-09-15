import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  FlutterSecureStorage storage;
  SecureStorage() {
    storage = FlutterSecureStorage();
  }
}

SecureStorage secureStorage = SecureStorage();
