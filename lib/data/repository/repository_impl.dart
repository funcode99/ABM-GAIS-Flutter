import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/login_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:gais/data/repository/repository.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();
  final storageSecure = const FlutterSecureStorage();

  @override
  Future<LoginModel> postLogin(String username, String password) async {
    try {
      Response response = await network.dio.post(
        '/api/login',
        data: {
          "username": username,
          "password": password,
        },
      );
      return LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response?.data);
    }
  }
}