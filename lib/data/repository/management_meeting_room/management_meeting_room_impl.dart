import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/management_meeting_room/get_management_meeting_room_model.dart';
import 'package:gais/data/model/management_meeting_room/save_management_meeting_room_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:gais/data/repository/management_meeting_room/management_meeting_room_repository.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class ManagementMeetingRoomImpl implements ManagementMeetingRoomRepository {
  final network = Get.find<NetworkCore>();
  final storageSecure = const FlutterSecureStorage();

  @override
  Future<GetManagementMeetingRoomModel> getList(
    int perPage,
    int page,
    String? search,
    String? status,
    String? capacity,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';
    search.printInfo(info: "search");
    try {
      Response response = await network.dio.get(
        "/api/master_meeting_room/get/",
        queryParameters: {
          "perPage": perPage,
          "page": page,
          "search": search,
          "available_status": status,
          "capacity": capacity,
        },
      );
      GetManagementMeetingRoomModel.fromJson(response.data).data?.total.printInfo();
      return GetManagementMeetingRoomModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return e.response?.data;
    }
  }

  @override
  Future<SaveManagementMeetingRoomModel> save(
    String idCompany,
    String idSite,
    String nameMeetingRoom,
    // String codeMeetingRoom,
    String capacity,
    String floor,
    String status,
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    var formData = FormData.fromMap({
      "id_company": idCompany,
      "id_site": idSite,
      "name_meeting_room": nameMeetingRoom,
      // "code_meeting_room": codeMeetingRoom,
      "capacity": capacity,
      "floor": floor,
      "available_status": status,
    });

    try {
      Response response = await network.dio.post(
        "/api/master_meeting_room/store/",
        data: formData,
      );
      return SaveManagementMeetingRoomModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return SaveManagementMeetingRoomModel.fromJson(e.message);
    }
  }
}
