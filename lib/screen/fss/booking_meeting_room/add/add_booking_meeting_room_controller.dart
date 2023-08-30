import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/booking_meeting_room/recurrence_model.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/master/facility/facility_model.dart';
import 'package:gais/data/model/master/room/room_model.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/repository/booking_meeting_room/booking_meeting_room_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
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

  final listFacility = <FacilityModel>[].obs;
  final listSelectedFacility = <FacilityModel>[].obs;
  final listNotSelectedFacility = <FacilityModel>[].obs;

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
      _resetFacility(selected);

    } else {
      floorController.text = "";
      capacityController.text = "";
    }
  }

  void _resetFacility(RoomModel roomModel){
    listFacility.clear();
    listNotSelectedFacility.clear();

    listSelectedFacility.clear();
    facilityAutocompleteController.text = "";
    if(roomModel.facility != null){
      List<FacilityModel> result = [];
      try{
        result = List<FacilityModel>.from(List<Map<String, dynamic>>.from(roomModel.facility).map((e) => FacilityModel.fromJson(e)).toList());
      }catch(e){
        if (kDebugMode) {
          print("error parse facility : $e");
        }
      }
      listFacility.value = result;
      listNotSelectedFacility.value = result;
    }
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
    String startDateString = startDate.value.toString().toDateFormat(targetFormat: "yyyy-MM-dd", originFormat: "yyyy-MM-dd HH:mm:ss");
    String endDateString = endDate.value != null ? endDate.value.toString().toDateFormat(targetFormat: "yyyy-MM-dd", originFormat: "yyyy-MM-dd HH:mm:ss") : startDateString;
    String startTimeString = startTime.value.toString().toDateFormat(targetFormat: "HH:mm:ss", originFormat: "yyyy-MM-dd HH:mm:ss");
    String endTimeString = endTime.value != null ? endTime.value.toString().toDateFormat(targetFormat: "HH:mm:ss", originFormat: "yyyy-MM-dd HH:mm:ss") : startTimeString;


    BookingMeetingRoomModel meetingRoomModel = BookingMeetingRoomModel(
        idCompany: selectedCompany.value?.id.toString().toInt(),
        idSite: selectedSite.value?.id.toString().toInt(),
        floor: floorController.text.toInt() ?? 0,
        capacity: capacityController.text.toInt() ?? 0,
        title: titleController.text,
        startDate: startDateString,
        endDate: isRecurrence.value ? selectedRecurrence.value?.value == "weekly" ? startDateString : endDateString : endDateString,
        startTime: startTimeString,
        endTime: endTimeString,
        idMeetingRoom: selectedRoom.value?.id,
        session: isOnlineMeeting.value ? "hybrid" : "offline",
        participant: listSelectedEmployee.map((element) => element.id.toString().toInt()).toList(),
        // link: linkController.text,
        link: null,
        facility: listSelectedFacility.map((element) => element.id.toString()).toList(),
        external: listExternalParticipant,
        isOnlineMeeting: isOnlineMeeting.value ? 1: 0,
        isRecurrence: isRecurrence.value ? 1: 0,
        recurrence: isRecurrence.value ? selectedRecurrence.value?.value : "",
        reccurrence: isRecurrence.value ? selectedRecurrence.value?.value : "", //typo from backend,
        remarks: remarksController.text,
        attachmentPath: selectedFile?.path,
        untilOcurs: isRecurrence.value ? selectedRecurrence.value?.date?.toDateFormat(targetFormat: "yyyy-MM-dd", originFormat: "yyyy-MM-dd HH:mm:ss.SSS"): "",
        days: selectedRecurrence.value?.recurrenceDays?.where((element) => element.isSelected).map((e) => e.value).toList()
    );


    print(jsonEncode(meetingRoomModel.toJson()));
    final result = await _repository.saveData(meetingRoomModel);

    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (meetingRoomModel) {
      /*Get.off(() => const DetailBookingMeetingRoomScreen(),
          arguments: {"item": meetingRoomModel});*/
          Get.back(result: true);

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

  void addFacility(FacilityModel facilityModel){
    listSelectedFacility.add(listFacility.firstWhere((element) => element.id.toString() == facilityModel.id.toString()));

    listNotSelectedFacility.removeWhere((element) => element.id.toString() == facilityModel.id.toString());

  }

  void deleteFacility(dynamic id) {
    listNotSelectedFacility.add(listSelectedFacility.firstWhere((element) => element.id.toString() == id.toString()));
    listSelectedFacility.removeWhere((element) => element.id.toString() == id.toString());
  }

  Future<List<EmployeeModel>> getEmployeeByKeyword(String keyword)async{

    listEmployee.clear();
    final employees = await getListEmployeeByKeyword(keyword);
    listEmployee.addAll(employees);

    return listEmployee;
  }

  Future<List<FacilityModel>> getFacilityByKeyword(String keyword) async{
    List<FacilityModel> tempFacility = listNotSelectedFacility.where((element) => element.facilityName!.toLowerCase().contains(keyword.toLowerCase())).toList();

    return Future.value(tempFacility);
  }
}
