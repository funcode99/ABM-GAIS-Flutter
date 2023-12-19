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

class EditApprovalDelegationController extends BaseController
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

  final selectedItem = ApprovalDelegationModel().obs;

  final ApprovalDelegationRepository _repository = Get.find();

  @override
  void onReady() {
    super.onReady();
    initData();
    detailHeader();
  }

  void initData() async{
    String idEmployee = await storage.readString(StorageCore.userID);

    listDelegateTo.add(EmployeeModel(id: "", employeeName: "Delegate To"));
    final employees = await getListDelegateTo(idEmployee.toInt());
    listDelegateTo.addAll(employees);

    setValue();
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

  void setValue() {
    delegatorController.text = selectedItem.value.delegator ?? "-";

    if(selectedItem.value.idEmployeeTo != null){
      onChangeSelectedDelegateTo(selectedItem.value.idEmployeeTo.toString());
    }else{
      onChangeSelectedDelegateTo("");
    }

    startDate.value = selectedItem.value.startDate?.toDate(originFormat: "yyyy-MM-dd");
    endDate.value = selectedItem.value.endDate?.toDate(originFormat: "yyyy-MM-dd");
    activeFromDateController.text = selectedItem.value.startDate?.toDateFormat(
        originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ??
        "-";
    activeToDateController.text = selectedItem.value.endDate?.toDateFormat(
        originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ??
        "-";
    remarksController.text = selectedItem.value.notes ?? "";
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

  void updateData() async {
    String idEmployee = await storage.readString(StorageCore.userID);

    ApprovalDelegationModel approvalDelegationModel = ApprovalDelegationModel(
        idEmployee: idEmployee.toInt(),
        idEmployeeTo: selectedDelegateTo.value?.id,
        endDate: endDate.toString(),
        startDate: startDate.toString(),
        notes: remarksController.text);

    final result = await _repository.updateData(approvalDelegationModel, selectedItem.value.id!);
    result.fold(
            (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
            (result) {
          //update list
          Get.back(result: true);
        });
  }

}
