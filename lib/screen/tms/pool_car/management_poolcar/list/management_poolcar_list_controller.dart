import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/model/pool_car/management_poolcar/get_car_list_model.dart' as car;
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';

import '../../../../../data/storage_core.dart';

class ManagementPoolCarListController extends BaseController with MasterDataMixin {
  final formKey = GlobalKey<FormState>();


  List<CompanyModel> listCompany = [];
  CompanyModel? selectedCompany;
  CompanyModel? selectedCompanyTemp;

  List<SiteModel> listSite = [];
  SiteModel? selectedSite;
  SiteModel? selectedSiteTemp;

  final companyTextEditingController = TextEditingController();
  final siteTextEditingController = TextEditingController();

  final keyword = "".obs;

  bool enableSelectCompany = false;

  bool dataisnull = false;
  bool isLoading = false;
  String? searchValue;
  String? filterValue;
  int currentPage = 1;

  car.GetCarListModel? carModel;
  List<car.Data2> carList = [];

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

    if(codeRole == RoleEnum.administrator.value){
      enableSelectCompany = true;
    }

    listCompany.clear();
    listSite.clear();

    listCompany.add(CompanyModel(id: "", companyName: "Company"));
    listSite.add(SiteModel(id: "", siteName: "Site"));

    try {
      getListCompany().then((value) => listCompany.addAll(value)).then((value) {
        if(enableSelectCompany){
          selectedCompany = listCompany.first;
        }
      });

    } catch (e) {
      e.printError();
    }

    if(!enableSelectCompany){
      String idCompany = await storage.readString(StorageCore.companyID);
      String companyName = await storage.readString(StorageCore.companyName);

      selectedCompany = CompanyModel(
          id: idCompany,
      );
      companyTextEditingController.text = companyName;
    }

    getListSiteByCompanyId(selectedCompany?.id).then((value) => listSite.addAll(value));

    update();

    fetchList(1);
  }

  void clearSearch(String search) {
    keyword(search);
    currentPage = 1;
    searchValue = null;
    fetchList(1);
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
        selectedCompany?.id.toString() != "" ? selectedCompany?.id.toString().toInt() : null,
        selectedSite?.id.toString() != "" ? selectedSite?.id.toString().toInt() : null,
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
      isLoadingHitApi(true);
      await managementPoolCar.delete(id).then((value) {
        isLoadingHitApi(false);
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
      isLoadingHitApi(false);
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

  void applySearch(String search){
    keyword(search);
    fetchList(1);
  }

  void openFilter(){
    selectedCompanyTemp = selectedCompany;
    selectedSiteTemp = selectedSite;
    print("LIST SITE ${listSite.length}");
    print("selectedSiteTemp ${selectedSiteTemp?.toJson()}");
  }

  void applyFilter(){
    selectedCompany = selectedCompanyTemp;
    selectedSite = selectedSiteTemp;

    fetchList(1);
  }

  void resetFilter()async{
    if(enableSelectCompany){
      onChangeSelectedCompany("");
    }else{
      String idCompany = await storage.readString(StorageCore.companyID);
      onChangeSelectedCompany(idCompany);
    }
  }


  void onChangeSelectedCompany(String id) {
    final selected = listCompany.firstWhere(
            (item) => item.id.toString() == id.toString(),
        orElse: () => listCompany.first);
    selectedCompanyTemp = selected;

    listSite.removeWhere((element) => element.id!="");

    getListSiteByCompanyId(selectedCompanyTemp?.id).then((value){
      listSite.addAll(value);
      update();
      onChangeSelectedSite("");
    });

  }

  void onChangeSelectedSite(String id) {
    final selected = listSite.firstWhere(
            (item) => item.id.toString() == id.toString(),
        orElse: () => listSite.first);
    selectedSiteTemp = selected;
    print("selectedSiteTempxx ${selectedSiteTemp?.toJson()}");
    update();
  }

}
