import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/master/meeting_room/meeting_room_model.dart';
import 'package:gais/data/model/master/status_doc/status_doc_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/repository/booking_meeting_room/booking_meeting_room_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingMeetingRoomListController extends BaseController with MasterDataMixin {
  final TextEditingController dateRangeController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat formatFilter = DateFormat("yyyy-MM-dd");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();
  final startDateTemp = Rxn<DateTime>();
  final endDateTemp = Rxn<DateTime>();
  final selectedStatus = Rxn<StatusDocModel>();
  final selectedStatusTemp = Rxn<StatusDocModel>();
  final selectedMeetingRoom = Rxn<MeetingRoomModel>();
  final selectedMeetingRoomTemp = Rxn<MeetingRoomModel>();

  final keyword = "".obs;

  final listHeader = <BookingMeetingRoomModel>[].obs;
  final listStatus = <StatusDocModel>[].obs;
  final listMeetingRoom = <MeetingRoomModel>[].obs;

  final BookingMeetingRoomRepository _repository = Get.find();
  late PaginationModel? paginationModel;
  final totalPage = 1.obs;
  final currentPage = 1.obs;
  int limit = 10;

  final isSecretary = false.obs;

  @override
  void onInit() {
    super.onInit();
    getHeader();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }
  void initData()async{
    listStatus.add(StatusDocModel(code: "", status: "Status"));
    listStatus.add(StatusDocModel(code: 0, status: "Draft"));
    listStatus.add(StatusDocModel(code: 1, status: "Booked"));
    listStatus.add(StatusDocModel(code: 10, status: "Done"));
    listStatus.add(StatusDocModel(code: 9, status: "Cancelled"));
    // final statuses = await getListStatusDoc();
    // listStatus.addAll(statuses);
    onChangeSelectedStatus("");

    listMeetingRoom.add(MeetingRoomModel(id: "", nameMeetingRoom: "Room Name"));
    final meetingRooms = await getListMeetingRoom();
    listMeetingRoom.addAll(meetingRooms);
    onChangeSelectedMeetingRoom("");

    String codeRole = await storage.readString(StorageCore.codeRole);
    // isSecretary.value = true;
    isSecretary.value = codeRole == RoleEnum.secretary.value;
  }

  void getHeader({int page = 1}) async {
    final result = await _repository.getPaginationData(
        data: {
          "page" : page,
          "perPage" : limit,
          "search" : keyword.value,
          "id_meeting_room" : selectedMeetingRoom.value?.id ?? "",
          "code_status_doc" : selectedStatus.value?.code ?? "",
          "start_date" : startDate.value != null ? formatFilter.format(startDate.value!) : "",
          "end_date" : endDate.value != null ? formatFilter.format(endDate.value!) : "",
        }
    );

    result.fold(
            (l) {
          Get.showSnackbar(
              CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
          listHeader.clear();
          totalPage(1);
          currentPage(1);
        },
            (r) {
          paginationModel = r;
          int tempTotalPage = (paginationModel!.total!/limit).ceil();
          totalPage(tempTotalPage);
          currentPage(paginationModel?.currentPage);

          listHeader.value = paginationModel!.data!
              .map((e) => BookingMeetingRoomModel.fromJson(e))
              .toList();
          listHeader.refresh();
        });
  }

  void onChangeSelectedStatus(String id) {
    final selected = listStatus.firstWhere((item) => item.code.toString() == id.toString());
    selectedStatusTemp(selected);
  }

  void onChangeSelectedMeetingRoom(String id) {
    final selected = listMeetingRoom.firstWhere((item) => item.id.toString() == id.toString());
    selectedMeetingRoomTemp(selected);
  }

  void deleteHeader(BookingMeetingRoomModel item) async {
    final result = await _repository.deleteData(item.id!);
    result.fold(
            (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
            (r) {
          Get.showSnackbar(CustomGetSnackBar(
            message: "Success Delete Data".tr,
          ));
          getHeader();
        });
  }

  void applySearch(String search){
    keyword(search);
    getHeader(page: 1);
  }

  void resetFilter(){
    endDateTemp.value = null;
    startDateTemp.value = null;
    onChangeSelectedStatus("");
    onChangeSelectedMeetingRoom("");
    dateRangeController.text = "";
  }

  void openFilter(){
    startDateTemp.value = startDate.value;
    endDateTemp.value = endDate.value;
    if(DateUtils.isSameDay(startDateTemp.value, endDateTemp.value)){
      endDateTemp.value = null;
    }

    if(startDateTemp.value!=null){
      dateRangeController.text = "${dateFormat.format(startDate.value!)} - ${dateFormat.format(endDate.value!)}";
    }else{
      dateRangeController.text = "";
    }

    selectedStatusTemp.value = selectedStatus.value;
    selectedMeetingRoomTemp.value = selectedMeetingRoom.value;

  }

  void applyFilter(){
    startDate.value = startDateTemp.value;
    endDate.value = endDateTemp.value;
    selectedStatus.value = selectedStatusTemp.value;
    selectedMeetingRoom.value = selectedMeetingRoomTemp.value;

    getHeader();
  }
}
