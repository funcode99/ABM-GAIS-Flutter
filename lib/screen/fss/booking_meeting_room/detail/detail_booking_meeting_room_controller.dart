import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/booking_meeting_room/participant_model.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/master/room/room_model.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/repository/booking_meeting_room/booking_meeting_room_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/date_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:textfield_tags/textfield_tags.dart';

class DetailBookingMeetingRoomController extends BaseController
    with MasterDataMixin {
  final TextEditingController createdAtController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController meetingRoomController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController participantController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  late TextEditingController autocompleteController;

  TextfieldTagsController textfieldTagsController = TextfieldTagsController();
  final formKey = GlobalKey<FormState>();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();

  final startTime = Rxn<DateTime>();
  final endTime = Rxn<DateTime>();

  final enableButton = false.obs;

  final onEdit = false.obs;

  final listRoom = <RoomModel>[].obs;
  final selectedRoom = Rxn<RoomModel>();

  final listCompany = <CompanyModel>[].obs;
  final selectedCompany = Rxn<CompanyModel>();

  final listSite = <SiteModel>[].obs;
  final selectedSite = Rxn<SiteModel>();

  final listEmployee = <EmployeeModel>[].obs;
  final selectedEmployee = Rxn<EmployeeModel>();
  final listSelectedEmployee = <EmployeeModel>[].obs;

  final selectedItem = BookingMeetingRoomModel().obs;

  final BookingMeetingRoomRepository _repository = Get.find();

  final showParticipantError = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
    detailHeader();
  }

  void initData()async{
    String companyName = await storage.readString(StorageCore.companyName);
    String siteName = await storage.readString(StorageCore.siteName);
    String idSite = await storage.readString(StorageCore.siteID);
    companyController.text = companyName;
    siteController.text = siteName;

    listCompany.add(CompanyModel(id: "", companyName: "Company"));
    final companies = await getListCompany();
    listCompany.addAll(companies);

    listSite.add(SiteModel(id: "", siteName: "Site"));
    final sites = await getListSite();
    listSite.addAll(sites);

    listRoom.add(RoomModel(id: "", nameMeetingRoom: "Meeting Room"));
    final rooms = await getListRoomBySite(idSite.toInt());
    listRoom.addAll(rooms);
    if(selectedItem.value.idMeetingRoom != null){
      onChangeSelectedRoom(selectedItem.value.idMeetingRoom.toString());
    }else{
      onChangeSelectedRoom("");
    }

    final employees = await getListEmployee();
    listEmployee.addAll(employees);

    setValue();
  }

  void setValue() {
    startDate.value = selectedItem.value.startDate?.toDate(originFormat: "yyyy-MM-dd");
    endDate.value = selectedItem.value.endDate?.toDate(originFormat: "yyyy-MM-dd");
    if(DateUtils.isSameDay(startDate.value, endDate.value)){
      endDate.value = null;
    }

    startTime.value = selectedItem.value.startTime?.toDate(originFormat: "HH:mm:ss");
    endTime.value = selectedItem.value.endTime?.toDate(originFormat: "HH:mm:ss");

    if(startTime.value!.isAtSameMomentAs(endTime.value!)){
      endTime.value = null;
    }

    createdByController.text = selectedItem.value.employeeName ?? "-";
    createdAtController.text = selectedItem.value.createdAt?.toDateFormat(
        originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yy") ??
        "-";
    titleController.text = selectedItem.value.title ?? "";

    dateController.text = "${dateFormat.format(startDate.value!)} ${endDate.value != null ? "-" : ""} ${endDate.value != null ? dateFormat.format(endDate.value!) : ""}";

    timeController.text = "${startTime.value?.toStringWithFormat()} ${endTime.value != null ? "-" : ""} ${endTime.value?.toStringWithFormat() ?? ""}";


    linkController.text = selectedItem.value.link ?? "";
    remarksController.text = selectedItem.value.remarks ?? "";
    meetingRoomController.text = selectedItem.value.nameMeetingRoom ?? "";
    floorController.text = "${selectedItem.value.floor ?? ""}";
    capacityController.text = "${selectedItem.value.capacity ?? ""}";

    listSelectedEmployee.clear();
    for(ParticipantModel item in selectedItem.value.participantArray!){
      listSelectedEmployee.add(EmployeeModel(id: item.idEmployee, employeeName: item.employeeName, email: item.email));
    }

  }

  void detailHeader() async {
    final result = await _repository.detailData(selectedItem.value.id!);

    result.fold((l) {
      print("ERROR DETAIL HEADER ${l.message}");
    }, (r) {
      selectedItem(r);
      setValue();
    });
  }

  /*void submitHeader() async {
    final result = await _repository.submitData(selectedItem.value.id!);
    result.fold(
            (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
            (cashAdvanceModel) {
          detailHeader();
        });
  }*/

  void onChangeSelectedRoom(String id) {
    final selected = listRoom.firstWhere(
            (item) => item.id.toString() == id.toString(),
        orElse: () => listRoom.first);

    selectedRoom(selected);

    if(selected.id != ""){
      floorController.text = selected.floor.toString();
      capacityController.text = selected.capacity.toString();
      meetingRoomController.text = selected.nameMeetingRoom.toString();
    }else{
      floorController.text = "";
      capacityController.text = "";
      meetingRoomController.text = "";
    }
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

  void updateOnEdit() {
    onEdit(!onEdit.value);
  }

  void deleteParticipantItem(EmployeeModel item){
    listSelectedEmployee.removeWhere((element) => item.id == element.id);
  }

  void updateData() async {
    String idCompany = await storage.readString(StorageCore.companyID);
    String idEmployee = await storage.readString(StorageCore.userID);
    String idSite = await storage.readString(StorageCore.siteID);

    BookingMeetingRoomModel meetingRoomModel = BookingMeetingRoomModel(
        idCompany: idCompany.toInt(),
        idEmployee: idEmployee.toInt(),
        idSite: idSite.toInt(),
        codeStatusDoc: selectedItem.value.codeStatusDoc,
        floor: floorController.text.toInt() ?? 0,
        capacity: capacityController.text.toInt() ?? 0,
        title: titleController.text,
        startDate: startDate.value.toString(),
        endDate: endDate.value != null ? endDate.value.toString() : startDate.value.toString(),
        startTime: startTime.toString(),
        endTime: endTime.value != null ? endTime.value.toString() : startTime.value.toString(),
        idMeetingRoom: selectedRoom.value?.id,
        noBookingMeeting: selectedItem.value.noBookingMeeting,
        session: null,
        participant: listSelectedEmployee.map((element) => element.id.toString().toInt()).toList(),
        link: linkController.text,
        remarks: remarksController.text);

    final result = await _repository.updateData(meetingRoomModel, selectedItem.value.id!);
    result.fold(
            (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
            (cashAdvanceModel) {
          detailHeader();
          onEdit.value = false;
        });
  }


}
