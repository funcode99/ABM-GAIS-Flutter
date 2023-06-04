import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/master/warehouse/warehouse_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_model.dart';
import 'package:gais/data/repository/stock_in/stock_in_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StockInListController extends BaseController with MasterDataMixin{
  final TextEditingController dateRangeController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat formatFilter = DateFormat("yyyy-MM-dd");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();
  final startDateTemp = Rxn<DateTime>();
  final endDateTemp = Rxn<DateTime>();
  final selectedWarehouse = Rxn<WarehouseModel>();
  final selectedWarehouseTemp = Rxn<WarehouseModel>();

  final keyword = "".obs;

  final listHeader = <StockInATKModel>[].obs;
  final listWarehouse = <WarehouseModel>[].obs;

  final StockInATKRepository _repository = Get.find();
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

  void initData()async{
    listWarehouse.add(WarehouseModel(id: "", warehouseName: "Warehouse"));
    final warehouses = await getListWarehouse();
    listWarehouse.addAll(warehouses);
    onChangeSelectedWarehouse("");
  }

  void getHeader({int page = 1}) async {
    final result = await _repository.getPaginationData(
        data: {
          "page" : page,
          "perPage" : limit,
          "search" : keyword.value,
          "id_warehouse" : selectedWarehouse.value?.id ?? "",
          "id_company" : "", //TODO : ID COMPANY FILTER
          "date" : startDate.value != null ? formatFilter.format(startDate.value!) : "",
          "start_date" : startDate.value != null ? formatFilter.format(startDate.value!) : "",
          "end_date" : endDate.value != null ? formatFilter.format(endDate.value!) : "",
        }
    );

    result.fold(
            (l) {
          Get.showSnackbar(
              CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
          listHeader.clear();
          totalPage(1);
          currentPage(1);
        },
            (r) {
          paginationModel = r;
          int tempTotalPage = (paginationModel!.total!/limit).ceil();
          totalPage(tempTotalPage);
          currentPage(paginationModel?.currentPage);

          listHeader.value = paginationModel!.data!
              .map((e) => StockInATKModel.fromJson(e))
              .toList();
          listHeader.refresh();
        });
  }

  void onChangeSelectedWarehouse(String id) {
    final selected = listWarehouse.firstWhere((item) => item.id.toString() == id.toString());
    selectedWarehouseTemp(selected);
  }

  void applySearch(String search){
    keyword(search);
    getHeader(page: 1);
  }

  void resetFilter(){
    endDateTemp.value = null;
    startDateTemp.value = null;
    onChangeSelectedWarehouse("");
    dateRangeController.text = "";
  }

  void openFilter(){
    startDateTemp.value = startDate.value;
    endDateTemp.value = endDate.value;
    selectedWarehouseTemp.value = selectedWarehouse.value;
    if(startDateTemp.value!=null){
      dateRangeController.text = "${dateFormat.format(startDateTemp.value!)} - ${dateFormat.format(endDateTemp.value!)}";
    }else{
      dateRangeController.text = "";
    }

  }

  void applyFilter(){
    startDate.value = startDateTemp.value;
    endDate.value = endDateTemp.value;
    selectedWarehouse.value = selectedWarehouseTemp.value;

    getHeader();
  }
}
