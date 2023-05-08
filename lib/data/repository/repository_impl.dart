import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/login_model.dart';
import 'package:gais/data/model/request_trip/request_trip_list_model.dart';
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
      // debugPrint("error login : ${LoginModel.fromJson(e?.response?.data)}");
      return e.response?.data!;
    }
  }

  @override
  FutureOr<RequestTripListModel> getRequestTripList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/request_trip/",
        queryParameters: {"tenant_id": 0},
      );
      return RequestTripListModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}