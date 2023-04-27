import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageCore {
  final storage = const FlutterSecureStorage();

  void saveToken (String token) async {
    await storage.write(key: 'token', value: token);
  }

  void saveId (String id) async {
    await storage.write(key: 'id', value: id);
  }

  void deleteToken () async {
    await storage.delete(key: 'token');
  }

  Future<String?> readToken () async {
    var token = await storage.read(key: 'token');
    return token;
  }
}