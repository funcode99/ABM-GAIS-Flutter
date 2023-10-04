import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';


class RequesterInfoController extends BaseController with MasterDataMixin{
  final formKey = GlobalKey<FormState>();
  final requester = TextEditingController();
  final sn = TextEditingController();
  final location = TextEditingController();
  final phone = TextEditingController();

  int? requestorID;
  int? siteID;
  int? requestID;

  bool isLoading = false;

  bool enableSelectRequestor = false;
  List<EmployeeModel> employeeList = [];
  EmployeeModel? selectedEmployee;

  @override
  void onInit() {
    super.onInit();
    requester.text;
    sn.text;
    location.text;
    phone.text;
    Future.wait([
      getRequesterInfo(),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    requester.dispose();
    sn.dispose();
    location.dispose();
    phone.dispose();
  }

  Future<void> getRequesterInfo() async {
    String codeRole = await storage.readString(StorageCore.codeRole);
    String isCrewing = await storage.readString(StorageCore.isCrewing) ?? "";

    if(codeRole == RoleEnum.secretary.value || (codeRole == RoleEnum.superAdmin.value && isCrewing == "1")){
      enableSelectRequestor = true;
      fetchList();
    }else{
      requestorID = await storage.readID();
      await storage.readEmployeeInfo().then((value) {
        print(value.isNotEmpty);
        // requestorID = int.parse(value.first.id.toString());
        requester.text = value.first.employeeName.toString();
        phone.text = value.first.phoneNumber.toString();
        sn.text = value.first.snEmployee.toString();
        siteID = int.parse(value.first.idSite.toString());
        location.text = value.first.siteName.toString();
      });
    }


    update();
  }

  Future<void> fetchList() async {
    isLoading = true;
    employeeList = [];

    try {
      await getOtherEmployee().then((value){
        employeeList.addAll(value ?? []);
        onChangeRequestor(employeeList.first.id);
      });
    } catch (e) {
      e.printError();
    }

    isLoading = false;
    update();
  }

  void onChangeRequestor(dynamic id){
    if(employeeList.isNotEmpty){
      final selected = employeeList.firstWhere(
              (item) => item.id.toString() == id.toString(),
          orElse: () => employeeList.first);

      selectedEmployee = selected;

      sn.text = selectedEmployee?.snEmployee ?? "";
      location.text = selectedEmployee?.siteName ?? "";
      phone.text = selectedEmployee?.phoneNumber ?? "";
      requestorID = selectedEmployee?.id;
      siteID = selectedEmployee?.idSite;
    }

    update();
  }

}
