import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/model/master/warehouse/warehouse_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/repository/management_item_atk/management_item_atk_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
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
  final listSiteFiltered = <SiteModel>[].obs;
  final selectedSite = Rxn<SiteModel>();
  final selectedSiteTemp = Rxn<SiteModel>();

  final listWarehouse = <WarehouseModel>[].obs;
  final listWarehouseFiltered = <WarehouseModel>[].obs;
  final selectedWarehouse = Rxn<WarehouseModel>();
  final selectedWarehouseTemp = Rxn<WarehouseModel>();

  final listItem = <ManagementItemATKModel>[].obs;
  final selectedItem = Rxn<ManagementItemATKModel>();
  final selectedItemTemp = Rxn<ManagementItemATKModel>();
  final emptyItem = ManagementItemATKModel(id: null, itemName: "Item");

  final enableSelectCompany = false.obs;

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
    String codeRole = await storage.readString(StorageCore.codeRole);

    listCompany.add(CompanyModel(id: "", companyName: "Company"));
    final companies = await getListCompany();
    listCompany.addAll(companies);

    listSiteFiltered.add(SiteModel(id: "", siteName: "Site"));
    final sites = await getListSite();
    listSite.addAll(sites);

    listWarehouseFiltered.add(WarehouseModel(id: "", warehouseName: "Warehouse"));
    final warehouses = await getListWarehouse();
    listWarehouse.addAll(warehouses);

    listItem.add(emptyItem);

    if(codeRole == RoleEnum.superAdmin.value){
      enableSelectCompany(true);
      onChangeSelectedCompany("");
    }else{
      String idCompany = await storage.readString(StorageCore.companyID);
      selectedCompany.value = CompanyModel(
          id: idCompany
      );
      onChangeSelectedCompany(idCompany);
    }

    onChangeSelectedSite("");
    onChangeSelectedWarehouse("");
  }

  void getHeader({int page = 1}) async {
    final result = await _repository.getPaginationData(
        data: {
          "page": page,
          "perPage": limit,
          "search": keyword.value,
          "id_company" : selectedCompany.value?.id ?? "",
          "id_site" : selectedSite.value?.id ?? "",
          "id_warehouse" : selectedWarehouse.value?.id ?? "",
          "item_name" : selectedItem.value?.id != null ? selectedItem.value?.itemName ?? "" : "",
          "id_item" : selectedItem.value?.id ?? "",
        });

    result.fold((l) {
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
      listHeader.clear();
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

  void resetFilter()async{
    if(enableSelectCompany.value){
      onChangeSelectedCompany("");
    }else{
      String idCompany = await storage.readString(StorageCore.companyID);
      onChangeSelectedCompany(idCompany);
    }
    onChangeSelectedSite("");
    onChangeSelectedWarehouse("");
    onChangeSelectedItem("");
  }

  void openFilter(){
    selectedCompanyTemp.value = selectedCompany.value;
    selectedSiteTemp.value = selectedSite.value;
    selectedWarehouseTemp.value = selectedWarehouse.value;
    selectedItemTemp.value = selectedItem.value;
  }

  void applyFilter(){
    selectedCompany.value = selectedCompanyTemp.value;
    selectedSite.value = selectedSiteTemp.value;
    selectedWarehouse.value = selectedWarehouseTemp.value;
    selectedItem.value = selectedItemTemp.value;

    getHeader();
  }

  void onChangeSelectedCompany(String id) {
    final selected = listCompany.firstWhere(
        (item) => item.id.toString() == id.toString(),
        orElse: () => listCompany.first);
    selectedCompanyTemp(selected);

    //clear site and filter sites
    onChangeSelectedSite("");
    _filterSite(selected.id.toString());
  }

  void onChangeSelectedSite(String id) {
    final selected = listSiteFiltered.firstWhere(
            (item) => item.id.toString() == id.toString(),
        orElse: () => listSiteFiltered.first);
    selectedSiteTemp(selected);

    //clear warehouse and filter warehouses
    onChangeSelectedWarehouse("");
    _filterWarehouse(selected.id.toString());
  }

  void onChangeSelectedWarehouse(String id) {
    final selected = listWarehouseFiltered.firstWhere(
            (item) => item.id.toString() == id.toString(),
        orElse: () => listWarehouseFiltered.first);
    selectedWarehouseTemp(selected);

    _getItemData();
  }

  void onChangeSelectedItem(String id) {
    final selected = listItem.firstWhere(
            (item) => item.id.toString() == id.toString(),
        orElse: () => listItem.first);
    selectedItemTemp(selected);
  }

  _getItemData()async{
    listItem.removeWhere((element) => element.id != null);

    if(selectedWarehouseTemp.value?.id != ""){
      final items = await getListItemByWarehouseId(selectedWarehouseTemp.value!.id!);
      listItem.addAll(items);
    }
    onChangeSelectedItem("");
  }


  void _filterSite(String idCompany)async{
    listSiteFiltered.removeWhere((element) => element.id != "");
    if(idCompany.isNotEmpty){
      final filtered = await getListSiteByCompanyId(idCompany.toInt());
      // final filtered = listSite.where((item) => item.idCompany.toString() == idCompany);
      listSiteFiltered.addAll(filtered);
    }
  }

  void _filterWarehouse(String idSite)async{
    listWarehouseFiltered.removeWhere((element) => element.id != "");
    if(idSite.isNotEmpty){
      final filtered = await getListWarehouseBySiteId(idSite.toInt());
      // final filtered = listWarehouse.where((item) => item.idSite.toString() == idSite);
      listWarehouseFiltered.addAll(filtered);
    }
  }
}
