import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/employee_info_model.dart';
import 'package:gais/data/model/login_model.dart';
import 'package:gais/data/model/reference/get_city_model.dart';
import 'package:gais/data/model/reference/get_zona_model.dart';
import 'package:gais/data/model/request_trip/get_document_code_model.dart';
import 'package:gais/data/model/request_trip/request_trip_list_model.dart';
import 'package:gais/data/model/request_trip/save_purpose_of_trip_model.dart';
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

  @override
  Future<EmployeeInfoModel> getEmployeeInfo() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/employee/get_by_login",
      );
      return EmployeeInfoModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  FutureOr<GetDocumentCodeModel> getDocumentCodeList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/request_trip/get_document_code",
      );
      return GetDocumentCodeModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  FutureOr<GetCityModel> getCityList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/city/",
      );
      return GetCityModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  FutureOr<GetZonaModel> getZonaList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/zona/",
      );
      return GetZonaModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<SavePurposeOfTripModel> savePurposeOfTrip(
    String employeeID,
    String noRequestTrip,
    String codeDocument,
    String siteID,
    String notes,
    String fromCity,
    String toCity,
    String departureDate,
    String arrivalDate,
    String zonaID,
    String tlkDay,
    String tlkTotal,
    File? file,
  ) async {
    try {
      var formData = FormData.fromMap({
        "id_employee": employeeID,
        "no_request_trip": noRequestTrip,
        "code_document": codeDocument,
        "id_site": siteID,
        "notes": notes,
        "id_city_from": fromCity,
        "id_city_to": toCity,
        "date_departure": departureDate,
        "date_arrival": arrivalDate,
        "id_zona": zonaID,
        "tlk_per_day": tlkDay,
        "total_tlk": tlkTotal,
      });

      if (file != null) {
        formData.files.addAll(
            [MapEntry("file", await MultipartFile.fromFile(file.path))]);
      }
      print("file : $file");

      var token = await storageSecure.read(key: "token");
      network.dio.options.headers['Authorization'] = 'Bearer $token';

      Response response = await network.dio.post(
        "/api/request_trip/store",
        data: formData,
      );
      return SavePurposeOfTripModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}
