import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/booking_meeting_room/participant_model.dart';
import 'package:gais/data/model/booking_meeting_room/recurrence_model.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/master/facility/facility_model.dart';
import 'package:gais/data/model/master/room/room_model.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/repository/booking_meeting_room/booking_meeting_room_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/dialog/approval_confirmation_controller.dart';
import 'package:gais/reusable/dialog/approval_confirmation_dialog.dart';
import 'package:gais/reusable/dialog/cancel_dialog.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/approval_action_enum.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/date_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../../reusable/dialog/reject_dialog.dart';

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
  final TextEditingController cancelledNotesController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController externalParticipantController =
      TextEditingController();
  final TextEditingController facilityController = TextEditingController();
  final TextEditingController recurrenceController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();
  late TextEditingController facilityAutocompleteController =
      TextEditingController();

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

  final listExternalParticipant = <String>[].obs;

  final showParticipantError = false.obs;
  final showExternalParticipantError = false.obs;

  final isOnlineMeeting = false.obs;
  final isRecurrence = false.obs;

  final selectedRecurrence = Rxn<RecurrenceModel>();

  File? selectedFile;

  final listFacility = <String>[].obs;
  final listSelectedFacility = <String>[].obs;
  final listNotSelectedFacility = <String>[].obs;

  final showStartMeetingButton = false.obs;
  final showEndMeetingButton = false.obs;
  final showCancelButton = false.obs;

  final listLogApproval = <ApprovalLogModel>[].obs;

  final BookingMeetingRoomRepository _repository = Get.find();

  final selectedTab = Rx<TabEnum>(TabEnum.detail);

  final approvalActionEnum = Rxn<ApprovalActionEnum>();
  final approvalModel = Rxn<ApprovalModel>();

  final isSecretary = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
    detailHeader();

    if (approvalActionEnum.value == ApprovalActionEnum.approve) {
      openApproveDialog();
    } else if (approvalActionEnum.value == ApprovalActionEnum.reject) {
      openRejectDialog();
    }
  }

  void initData() async {
    String companyName = await storage.readString(StorageCore.companyName);
    String siteName = await storage.readString(StorageCore.siteName);
    String idSite = await storage.readString(StorageCore.siteID);
    String codeRole = await storage.readString(StorageCore.codeRole);
    companyController.text = companyName;
    siteController.text = siteName;
    // isSecretary.value = true;
    isSecretary.value = codeRole == RoleEnum.secretary.value;

    listCompany.add(CompanyModel(id: "", companyName: "Company"));
    final companies = await getListCompany();
    listCompany.addAll(companies);

    listSite.add(SiteModel(id: "", siteName: "Site"));
    final sites = await getListSite();
    listSite.addAll(sites);

    listRoom.add(RoomModel(id: "", nameMeetingRoom: "Meeting Room"));
    final rooms = await getListRoomBySite(idSite.toInt());
    listRoom.addAll(rooms);
    if (selectedItem.value.idMeetingRoom != null) {
      onChangeSelectedRoom(selectedItem.value.idMeetingRoom.toString());
    } else {
      onChangeSelectedRoom("");
    }

    // final employees = await getListEmployee();
    // listEmployee.addAll(employees);

    setValue();
  }

  void setValue() {
    startDate.value =
        selectedItem.value.startDate?.toDate(originFormat: "yyyy-MM-dd");
    endDate.value =
        selectedItem.value.endDate?.toDate(originFormat: "yyyy-MM-dd");
    if (DateUtils.isSameDay(startDate.value, endDate.value)) {
      endDate.value = null;
    }

    startTime.value =
        selectedItem.value.startTime?.toDate(originFormat: "HH:mm:ss");
    endTime.value =
        selectedItem.value.endTime?.toDate(originFormat: "HH:mm:ss");

    if (startTime.value!.isAtSameMomentAs(endTime.value!)) {
      endTime.value = null;
    }

    createdByController.text = selectedItem.value.employeeName ?? "-";
    createdAtController.text = selectedItem.value.createdAt?.toDateFormat(
            originFormat: "yyyy-MM-dd HH:mm:ss",
            targetFormat: "dd/MM/yyyy HH:mm:ss") ??
        "-";
    titleController.text = selectedItem.value.title ?? "";

    dateController.text =
        "${dateFormat.format(startDate.value!)} ${endDate.value != null ? "-" : ""} ${endDate.value != null ? dateFormat.format(endDate.value!) : ""}";

    timeController.text =
        "${startTime.value?.toStringWithFormat()} ${endTime.value != null ? "-" : ""} ${endTime.value?.toStringWithFormat() ?? ""}";

    linkController.text = selectedItem.value.link ?? "";
    remarksController.text = selectedItem.value.remarks ?? "";
    cancelledNotesController.text = selectedItem.value.notes ?? "";
    meetingRoomController.text = selectedItem.value.nameMeetingRoom ?? "";
    floorController.text = "${selectedItem.value.floor ?? ""}";
    capacityController.text = "${selectedItem.value.capacity ?? ""}";

    listSelectedEmployee.clear();
    for (ParticipantModel item in selectedItem.value.participantArray!) {
      listSelectedEmployee.add(EmployeeModel(
          id: item.idEmployee,
          employeeName: item.employeeName,
          email: item.email));
    }

    if (selectedItem.value.external != null) {
      listExternalParticipant.value =
          List<String>.from(selectedItem.value.external);
    }

    if (selectedItem.value.isRecurrence) {
      isRecurrence.value = true;
      //set selected recurrence
      selectedRecurrence.value =
          RecurrenceModel(value: selectedItem.value.recurrence);
      recurrenceController.text =
          selectedItem.value.recurrence?.capitalizeFirst ?? "";
    } else {
      isRecurrence.value = false;
    }

    if (selectedItem.value.isOnlineMeeting) {
      isOnlineMeeting.value = true;
    } else {
      isOnlineMeeting.value = false;
    }

    //set facility
    /*if(selectedItem.value.facility is String){
      if(selectedItem.value.facility.toString().isNotEmpty){
        //explode to array
        listSelectedFacility.value = List<String>.from(selectedItem.value.facility.toString().split(","));
      }
    }else if(selectedItem.value.facility is List){
      listSelectedFacility.value = List<String>.from(selectedItem.value.facility);
    }*/
    if (selectedItem.value.facilityArray != null) {
      listSelectedFacility.clear();
      for (FacilityModel item in selectedItem.value.facilityArray!) {
        listSelectedFacility.add("${item.facilityName}");
      }
    }

    attachmentController.text = selectedItem.value.attachment ?? "";
    linkController.text = "${selectedItem.value.link}";

    //set button flag
    if (selectedItem.value.durationStart == null) {
      //show cancel button
      showCancelButton.value = true;

      String startDateTimeString =
          "${selectedItem.value.startDate} ${selectedItem.value.startTime}";
      // String startDateTimeString = "2023-08-29 15:15:00";
      DateTime? startDateTime =
          startDateTimeString.toDate(originFormat: "yyyy-MM-dd HH:mm:ss");
      if (startDateTime != null) {
        DateTime today = DateTime.now();
        if (today.isAfter(startDateTime)) {
          showStartMeetingButton.value = true;
        }
      }
    } else {
      showCancelButton.value = false;
      showStartMeetingButton.value = false;

      if (selectedItem.value.durationEnd == null) {
        showEndMeetingButton.value = true;
      } else {
        showEndMeetingButton.value = false;
      }
    }

    //set approval log
    listLogApproval.clear();
    if (selectedItem.value.approvedAt != null &&
        selectedItem.value.nameApproved != null) {
      listLogApproval.add(ApprovalLogModel(
          date: selectedItem.value.approvedAt,
          notes: selectedItem.value.notes,
          codeStatus: 0,
          text:
              "${selectedItem.value.nameApproved} was approved your booking"));
    }

    if (selectedItem.value.rejectedAt != null &&
        selectedItem.value.nameRejected != null) {
      listLogApproval.add(ApprovalLogModel(
          date: selectedItem.value.rejectedAt,
          notes: selectedItem.value.notes,
          codeStatus: 0,
          text:
              "${selectedItem.value.nameRejected} was rejected your booking"));
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

  void submitHeader() async {
    isLoadingHitApi(true);
    final result = await _repository.submitData(selectedItem.value.id!);
    result.fold((l) {
      isLoadingHitApi(false);
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
    }, (result) {
      isLoadingHitApi(false);
      detailHeader();
    });
  }

  void cancelHeader() async {
    isLoadingHitApi(true);
    final result = await _repository.cancelData(
        approvalModel.value, selectedItem.value.id!);
    result.fold((l) {
      isLoadingHitApi(false);
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
    }, (result) {
      isLoadingHitApi(false);
      detailHeader();
    });
  }

  void startMeeting() async {
    isLoadingHitApi(true);
    final result = await _repository.startMeeting(selectedItem.value.id!);
    result.fold((l) {
      isLoadingHitApi(false);
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
    }, (result) {
      isLoadingHitApi(false);
      detailHeader();
    });
  }

  void endMeeting() async {
    isLoadingHitApi(true);
    final result = await _repository.endMeeting(selectedItem.value.id!);
    result.fold((l) {
      isLoadingHitApi(false);
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
    }, (result) {
      isLoadingHitApi(false);
      detailHeader();
    });
  }

  void onChangeSelectedRoom(String id) {
    final selected = listRoom.firstWhere(
        (item) => item.id.toString() == id.toString(),
        orElse: () => listRoom.first);

    selectedRoom(selected);

    if (selected.id != "") {
      floorController.text = selected.floor.toString();
      capacityController.text = selected.capacity.toString();
      meetingRoomController.text = selected.nameMeetingRoom.toString();
    } else {
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

  void deleteParticipantItem(EmployeeModel item) {
    listSelectedEmployee.removeWhere((element) => item.id == element.id);
  }

  void updateData() async {
    isLoadingHitApi(true);
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
        endDate: endDate.value != null
            ? endDate.value.toString()
            : startDate.value.toString(),
        startTime: startTime.toString(),
        endTime: endTime.value != null
            ? endTime.value.toString()
            : startTime.value.toString(),
        idMeetingRoom: selectedRoom.value?.id,
        noBookingMeeting: selectedItem.value.noBookingMeeting,
        session: null,
        participant: listSelectedEmployee
            .map((element) => element.id.toString().toInt())
            .toList(),
        link: linkController.text,
        remarks: remarksController.text);

    final result =
        await _repository.updateData(meetingRoomModel, selectedItem.value.id!);
    result.fold((l) {
      isLoadingHitApi(false);
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
    }, (result) {
      isLoadingHitApi(false);
      detailHeader();
      onEdit.value = false;
    });
  }

  void addExternalParticipant(String participant) {
    if (participant.isNotEmpty && participant.isEmail) {
      listExternalParticipant.add(participant);
      externalParticipantController.text = "";
      showExternalParticipantError.value = false;
    } else {
      showExternalParticipantError.value = true;
    }
  }

  void deleteExternalParticipant(int index) {
    listExternalParticipant.removeAt(index);
  }

  void addFacility(String facility) {
    if (facility.isNotEmpty) {
      listSelectedFacility.add(facility);

      listNotSelectedFacility.removeWhere(
          (element) => element.toLowerCase() == facility.toLowerCase());
      // showExternalParticipantError.value = false;
    } else {
      // showExternalParticipantError.value = true;
    }
  }

  void deleteFacility(int index) {
    listNotSelectedFacility.add(listSelectedFacility[index]);
    listSelectedFacility.removeAt(index);
  }

  Future<List<String>> getFacilityByKeyword(String keyword) async {
    List<String> tempFacility = List<String>.from(listNotSelectedFacility);

    tempFacility.where(
        (element) => element.toLowerCase().contains(keyword.toLowerCase()));

    return Future.value(tempFacility);
  }

  String? getDuration() {
    String dateString = selectedItem.value.durationStart ?? "";
    String dateStringTwo = selectedItem.value.durationEnd ?? "";

    try {
      DateTime dateTime =
          dateString.toDate(originFormat: "yyyy-MM-dd HH:mm:ss")!;
      DateTime dateTimeTwo =
          dateStringTwo.toDate(originFormat: "yyyy-MM-dd HH:mm:ss")!;

      return dateTime.getDifferencesString(otherDate: dateTimeTwo);
    } catch (e) {
      print("ERROR GET DURATION $e");
    }

    return "";
  }

  openCancelDialog() async {
    ApprovalModel? result = await Get.dialog(CancelDialog(title: "Booking Meeting".tr,));

    if (result != null) {
      approvalModel(result);
      cancelHeader();
    }
  }

  openApproveDialog() async {
    ApprovalModel? result = await Get.dialog(const ApprovalConfirmationDialog(
      approveFormEnum: ApproveFormEnum.onlyFullApprove,
    ));

    if (result != null) {
      approvalModel(result);
      approve();
    }
  }

  openRejectDialog() async {
    ApprovalModel? result = await Get.dialog(const RejectDialog(
      rejectFormEnum: RejectFormEnum.onlyFullReject,
    ));
    if (result != null) {
      approvalModel(result);
      reject();
    }
  }

  void reject() async {
    isLoadingHitApi(true);
    final result =
        await _repository.reject(approvalModel.value, selectedItem.value.id!);
    result.fold((l) {
      isLoadingHitApi(false);
      showApprovalFailDialog("Request failed to be approved!".tr)
          .then((value) => detailHeader());
    }, (r) {
      isLoadingHitApi(false);
      if (r) {
        showApprovalSuccessDialog("The request was successfully rejected!".tr)
            .then((value) => detailHeader());
      } else {
        showApprovalFailDialog("Request failed to be rejected!".tr)
            .then((value) => detailHeader());
      }
    });
  }

  void approve() async {
    isLoadingHitApi(true);
    final result =
        await _repository.approve(approvalModel.value, selectedItem.value.id!);
    result.fold((l) {
      isLoadingHitApi(false);
      showApprovalFailDialog("Request failed to be approved!".tr)
          .then((value) => detailHeader());
    }, (r) {
      isLoadingHitApi(false);
      if (r) {
        showApprovalSuccessDialog("The request was successfully approved!".tr)
            .then((value) => detailHeader());
      } else {
        showApprovalFailDialog("Request failed to be approved!".tr)
            .then((value) => detailHeader());
      }
    });
  }
}
