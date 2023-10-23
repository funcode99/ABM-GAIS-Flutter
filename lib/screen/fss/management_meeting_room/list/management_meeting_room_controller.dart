import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/management_meeting_room/get_management_meeting_room_model.dart' as mr;
import 'package:get/get.dart';

class ManagementMeetingRoomController extends BaseController {
  final formKey = GlobalKey<FormState>();

  final capacityController = TextEditingController();

  String filterCapacityTemp = "";
  String filterCapacity = "";
  String filterStatus = "";
  String filterStatusTemp = "";
  String? searchValue;
  int currentPage = 1;
  int perPage = 10;
  int totalPage = 1;

  bool isLoading = false;

  List capacityList = [];
  List<String> statusList = [
    "",
    "Available",
    "Unavailable"
  ];
  List<mr.Data2> meetingRoomList = [];
  mr.GetManagementMeetingRoomModel? meetingRoomModel;

  @override
  void onInit() {
    super.onInit();
    fetchList(1);
  }

  void resetFilter() {
    filterStatusTemp = "";
    filterCapacityTemp = "";
    capacityController.text = filterCapacityTemp;

    update();
  }

  void applyFilter(){
    filterCapacity = capacityController.text;
    filterStatus = filterStatusTemp;

    update();
    fetchList(1);
  }

  void openFilter(){
    filterStatusTemp = filterStatus;
    filterCapacityTemp = filterCapacity;

    capacityController.text = filterCapacityTemp;

    update();
  }

  void applySearch(String search){
    searchValue = search;
    update();
    fetchList(1);
  }

  Future<void> fetchList(int page) async {
    isLoading = true;

    try {
      await managementMeetingRoom
          .getList(
        perPage,
        page,
        searchValue,
        filterStatus,
        filterCapacity,
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

  Future<void> deleteData(int id) async {
    isLoading = true;
    try {
      isLoadingHitApi(true);
      await managementMeetingRoom.delete(id).then((value) {
        isLoadingHitApi(false);
        Get.showSnackbar(GetSnackBar(
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          message: "Data Deleted",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: greenColor,
        ));
        fetchList(currentPage);
      });
    } catch (e) {
      isLoadingHitApi(false);
      Get.showSnackbar(GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Delete Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
    isLoading = false;
    update();
  }

}
