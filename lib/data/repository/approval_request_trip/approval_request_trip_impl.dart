import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/approval_request_trip/get_approval_request_trip_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:gais/data/repository/approval_request_trip/approval_request_trip_repository.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class ApprovalRequestTripImpl implements ApprovalRequestTripRepository {
  final network = Get.find<NetworkCore>();
  final storageSecure = const FlutterSecureStorage();

  @override
  Future<GetApprovalRequestTripModel> getList(
    int perPage,
    int page,
    String? search,
    String? startDate,
    String? endDate,
    String? codeStatusDoc,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    search.printInfo(info: "search");
    startDate.printInfo(info: "star date");
    endDate.printInfo(info: "end date");
    try {
      Response response = await network.dio.get(
        "/api/approval_request_trip/get_data",
        // queryParameters: {
        //   "perPage": perPage,
        //   "page": page,
        //   "search": search,
        //   "start_date": startDate,
        //   "end_date": endDate,
        //   "code_status_doc": codeStatusDoc
        // },
      );
      return GetApprovalRequestTripModel.fromJson(response.data);
    } on DioError catch (e) {
      e.error.printError();
      return e.error;
    }
  }

  Future approve(int id, ApprovalModel approval) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response = await network.dio.post(
        "/api/approval_request_trip/approve/$id",
      );
      response.data.printInfo(info: 'response');
      return response.data;
    } on DioError catch (e) {
      e.error.printError();
      return e.response?.data;
    }
  }

  Future reject(int id, ApprovalModel rejection) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    var formData = FormData.fromMap({"is_revision": rejection.isRevision});

    try {
      Response response = await network.dio.post(
        "/api/approval_request_trip/reject/$id",
        data: formData,
      );
      return response.data;
    } on DioError catch (e) {
      e.error.printError();
      return e.response?.data;
    }
  }
}
