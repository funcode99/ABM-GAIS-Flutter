import 'package:gais/data/model/management_meeting_room/get_management_meeting_room_model.dart';
import 'package:gais/data/model/management_meeting_room/save_management_meeting_room_model.dart';

abstract class ManagementMeetingRoomRepository {
  Future<GetManagementMeetingRoomModel> getList(
    int perPage,
    int page,
    String? search,
    String? status,
    String? capacity,
  );

  Future<SaveManagementMeetingRoomModel> save(
    String idCompany,
    String idSite,
    String nameMeetingRoom,
    // String codeMeetingRoom,
    String capacity,
    String floor,
    String status,
    bool isApproval,
    List<dynamic> approver,
    List<dynamic> facility
    );
}
