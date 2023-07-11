import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_delegation/approval_delegation_model.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/master/room/room_model.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/repository/booking_meeting_room/booking_meeting_room_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddApprovalDelegationController extends BaseController
    with MasterDataMixin {
  final TextEditingController activeFromDateController = TextEditingController();
  final TextEditingController activeToDateController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController delegateToController = TextEditingController();
  final TextEditingController delegatorController = TextEditingController();

  TextfieldTagsController textfieldTagsController = TextfieldTagsController();
  final formKey = GlobalKey<FormState>();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();

  final startTime = Rxn<DateTime>();
  final endTime = Rxn<DateTime>();

  final enableButton = false.obs;

  final showParticipantError = false.obs;

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
    String employeeName = await storage.readString(StorageCore.employeeName);

    delegatorController.text = employeeName;
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

  void saveData() async {
    String employeeName = await storage.readString(StorageCore.employeeName);
    String idCompany = await storage.readString(StorageCore.companyID);
    String idSite = await storage.readString(StorageCore.siteID);

    ApprovalDelegationModel approvalDelegationModel = ApprovalDelegationModel(
        delegator: employeeName,
        delegateTo: delegateToController.text,
        activeTo: endDate.toString(),
        activeFrom: startDate.toString(),
        createdAt: "2023-07-10",
        remarks: remarksController.text);


    Get.back(result: approvalDelegationModel);

    /*final result = await _repository.saveData(meetingRoomModel);

    result.fold(
            (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
            (meetingRoomModel) {
          *//*Get.off(() => const DetailBookingMeetingRoomScreen(),
          arguments: {"item": meetingRoomModel});*//*
          Get.back(result: true);
        });*/
  }

}
