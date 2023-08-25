import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/booking_meeting_room/recurrence_model.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/master/room/room_model.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/repository/booking_meeting_room/booking_meeting_room_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/fss/booking_meeting_room/detail/detail_booking_meeting_room_screen.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddBookingMeetingRoomController extends BaseController
    with MasterDataMixin {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController meetingRoomController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController participantController = TextEditingController();
  final TextEditingController externalParticipantController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController recurrenceController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController facilityController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController companyController = TextEditingController();


  late TextEditingController autocompleteController = TextEditingController();
  late TextEditingController facilityAutocompleteController = TextEditingController();
  final SuggestionsBoxController suggestionsBoxController = SuggestionsBoxController();

  TextfieldTagsController textfieldTagsController = TextfieldTagsController();
  final formKey = GlobalKey<FormState>();

  final FocusNode externalParticipantFocusNode = FocusNode();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();

  final startTime = Rxn<DateTime>();
  final endTime = Rxn<DateTime>();

  final enableButton = false.obs;

  final listRoom = <RoomModel>[].obs;
  final selectedRoom = Rxn<RoomModel>();

  final listFacility = <String>[].obs;
  final listSelectedFacility = <String>[].obs;
  final listNotSelectedFacility = <String>[].obs;

  final listCompany = <CompanyModel>[].obs;
  final selectedCompany = Rxn<CompanyModel>();
  final enableSelectCompany = false.obs;

  final listSite = <SiteModel>[].obs;
  final selectedSite = Rxn<SiteModel>();
  final enableSelectSite = false.obs;

  final listEmployee = <EmployeeModel>[].obs;
  final selectedEmployee = Rxn<EmployeeModel>();
  final listSelectedEmployee = <EmployeeModel>[].obs;
  final listExternalParticipant = <String>[].obs;

  final showParticipantError = false.obs;
  final showExternalParticipantError = false.obs;

  final isOnlineMeeting = false.obs;
  final isRecurrence = false.obs;

  final selectedRecurrence = Rxn<RecurrenceModel>();

  File? selectedFile;

  final BookingMeetingRoomRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  initData() async {
    String companyName = await storage.readString(StorageCore.companyName);
    String idCompany = await storage.readString(StorageCore.companyID);
    String siteName = await storage.readString(StorageCore.siteName);
    String idSite = await storage.readString(StorageCore.siteID);
    String codeRole = await storage.readString(StorageCore.codeRole);

    listRoom.add(RoomModel(id: "", nameMeetingRoom: "Meeting Room"));
    final rooms = await getListRoomBySite(idSite.toInt());
    listRoom.addAll(rooms);

    if(codeRole == RoleEnum.administrator.value){
      enableSelectCompany(true);

      listCompany.add(CompanyModel(id: "", companyName: "Company"));
      final companies = await getListCompany();
      listCompany.addAll(companies);
      onChangeSelectedCompany(listCompany.first.id);
    }else{
      selectedCompany.value = CompanyModel(
          id: idCompany
      );
      companyController.text = companyName;
      onChangeSelectedCompany(idCompany);
    }

    if(codeRole == RoleEnum.administrator.value || codeRole == RoleEnum.superAdmin.value){
      enableSelectSite(true);

      listSite.add(SiteModel(id: "", siteName: "Site"));
      final sites = await getListSite();
      listSite.addAll(sites);

      onChangeSelectedSite(listSite.first.id);
    }else{
      selectedSite.value = SiteModel(
          id: idSite
      );
      siteController.text = siteName;
      onChangeSelectedSite(idSite);
    }

    onChangeSelectedRoom("");

    /*final employees = await getListEmployee();
    listEmployee.addAll(employees);*/

    linkController.text = "Generated by System";

    /*listFacility.add("Projector");
    listFacility.add("TV");
    listFacility.add("Speaker");
    listFacility.add("Webcam");
    listFacility.add("Jabra");

    listNotSelectedFacility.addAll(listFacility);*/
  }

  void onChangeSelectedCompany(String id) {
    if(listCompany.isNotEmpty){
      final selected = listCompany.firstWhere(
              (item) => item.id.toString() == id.toString(),
          orElse: () => listCompany.first);
      selectedCompany(selected);

      //clear site and filter sites
      onChangeSelectedSite("");
      _filterSite(selected.id.toString());
    }
  }

  void onChangeSelectedSite(String id) {
    if(listSite.isNotEmpty){
      final selected = listSite.firstWhere(
              (item) => item.id.toString() == id.toString(),
          orElse: () => listSite.first);
      selectedSite(selected);

      //clear warehouse and filter room
      onChangeSelectedRoom("");
      _filterMeetingRoom(selected.id.toString());
    }
  }

  void onChangeSelectedRoom(String id) {
    final selected = listRoom.firstWhere(
        (item) => item.id.toString() == id.toString(),
        orElse: () => listRoom.first);

    selectedRoom(selected);

    if (selected.id != "") {
      floorController.text = selected.floor.toString();
      capacityController.text = selected.capacity.toString();

      //reset facility
      _resetFacility(selected.id);

    } else {
      floorController.text = "";
      capacityController.text = "";
    }
  }

  void _resetFacility(dynamic roomId)async{
    final result = await getFacilityByRoomId(roomId);
    listFacility.value = result;
    listNotSelectedFacility.value = result;

    listSelectedFacility.clear();
    facilityAutocompleteController.text = "";
  }

  void _filterSite(String idCompany)async{
    listSite.removeWhere((element) => element.id != "");
    if(idCompany.isNotEmpty){
      final filtered = await getListSiteByCompanyId(idCompany.toInt());
      listSite.addAll(filtered);
    }
  }

  void _filterMeetingRoom(String idSite)async{
    listRoom.removeWhere((element) => element.id != "");
    if(idSite.isNotEmpty){
      final filtered = await getListMeetingRoomBySiteId(idSite.toInt());
      listRoom.addAll(filtered);
    }
  }


  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

  void saveData() async {
    BookingMeetingRoomModel meetingRoomModel = BookingMeetingRoomModel(
        idCompany: selectedCompany.value?.id.toString().toInt(),
        idSite: selectedSite.value?.id.toString().toInt(),
        floor: floorController.text.toInt() ?? 0,
        capacity: capacityController.text.toInt() ?? 0,
        title: titleController.text,
        startDate: startDate.value.toString(),
        endDate: endDate.value != null ? endDate.value.toString() : startDate.value.toString(),
        startTime: startTime.toString(),
        endTime: endTime.value != null ? endTime.value.toString() : startTime.value.toString(),
        idMeetingRoom: selectedRoom.value?.id,
        session: isOnlineMeeting.value ? "hybrid" : "offline",
        participant: listSelectedEmployee.map((element) => element.id.toString().toInt()).toList(),
        // link: linkController.text,
        link: null,
        facility: listSelectedFacility,
        external: listExternalParticipant,
        isOnlineMeeting: isOnlineMeeting.value ? 1: 0,
        isRecurrence: isRecurrence.value ? 1: 0,
        recurrence: selectedRecurrence.value?.value,
        reccurrence: selectedRecurrence.value?.value, //typo from backend,
        remarks: remarksController.text,
        attachmentPath: selectedFile?.path
    );


    print(jsonEncode(meetingRoomModel.toJson()));
    final result = await _repository.saveData(meetingRoomModel);

    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (meetingRoomModel) {
      Get.off(() => const DetailBookingMeetingRoomScreen(),
          arguments: {"item": meetingRoomModel});

    });
  }

  void deleteParticipantItem(EmployeeModel item) {
    listSelectedEmployee.removeWhere((element) => item.id == element.id);
  }

  void addExternalParticipant(String participant){
    if(participant.isNotEmpty && participant.isEmail){
      listExternalParticipant.add(participant);
      externalParticipantController.text = "";
      showExternalParticipantError.value = false;
    }else{
      showExternalParticipantError.value = true;
    }
  }

  void deleteExternalParticipant(int index) {
    listExternalParticipant.removeAt(index);
  }

  void addFacility(String facility){
    if(facility.isNotEmpty){
      listSelectedFacility.add(facility);

      listNotSelectedFacility.removeWhere((element) => element.toLowerCase() == facility.toLowerCase());
      // showExternalParticipantError.value = false;
    }else{
      // showExternalParticipantError.value = true;
    }

  }

  void deleteFacility(int index) {
    listNotSelectedFacility.add(listSelectedFacility[index]);
    listSelectedFacility.removeAt(index);
  }

  Future<List<EmployeeModel>> getEmployeeByKeyword(String keyword)async{

    listEmployee.clear();
    final employees = await getListEmployeeByKeyword(keyword);
    listEmployee.addAll(employees);

    return listEmployee;
  }

  Future<List<String>> getFacilityByKeyword(String keyword) async{

    List<String> tempFacility = List<String>.from(listNotSelectedFacility);

    tempFacility.where((element) => element.toLowerCase().contains(keyword.toLowerCase()));

    return Future.value(tempFacility);
  }
}
