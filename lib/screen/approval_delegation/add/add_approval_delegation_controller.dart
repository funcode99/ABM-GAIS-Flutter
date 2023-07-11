import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_delegation/approval_delegation_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/repository/approval_delegation/approval_delegation_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddApprovalDelegationController extends BaseController
    with MasterDataMixin {
  final TextEditingController activeFromDateController =
      TextEditingController();
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

  final listDelegateTo = <EmployeeModel>[].obs;
  final selectedDelegateTo = Rxn<EmployeeModel>();

  final enableButton = false.obs;

  final showParticipantError = false.obs;

  final ApprovalDelegationRepository _repository = Get.find();

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
    String idEmployee = await storage.readString(StorageCore.userID);
    String employeeName = await storage.readString(StorageCore.employeeName);

    delegatorController.text = employeeName;

    listDelegateTo.add(EmployeeModel(id: "", employeeName: "Delegate To"));
    final employees = await getListDelegateTo(idEmployee.toInt());
    listDelegateTo.addAll(employees);

    onChangeSelectedDelegateTo("");
  }

  void onChangeSelectedDelegateTo(String id) {
    final selected = listDelegateTo.firstWhere(
        (item) => item.id.toString() == id.toString(),
        orElse: () => listDelegateTo.first);
    selectedDelegateTo(selected);
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

  void saveData() async {
    String idEmployee = await storage.readString(StorageCore.userID);
    String employeeName = await storage.readString(StorageCore.employeeName);
    String idCompany = await storage.readString(StorageCore.companyID);
    String idSite = await storage.readString(StorageCore.siteID);

    ApprovalDelegationModel approvalDelegationModel = ApprovalDelegationModel(
        idEmployee: idEmployee.toInt(),
        idEmployeeTo: selectedDelegateTo.value?.id,
        endDate: endDate.toString(),
        startDate: startDate.toString(),
        notes: remarksController.text);

    final result = await _repository.saveData(approvalDelegationModel);

    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (result) {
      Get.back(result: true);
    });
  }
}
