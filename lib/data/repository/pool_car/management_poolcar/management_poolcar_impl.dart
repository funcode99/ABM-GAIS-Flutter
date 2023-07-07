import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/pool_car/management_poolcar/get_car_byid_model.dart';
import 'package:gais/data/model/pool_car/management_poolcar/get_car_list_model.dart';
import 'package:gais/data/model/pool_car/management_poolcar/get_car_type_model.dart';
import 'package:gais/data/model/pool_car/management_poolcar/get_driver_model.dart';
import 'package:gais/data/model/pool_car/management_poolcar/save_car_model.dart';
import 'package:gais/data/model/pool_car/management_poolcar/update_car_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:gais/data/repository/pool_car/management_poolcar/management_poolcar_repository.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class ManagementPoolCarImpl implements ManagementPoolCarRepository {
  final network = Get.find<NetworkCore>();
  final storageSecure = const FlutterSecureStorage();

  @override
  Future<GetCarTypeModel> getCarTypeList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      Response response = await network.dio.get(
        "/api/car/get_type",
      );
      return GetCarTypeModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<GetDriverModel> getDriverList() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      Response response = await network.dio.get(
        "/api/car/get_driver",
      );
      return GetDriverModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future delete(int id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      Response response = await network.dio.delete(
        "/api/car/delete_data/$id",
      );
      return response.data;
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<GetCarListModel> getList(
    int perPage,
    int page,
    String? search,
    int? companyID,
    int? siteID,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    search.printInfo(info: "search");
    companyID.printInfo(info: "companyID");
    siteID.printInfo(info: "siteID");
    try {
      Response response = await network.dio.get(
        "/api/car/get/",
        queryParameters: {
          "perPage": perPage,
          "page": page,
          "search": search,
          "id_company": companyID,
          "id_site": siteID,
        },
      );
      return GetCarListModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return e.response?.data;
    }
  }

  @override
  Future<SaveCarModel> save(
    String carName,
    String companyID,
    String siteID,
    String plate,
    String carTypeID,
    String driverID,
    String odometer,
    String transmisi,
    String status,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "car_name": carName,
      "id_company": companyID,
      "id_site": siteID,
      "plate": plate,
      "id_car_type": carTypeID,
      "id_driver": driverID,
      "odometer": odometer,
      "transmisi": transmisi,
      "status": status,
    });

    try {
      Response response = await network.dio.post(
        "/api/car/store",
        data: formData,
      );
      return SaveCarModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return SaveCarModel.fromJson(e.message);
    }
  }

  @override
  Future<UpdateCarModel> update(
    int id,
    String carName,
    String companyID,
    String siteID,
    String plate,
    String carTypeID,
    String driverID,
    String odometer,
    String transmisi,
    String status,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "car_name": carName,
      "id_company": companyID,
      "id_site": siteID,
      "plate": plate,
      "id_driver": driverID,
      "id_car_type": carTypeID,
      "odometer": odometer,
      "transmisi": transmisi,
      "status": status,
    });

    try {
      Response response = await network.dio.post(
        "/api/car/update_data/$id",
        data: formData,
      );
      return UpdateCarModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return UpdateCarModel.fromJson(e.message);
    }
  }

  @override
  Future<GetCarByidModel> getByID(int id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      Response response = await network.dio.get(
        "/api/car/get/$id",
      );
      return GetCarByidModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}
