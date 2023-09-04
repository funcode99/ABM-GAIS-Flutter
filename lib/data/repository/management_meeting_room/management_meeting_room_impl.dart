import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/data/model/management_meeting_room/get_management_meeting_room_model.dart';
import 'package:gais/data/model/management_meeting_room/save_management_meeting_room_model.dart';
import 'package:gais/data/model/master/meeting_room/meeting_room_model.dart';
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
    bool isApprover,
    List<dynamic> approver,
    List<dynamic> facility
  ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    Map<String, dynamic> mapData = {
        "id_company": idCompany,
        "id_site": idSite,
        "name_meeting_room": nameMeetingRoom,
        // "code_meeting_room": codeMeetingRoom,
        "capacity": capacity,
        "floor": floor,
        "available_status": status,
        "is_approval" : isApprover,
      };

    if(!isApprover){
      mapData.putIfAbsent("approver[]", () => "");
    }

    var formData = FormData.fromMap(mapData);

    //from backend, use approver[] instead of approver, :)
    for(dynamic item in approver){
      formData.fields.add(
          MapEntry("approver[]", item.toString())
      );
    }

    //from backend, use facility[] instead of facility, :)
    for(dynamic item in facility){
      formData.fields.add(
          MapEntry("facility[]", item.toString())
      );
    }


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

  @override
  Future<MeetingRoomModel> getByID(int id) async{
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      Response response = await network.dio.get(
        '/api/master_meeting_room/get/$id',
      );

      Map<String, dynamic> result = Map<String, dynamic>.from(response.data);
      List<Map<String, dynamic>> listData = List<Map<String, dynamic>>.from(result["data"]);

      MeetingRoomModel meetingRoomModel = MeetingRoomModel.fromJson(listData.first);

      return meetingRoomModel;
    } on DioError catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }

  @override
  Future<SaveManagementMeetingRoomModel> update(
     id,
      String idCompany,
      String idSite,
      String nameMeetingRoom,
      // String codeMeetingRoom,
      String capacity,
      String floor,
      String status,
      bool isApprover,
      List<dynamic> approver,
      List<dynamic> facility
      ) async {
    var token = await storageSecure.read(key: "token");
    network.dio.options.headers['Authorization'] = 'Bearer $token';

    Map<String, dynamic> mapData = {
      "id_company": idCompany,
      "id_site": idSite,
      "name_meeting_room": nameMeetingRoom,
      // "code_meeting_room": codeMeetingRoom,
      "capacity": capacity,
      "floor": floor,
      "available_status": status,
      "is_approval" : isApprover,
    };

    if(!isApprover){
      mapData.putIfAbsent("approver[]", () => "");
    }

    var formData = FormData.fromMap(mapData);

    //from backend, use approver[] instead of approver, :)
    for(dynamic item in approver){
      formData.fields.add(
          MapEntry("approver[]", item.toString())
      );
    }

    //from backend, use facility[] instead of facility, :)
    for(dynamic item in facility){
      formData.fields.add(
          MapEntry("facility[]", item.toString())
      );
    }


    try {
      Response response = await network.dio.post(
        "/api/master_meeting_room/update_data/$id",
        data: formData,
      );
      return SaveManagementMeetingRoomModel.fromJson(response.data);
    } on DioError catch (e) {
      print("response error: ${e.response?.data}");
      return SaveManagementMeetingRoomModel.fromJson(e.message);
    }
  }

}
