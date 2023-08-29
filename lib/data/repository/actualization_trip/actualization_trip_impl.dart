import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/actualization_trip/get_activities_byactualid_model.dart';
import 'package:gais/data/model/actualization_trip/get_actual_bytripid_model.dart';
import 'package:gais/data/model/actualization_trip/get_actual_trip_model.dart';
import 'package:gais/data/model/actualization_trip/get_all_actualization_trip_model.dart';
import 'package:gais/data/model/actualization_trip/get_trip_info_byactualid_model.dart';
import 'package:gais/data/model/actualization_trip/save_activities_model.dart';
import 'package:gais/data/model/actualization_trip/save_actual_trip_model.dart';
import 'package:gais/data/model/actualization_trip/save_trip_info_model.dart';
import 'package:gais/data/model/actualization_trip/update_activites_model.dart';
import 'package:gais/data/model/actualization_trip/update_actual_trip_model.dart';
import 'package:gais/data/model/actualization_trip/update_trip_info_model.dart';
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

  @override
  Future<GetTripInfoByactualidModel> getTripInfoByActual(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/actual_trip/get_trip_by_id/$id",
      );
      return GetTripInfoByactualidModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<GetActivitiesByactualidModel> getActivitiesByActual(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/actual_trip/get_activities_by_id/$id",
      );
      return GetActivitiesByactualidModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<SaveTripInfoModel> saveTripInfo(
    String idActual,
    String dateDeparture,
    String dateArrival,
    String idCityFrom,
    String idCityTo,
    String idZona,
    String tlkRate,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_act": idActual,
      "date_departure": dateDeparture,
      "date_arrival": dateArrival,
      "id_city_from": idCityFrom,
      "id_city_to": idCityTo,
      "id_zona": idZona,
      "tlk_rate": tlkRate,
    });
    try {
      Response response = await network.dio.post(
        "/api/actual_trip/store_trip_info",
        data: formData,
      );
      return SaveTripInfoModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<SaveActivitiesModel> saveActivities(
    String idActual,
    String actDate,
    String activities,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_act": idActual,
      "act_date": actDate,
      "activities": activities,
    });
    try {
      Response response = await network.dio.post(
        "/api/actual_trip/store_activities",
        data: formData,
      );
      return SaveActivitiesModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<UpdateTripInfoModel> updateTripInfo(
    String id,
    String idActual,
    String dateDeparture,
    String dateArrival,
    String idCityFrom,
    String idCityTo,
    String idZona,
    String tlkRate,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_act": idActual,
      "date_departure": dateDeparture,
      "date_arrival": dateArrival,
      "id_city_from": idCityFrom,
      "id_city_to": idCityTo,
      "id_zona": idZona,
      "tlk_rate": tlkRate,
    });
    try {
      Response response = await network.dio.post(
        "/api/actual_trip/update_trip_info/$id",
        data: formData,
      );
      return UpdateTripInfoModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetTripInfoByactualidModel> getTripInfoByID(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/actual_trip/get_trip_info/$id",
      );
      return GetTripInfoByactualidModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future deleteTripInfoByID(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.delete(
        "/api/actual_trip/delete_trip/$id",
      );
      return response.data;
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<GetActivitiesByactualidModel> getActivitiesByID(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/actual_trip/get_activities/$id",
      );
      return GetActivitiesByactualidModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error : ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<UpdateActivitiesModel> updateActivities(
    String id,
    String idActual,
    String actDate,
    String activities,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_act": idActual,
      "act_date": actDate,
      "activities": activities,
    });
    try {
      Response response = await network.dio.post(
        "/api/actual_trip/update_activities/$id",
        data: formData,
      );
      return UpdateActivitiesModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future deleteActivitiesByID(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.delete(
        "/api/actual_trip/delete_activities/$id",
      );
      return response.data;
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future submitActualizationTripByID(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.post(
        "/api/actual_trip/delete_activities/$id",
      );
      return response.data;
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<UpdateActualTripModel> updateActualizationTrip(
    String id,
    String idRequestTrip,
    String purpose,
    String totalTLK,
    String notes,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_request_trip": idRequestTrip,
      "purpose": purpose,
      "total_tlk": totalTLK,
      "notes": notes,
    });
    try {
      Response response = await network.dio.post(
        "/api/actual_trip/update_data/$id",
        data: formData,
      );
      return UpdateActualTripModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error : ${e.response?.data}");
      return e.error;
    }
  }

  @override
  Future<GetActualTripModel> getActualTripByID(String id) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.get(
        "/api/actual_trip/get_data/$id",
      );
      return GetActualTripModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  Future<GetAllActualizationTripModel> getActualTripList(
    String perPage,
    String search,
    String status,
    String page,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    search.printInfo(info: "search ");
    status.printInfo(info: "status");
    try {
      Response response = await network.dio.get(
        "/api/actual_trip/get_data/",
        queryParameters: {
          "perPage": perPage,
          "page": page,
          "search": search,
          "status": status,
        },
      );
      print("response : ${response.data}");
      return GetAllActualizationTripModel.fromJson(response.data);
    } on DioError catch (e) {
      //print("response error: ${e.response?.data}");
      return GetAllActualizationTripModel.fromJson(e.response?.data);
    }
  }
}
