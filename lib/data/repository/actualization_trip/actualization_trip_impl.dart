import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/actualization_trip/get_actual_bytripid_model.dart';
import 'package:gais/data/model/actualization_trip/save_actual_trip_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:gais/data/repository/actualization_trip/actualization_trip_repository.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class ActualizationTripImpl implements ActualizationTripRepository {
  final network = Get.find<NetworkCore>();
  final storageSecure = const FlutterSecureStorage();

  @override
  Future<GetActualBytripidModel> getActualBytripID(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/actual_trip/get_by_id_trip/$id",
      );
      return GetActualBytripidModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<SaveActualTripModel> saveActualizationTrip(
    String idRequestTrip,
    String tripDepartureDate,
    String tripArrivalDate,
    String tripCityFrom,
    String tripCityTo,
    String tripZona,
    String tripTLKRate,
    String purpose,
    String activityDate,
    String activities,
    String totalTLK,
    String notes,
    String idEmployee,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_request_trip": idRequestTrip,
      "array_trip[0][date_departure]": tripDepartureDate,
      "array_trip[0][date_arrival]": tripArrivalDate,
      "array_trip[0][id_city_from]": tripCityFrom,
      "array_trip[0][id_city_to]": tripCityTo,
      "array_trip[0][id_zona]": tripZona,
      "array_trip[0][tlk_rate]": tripTLKRate,
      "purpose": purpose,
      "array_activities[0][act_date]": activityDate,
      "array_activities[0][activities]": activities,
      "total_tlk": totalTLK,
      "notes": notes,
      "id_employee": idEmployee,
    });
    try {
      Response response = await network.dio.post(
        "/api/actual_trip/store",
        data: formData,
      );
      return SaveActualTripModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error : ${e.response?.data}");
      return e.error;
    }
  }
}
