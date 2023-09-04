import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/antavaya/get_airport_model.dart';
import 'package:gais/data/model/antavaya/get_airport_schedule_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:gais/data/repository/antavaya/antavaya_repository.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class AntavayaImpl implements AntavayaRepository {
  final network = Get.find<NetworkCore>();
  final storageSecure = const FlutterSecureStorage();

  @override
  Future<GetAirportModel> getairport() async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/antavaya/flight/get_airport",
      );
      return GetAirportModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<GetAirportScheduleModel> getAirportSchedule(String origin,
      String destination,
      String departDate,
      String adult,
      String infant,
      String child,) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "routes[0][Origin]": origin,
      "routes[0][Destination]": destination,
      "routes[0][DepartDate]": departDate,
      "Adult": adult,
      "Infant": infant,
      "Child": child,
    });
    try {
      Response response = await network.dio.post("/api/antavaya/flight/get_trip", data: formData,);
      return GetAirportScheduleModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}
