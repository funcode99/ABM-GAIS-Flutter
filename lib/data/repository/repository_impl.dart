import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/employee_info_model.dart';
import 'package:gais/data/model/login_model.dart';
import 'package:gais/data/model/reference/get_city_model.dart';
import 'package:gais/data/model/reference/get_company_model.dart';
import 'package:gais/data/model/reference/get_coset_center_model.dart';
import 'package:gais/data/model/reference/get_currency_model.dart';
import 'package:gais/data/model/reference/get_department_model.dart';
import 'package:gais/data/model/reference/get_document_code_model.dart';
import 'package:gais/data/model/reference/get_employee_bysite_model.dart';
import 'package:gais/data/model/reference/get_employee_model.dart';
import 'package:gais/data/model/reference/get_flight_class_model.dart';
import 'package:gais/data/model/reference/get_hotel_model.dart';
import 'package:gais/data/model/reference/get_hotel_type_model.dart';
import 'package:gais/data/model/reference/get_job_band_model.dart';
import 'package:gais/data/model/reference/get_site_model.dart';
import 'package:gais/data/model/reference/get_status_document_model.dart';
import 'package:gais/data/model/reference/get_tlk_job_model.dart';
import 'package:gais/data/model/reference/get_traveller_type_model.dart';
import 'package:gais/data/model/reference/get_zona_byid_model.dart';
import 'package:gais/data/model/request_trip/get_airliness_vendor_model.dart';
import 'package:gais/data/model/status_document_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:gais/data/repository/repository.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();
  final storageSecure = const FlutterSecureStorage();

  @override
  Future<LoginModel> postLogin(String username, String password, {String? accessToken, String? refreshToken, String? email}) async {
    try {
      Response response = await network.dio.post(
        '/api/login',
        data: {
          "email": email,
          "username": username,
          "password": password,
          "access_token": accessToken,
          "refresh_token": refreshToken,
          "is_mobile": 1
        },
      );
      return LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      // debugPrint("error login : ${LoginModel.fromJson(e?.response?.data)}");
      //print("response error: ${e.response?.data}");
      return e.response?.data!;
    }
  }

  @override
  Future<GetHotelTypeModel> getHotelTypeList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/hotel/get_by_type",
      );
      return GetHotelTypeModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
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
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetDocumentCodeModel> getDocumentCodeList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/request_trip/get_document_code",
      );
      return GetDocumentCodeModel.fromJson(response.data);
    } on DioError catch (e) {
      print("docCode error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetCityModel> getCityList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/city/",
      );
      return GetCityModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetZonaByidModel> getZonaByIDCity(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/zona/get_by_city/$id",
      );
      return GetZonaByidModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetSiteModel> getSiteList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/site/get_data",
      );
      return GetSiteModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetHotelModel> getHotelList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/hotel/get",
      );
      return GetHotelModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetCurrencyModel> getCurrencyList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/currency/",
      );
      return GetCurrencyModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetTlkJobModel> getTLKJobByIDJob(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/zona_job/get_by_job/$id",
      );
      return GetTlkJobModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetTravellerTypeModel> getTravellerTypeList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/travel_guest/get_type_traveller",
      );
      return GetTravellerTypeModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetEmployeeModel> getEmployeeList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/employee/get",
      );
      return GetEmployeeModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetEmployeeBysiteModel> getEmployeeListBySiteID(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/employee/get_by_site/$id",
      );
      return GetEmployeeBysiteModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetDepartmentModel> getDepartmentList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/department/",
      );
      return GetDepartmentModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetCompanyModel> getCompanyList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/company/get",
      );
      return GetCompanyModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetSiteModel> getSiteListByCompanyID(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/company/get_site/$id",
      );
      return GetSiteModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetFlightClassModel> getFlightClassList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/flight_class/",
      );
      return GetFlightClassModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetStatusDocumentModel> getStatusDocument() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/menu/get_status_doc",
      );
      return GetStatusDocumentModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetJobBandModel> getJobBandList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/job_band/",
      );
      GetJobBandModel.fromJson(response.data).success.printInfo();
      return GetJobBandModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetCosetCenterModel> getCostCenterList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/company/get_cost_center/",
      );
      return GetCosetCenterModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<StatusDocumentModel> getStatusDoc() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/menu/get_status_doc",
      );
      return StatusDocumentModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetAirlinessVendorModel> getAirlinessVendorList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/flight_trip/get_vendor",
      );
      return GetAirlinessVendorModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<void> registerFCM(String token) async {
    try {
      Response response = await network.dio.post("/api/users/fcm_create", data: {"fcm_token": token});
      return Future.value();
    } on DioError catch (e) {
      e.printError();
    }
  }

  @override
  Future<void> logout() async {
    try {
      Response response = await network.dio.post("/api/users/logout", data: {"is_mobile": 1});
      return Future.value();
    } on DioError catch (e) {
      e.printError();
    }
  }

  @override
  Future<String?> getEmail(String? accessToken) async {
    try {
      Dio dio = Dio();
      dio.options =
          BaseOptions(baseUrl: "https://graph.microsoft.com/v1.0", connectTimeout: 20000, receiveTimeout: 20000, sendTimeout: 20000, headers: {
        'accept': 'application/json',
      });

      dio.options.headers['Authorization'] = 'Bearer $accessToken';
      Response response = await dio.get("/me");
      Map<String, dynamic> responseData = Map<String, dynamic>.from(response.data);
      return Future.value(responseData["mail"]);
    } on DioError catch (e) {
      e.printError();
    }
  }

  @override
  Future<EmployeeInfoModel> getProfile() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/my_profile/my_data",
      );
      return EmployeeInfoModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<Map<String, dynamic>> getLineApproval() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/my_profile/get_struktur",
      );
      return Map<String, dynamic>.from(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<String?> changePhotoProfile(String? filepath) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({});

    if (filepath != null) {
      formData.files.addAll([MapEntry("file", await MultipartFile.fromFile(filepath))]);
    }

    try {
      Response response = await network.dio.post("/api/my_profile/update_data", data: formData);

      Map<String, dynamic> responseData = Map<String, dynamic>.from(response.data);
      if (responseData.containsKey("data")) {
        Map<String, dynamic> data = Map<String, dynamic>.from(responseData["data"]);
        return Future.value(data["file_path"]);
      }

      return Future.value(null);
    } on DioError catch (e) {
      e.printError();
      print("ERROR UPDATE PROFILE $e");
      rethrow;
    }
  }
}
