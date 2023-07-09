import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';

enum ApproveEnum { onBehalf, fullApprove }

class ApprovalConfirmationController extends BaseController with MasterDataMixin{
  final TextEditingController noteController = TextEditingController();

  final idCompany = Rxn<int>();
  final idSite = Rxn<int>();
  final idEmployee = Rxn<int>();
  final idApprovalAuth = Rxn<int>();
  final listEmployee = <EmployeeModel>[].obs;
  final selectedEmployee= Rxn<EmployeeModel>();
  final enableOnBehalf = false.obs;
  final selectedEnum = Rx<ApproveEnum>(ApproveEnum.onBehalf);


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
    String codeRole = await storage.readString(StorageCore.codeRole);

    if(codeRole == RoleEnum.superAdmin.value){
      //enable on behalf
      enableOnBehalf(true);
      final employees = await getApproveBehalf(
        idApprovalAuth: idApprovalAuth.value,
        idSite: idSite.value,
        idEmployee: idEmployee.value,
        idCompany: idCompany.value
      );
      listEmployee(employees);
      selectedEmployee(listEmployee.first);
    }else{
      selectedEnum(ApproveEnum.fullApprove);
    }
  }

  void onChangeSelectedEmployee(String id) {
    final selected = listEmployee.firstWhere((item) => item.id == id.toInt());
    selectedEmployee(selected);
  }

  ApprovalModel approve(){
    ApprovalModel approvalModel = ApprovalModel();
    approvalModel.notes = noteController.text;
    if(selectedEnum.value == ApproveEnum.onBehalf){
      approvalModel.approvedBehalf = selectedEmployee.value?.id;
    }

    return approvalModel;
  }
}
