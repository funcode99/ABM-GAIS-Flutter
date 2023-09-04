import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/management_meeting_room/get_management_meeting_room_model.dart' as mr;
import 'package:get/get.dart';

class ManagementMeetingRoomController extends BaseController {
  final formKey = GlobalKey<FormState>();

  String filterCapacity = "-1";
  String filterStatus = "-1";
  String? searchValue;
  int currentPage = 1;
  int perPage = 10;
  int totalPage = 1;

  bool isLoading = false;
  bool dataisnull = false;

  List capacityList = [];
  List statusList = [];
  List<mr.Data2> meetingRoomList = [];
  mr.GetManagementMeetingRoomModel? meetingRoomModel;

  @override
  void onInit() {
    super.onInit();
    fetchList(1);
  }

  void resetFilter() {
    formKey.currentState?.reset();
    filterStatus = "-1";
    update();

    print(filterStatus);
  }

  Future<void> fetchList(int page) async {
    isLoading = true;

    try {
      await managementMeetingRoom
          .getList(
        perPage,
        page,
        searchValue,
        filterStatus!= "-1" ? filterStatus : null,
        filterCapacity!= "-1" ? filterCapacity : null,
      )
          .then((value) {
        meetingRoomList.clear();
        meetingRoomList.addAll(value.data?.data?.toSet().toList() ?? []);
        meetingRoomModel = value;
        int tempTotalPage = (meetingRoomModel!.data!.total!/perPage).ceil();
        totalPage = tempTotalPage;
        currentPage = meetingRoomModel?.data?.currentPage?.toInt() ?? 1;

        update();
      });
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    isLoading = false;
    update();
  }
}
