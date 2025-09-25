import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();

  factory SecureStorageService() {
    return _instance;
  }

  SecureStorageService._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> save(String key, String token) async {
    await _storage.write(key: key, value: token);
  }

  Future<String?> get(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
