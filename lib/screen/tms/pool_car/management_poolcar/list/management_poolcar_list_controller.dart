import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/pool_car/management_poolcar/get_car_list_model.dart' as car;
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:get/get.dart';

class ManagementPoolCarListController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final keyword = "".obs;

  bool dataisnull = false;
  bool isLoading = false;
  String? searchValue;
  String? filterValue;
  int selectedCompany = 0;
  int selectedSite = 0;
  int currentPage = 1;

  car.GetCarListModel? carModel;
  List<car.Data2> carList = [];
  List<comp.Data> companyList = [];
  List<site.Data> siteList = [];

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchList(1), fetchFilter()]);
  }

  void clearSearch(String search) {
    keyword(search);
    currentPage = 1;
    searchValue = null;
    fetchList(1);
    update();
  }

  void resetFilter() {
    formKey.currentState?.reset();
    selectedCompany = 0;
    selectedSite = 0;
    update();
  }

  Future<void> fetchFilter() async {
    companyList = [];
    siteList = [];

    try {
      await repository.getCompanyList().then((value) {
        companyList.add(comp.Data(id: 0, companyName: "All"));
        companyList.addAll(value.data?.toSet().toList() ?? []);
      });

      await repository.getSiteList().then((value) {
        siteList.add(site.Data(id: 0, companyName: "All"));
        siteList.addAll(value.data?.toSet().toList() ?? []);
      });
    } catch (e) {
      e.printError();
    }
    update();
  }

  Future<void> fetchList(int page) async {
    isLoading = true;
    dataisnull = false;
    carList = [];
    try {
      await managementPoolCar
          .getList(
        10,
        page,
        searchValue,
        selectedCompany == 0 ? null : selectedCompany,
        selectedSite == 0 ? null : selectedSite,
      )
          .then((value) {
        carList.addAll(value.data?.data?.toSet().toList() ?? []);
        carModel = value;
      });
    } catch (e, i) {
      i.printError();
      e.printError();
      dataisnull = true;
    }
    isLoading = false;
    update();
  }

  Future<void> deleteData(int id) async {
    isLoading = true;
    try {
      await managementPoolCar.delete(id).then((value) {
        Get.showSnackbar(GetSnackBar(
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          message: "Data Deleted",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: greenColor,
        ));
        fetchList(currentPage);
      });
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Delete Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
    isLoading = false;
    update();
  }
}
