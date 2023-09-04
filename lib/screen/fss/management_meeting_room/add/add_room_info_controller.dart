import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/master/facility/facility_model.dart';
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:gais/data/storage_core.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';

class AddRoomInfoController extends BaseController with MasterDataMixin{
  final TextEditingController companyController = TextEditingController();
  final TextEditingController siteController = TextEditingController();

  bool isEdit = Get.arguments['isEdit'];
  bool loadCompany = false;
  bool loadSite = false;

  final formKey = GlobalKey<FormState>();
  final companyID = TextEditingController();
  final siteID = TextEditingController();
  final mrID = TextEditingController();
  final mrName = TextEditingController();
  final mrCode = TextEditingController();
  final capacity = TextEditingController();
  final floor = TextEditingController();
  final availableStatus = TextEditingController();
  final remarks = TextEditingController();

  late TextEditingController autocompleteController = TextEditingController();
  late TextEditingController autocompleteApproverController = TextEditingController();

  bool isApproval = false;

  bool showFacilitiesError = false;
  List<FacilityModel> listFacility = <FacilityModel>[];
  List<FacilityModel> listSelectedFacility = <FacilityModel>[];

  bool showApproversError = false;
  List<EmployeeModel> listApprover = <EmployeeModel>[];
  List<EmployeeModel> listSelectedApprover = <EmployeeModel>[];


  List<comp.Data> companyList = [];
  List<site.Data> siteList = [];

  @override
  void onInit() {
    super.onInit();
    fetchCompanyList();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  initData() async {
    String companyName = await storage.readString(StorageCore.companyName);
    String siteName = await storage.readString(StorageCore.siteName);
    String siteId = await storage.readString(StorageCore.siteID);
    String codeRole = await storage.readString(StorageCore.codeRole);

    companyController.text = companyName;
    siteController.text = siteName;
  }

  Future<void> fetchCompanyList() async {
    companyList = [];
    siteList = [];
    loadCompany = true;
    loadSite = true;
    try {
      await repository.getCompanyList().then((value) => companyList.addAll(value.data?.toSet().toList() ?? []));

      await repository.getSiteList().then((value) => siteList.addAll(value.data?.toSet().toList() ?? []));
    } catch (e) {
      e.printError();
    }
    loadCompany = false;
    loadSite = false;
    update();
  }

  Future<void> fetchSiteList(String id) async {
    siteList = [];
    loadSite = true;
    try {
      await repository.getSiteListByCompanyID(id).then((value) => siteList.addAll(value.data?.toSet().toList() ?? []));
    } catch (e) {
      e.printError();
    }
    loadSite = false;
    update();
  }

  Future<void> saveMeetingRoom() async {
    String companyId = await storage.readString(StorageCore.companyID);
    String siteId = await storage.readString(StorageCore.siteID);

    try {
      await managementMeetingRoom
          .save(
        companyId,
        siteId,
        mrName.text,
        // mrCode.text,
        capacity.text,
        floor.text,
        availableStatus.text,
        isApproval,
        listSelectedApprover.map((e) => e.id).toList(),
        listSelectedFacility.map((e) => e.id).toList(),
      )
          .then((value) {
        Get.back();
        Get.showSnackbar(const GetSnackBar(
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          message: "Data Saved",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: successColor,
        ));
      });
    } catch (e) {
      e.printError();
    }
    update();
  }

  void deleteFacilityItem(FacilityModel item) {
    listSelectedFacility.removeWhere((element) => item.id == element.id);
  }

  void deleteApproverItem(EmployeeModel item) {
    listSelectedApprover.removeWhere((element) => item.id == element.id);
  }

  Future<List<FacilityModel>> getFacilityByKeyword(String keyword)async{

    listFacility.clear();
    final facilities = await getListFacility(keyword: keyword);
    listFacility.addAll(facilities);
    listFacility.removeWhere((element) => listSelectedFacility.contains(element));

    return listFacility;
  }

  Future<List<EmployeeModel>> getApproverByKeyword(String keyword)async{
    String companyID = await storage.readString(StorageCore.companyID);

    listApprover.clear();
    final approvers = await getListSecretaryByCompanyId(companyID);
    listApprover.addAll(approvers);
    listApprover.removeWhere((element) => listSelectedApprover.contains(element));

    return listApprover;
  }

}
