import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/model/master/warehouse/warehouse_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/repository/management_item_atk/management_item_atk_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ManagementItemATKListController extends BaseController
    with MasterDataMixin {
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  //filter
  final listCompany = <CompanyModel>[].obs;
  final selectedCompany = Rxn<CompanyModel>();
  final selectedCompanyTemp = Rxn<CompanyModel>();

  final listSite = <SiteModel>[].obs;
  final selectedSite = Rxn<SiteModel>();
  final selectedSiteTemp = Rxn<SiteModel>();

  final listWarehouse = <WarehouseModel>[].obs;
  final selectedWarehouse = Rxn<WarehouseModel>();
  final selectedWarehouseTemp = Rxn<WarehouseModel>();

  final listItem = <ManagementItemATKModel>[].obs;
  final selectedItem = Rxn<ManagementItemATKModel>();
  final selectedItemTemp = Rxn<ManagementItemATKModel>();

  //end filter

  String tempSelectedValue = "";
  String selectedValue = "";

  final keyword = "".obs;

  final listHeader = <ManagementItemATKModel>[].obs;
  final ManagementItemATKRepository _repository = Get.find();
  late PaginationModel? paginationModel;
  final totalPage = 1.obs;
  final currentPage = 1.obs;
  int limit = 10;

  @override
  void onInit() {
    super.onInit();
    getHeader();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData() async {
    listCompany.add(CompanyModel(id: "", companyName: "Company"));
    final companies = await getListCompany();
    listCompany.addAll(companies);
    onChangeSelectedCompany("");

    listSite.add(SiteModel(id: "", siteName: "Site"));
    final sites = await getListSite();
    listSite.addAll(sites);
    onChangeSelectedSite("");
  }

  void getHeader({int page = 1}) async {
    listHeader
        .clear(); //clear first, because when not found its not [] but error 404 :)
    final result = await _repository.getPaginationData(
        data: {"page": page, "perPage": limit, "search": keyword.value});

    result.fold((l) {
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
      totalPage(1);
      currentPage(1);
    }, (r) {
      paginationModel = r;
      int tempTotalPage = (paginationModel!.total! / limit).ceil();
      totalPage(tempTotalPage);
      currentPage(paginationModel?.currentPage);

      listHeader.value = paginationModel!.data!
          .map((e) => ManagementItemATKModel.fromJson(e))
          .toList();
      listHeader.refresh();
    });
  }

  void deleteHeader(ManagementItemATKModel item) async {
    final result = await _repository.deleteData(item.id!);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (r) {
      Get.showSnackbar(CustomGetSnackBar(
        message: "Success Delete Data".tr,
      ));
      getHeader();
    });
  }

  void applySearch(String search){
    keyword(search);
    getHeader(page: 1);
  }

  void resetFilter(){
    onChangeSelectedCompany("");
  }

  void openFilter(){
    selectedCompanyTemp.value = selectedCompany.value;
  }

  void applyFilter(){
    selectedCompany.value = selectedCompanyTemp.value;

    getHeader();
  }

  void onChangeSelectedCompany(String id) {
    final selected = listCompany.firstWhere(
        (item) => item.id.toString() == id.toString(),
        orElse: () => listCompany.first);
    selectedCompanyTemp(selected);
  }

  void onChangeSelectedSite(String id) {
    final selected = listSite.firstWhere(
            (item) => item.id.toString() == id.toString(),
        orElse: () => listSite.first);
    selectedSiteTemp(selected);
  }
}
