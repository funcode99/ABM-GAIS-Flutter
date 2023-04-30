import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageCore {
  final storage = const FlutterSecureStorage();

  void saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  void saveId(String id) async {
    await storage.write(key: 'id', value: id);
  }

  void saveRole(String role) async {
    await storage.write(key: 'role', value: role);
  }

  void deleteToken() async {
    await storage.delete(key: 'token');
    await storage.deleteAll();
  }

  Future<String?> readToken() async {
    var token = await storage.read(key: 'token');
    return token;
  }

  Future<String?> readRole() async {
    var role = await storage.read(key: 'role');
    return role;
  }

  Future<bool> ensureStorageReady() async {
    return await storage.read(key: 'token') != null;
  }
}
