import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:get/get.dart';

class AddRoomInfoController extends BaseController {
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

  List<comp.Data> companyList = [];
  List<site.Data> siteList = [];

  @override
  void onInit() {
    super.onInit();
    fetchCompanyList();
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

  Future<void> fetchSiteList(int id) async {
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
    try {
      await managementMeetingRoom
          .save(
        companyID.text,
        siteID.text,
        mrName.text,
        mrCode.text,
        capacity.text,
        floor.text,
        availableStatus.text,
      )
          .then((value) {
        Get.back();
        Get.showSnackbar(GetSnackBar(
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
}
