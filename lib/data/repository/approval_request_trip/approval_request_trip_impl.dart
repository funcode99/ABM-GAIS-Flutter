import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  ) async{
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
}
