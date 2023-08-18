import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/approval_request_atk/approval_request_atk_model.dart';
import 'package:gais/data/model/master/warehouse/warehouse_detail_model.dart';
import 'package:gais/data/model/request_atk/request_atk_detail_model.dart';
import 'package:gais/data/repository/request_atk/request_atk_repository.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConfirmApprovalRequestATKController extends BaseController {
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final selectedItem = ApprovalRequestATKModel().obs;
  final approvalModel = Rxn<ApprovalModel>();

  final listDetail = <RequestATKDetailModel>[].obs;
  // final listEditedDetail = <RequestATKDetailModel>[].obs;

  final mapATKConfirmation = <String, dynamic>{}.obs;
  final mapATKSelected = <String, dynamic>{}.obs;
  final mapMaxValue = <String, dynamic>{}.obs;

  final RequestATKRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getDataDetail();
  }

  void getDataDetail() async {
    final result = await _repository.getDataDetails(selectedItem.value.id!);
    result.fold((l) => null, (r) {
      listDetail.value = [...r];

      for (RequestATKDetailModel item in r) {
        /*listEditedDetail.add(RequestATKDetailModel(
          id: item.id,
          qty: item.qty,
          idItem: item.idItem,
          idAtkRequest: item.idAtkRequest,
          idWarehouse: item.idWarehouse,
          idBrand: item.idBrand,
          idUom: item.idUom
        ));*/

        List<WarehouseDetailModel>? listDetailWarehouse = item.arrayWarehouse?.map((e) => WarehouseDetailModel.fromJson(e)).toList() ?? [];
        List<WarehouseDetailModel>? listNotSelected = item.arrayWarehouse?.map((e) => WarehouseDetailModel.fromJson(e)).toList() ?? [];


        Map<String, dynamic> detail = {
          "detail" : item,
          "listDetail" : listDetailWarehouse,
          "listSelected" : [],
          "listNotSelected" : listNotSelected
        };

        //init maximum value
        Map<String, dynamic> maxMap = {};
        for(WarehouseDetailModel warehouseDetailModel in listDetailWarehouse){
          maxMap.putIfAbsent("${warehouseDetailModel.idWarehouse}", () => 0);
        }
        mapMaxValue["${item.id}"] = maxMap;
        print("INIT $mapMaxValue");

        mapATKConfirmation.putIfAbsent("${item.id}", () => detail);

      }
    });
  }


  void setMaximumValue(dynamic id){
    Map<String, dynamic> tempMapMaxValue = Map<String, dynamic>.from(mapMaxValue);
    RequestATKDetailModel requestATKDetailModel = mapATKConfirmation["$id"]["detail"];
    int qty = requestATKDetailModel.qty.toString().toInt();

    List<WarehouseDetailModel> listSelected = List<WarehouseDetailModel>.from(mapATKConfirmation["${id}"]["listSelected"]).toList();

    Map<String, dynamic> maxValuesPerItem = Map<String, dynamic>.from(tempMapMaxValue["$id"] ?? {});
    maxValuesPerItem.forEach((key, value) {

      WarehouseDetailModel? warehouseDetailModel = listSelected.firstWhereOrNull((element) => element.idWarehouse.toString() == key.toString());
      int availableStock = warehouseDetailModel?.stockAvailable ?? 0;

      int otherTotalQuantity = 0;
      for(WarehouseDetailModel item in listSelected){
        if(item.idWarehouse.toString() != key.toString()){

          if(item.qtyApproved != null){
            int currentQuantity = item.qtyApproved.toString().toInt();
            otherTotalQuantity += currentQuantity;
          }

        }
      }

      int newMaxValue = qty - otherTotalQuantity;

      if(newMaxValue > availableStock){
        newMaxValue = availableStock;
      }
      tempMapMaxValue["$id"][key.toString()] = newMaxValue;
    });

    mapMaxValue.clear();
    mapMaxValue.value = Map<String, dynamic>.from(tempMapMaxValue);
    print("MAPMAXVALUE $mapMaxValue");

  }

  List<WarehouseDetailModel> listSelected(dynamic id){
    List<WarehouseDetailModel> result = [];

    if(mapATKConfirmation["$id"]!=null){
      final temp =   List<WarehouseDetailModel>.from(mapATKConfirmation["$id"]["listSelected"]).toList();
      result.addAll(temp);
    }

    return result;
  }

  List<WarehouseDetailModel> listNotSelected(dynamic id){
    List<WarehouseDetailModel> result = [];

    if(mapATKConfirmation["$id"]!=null){
      final temp =   List<WarehouseDetailModel>.from(mapATKConfirmation["$id"]["listNotSelected"]).toList();
      result.addAll(temp);
    }

    return result;
  }

  void addWarehouse(dynamic id, WarehouseDetailModel item){
    Map<String, dynamic> tempMapATKConfirmation = Map<String, dynamic>.from(mapATKConfirmation);
    List<WarehouseDetailModel> listSelected = List<WarehouseDetailModel>.from(tempMapATKConfirmation["${id}"]["listSelected"]).toList();
    List<WarehouseDetailModel> listNotSelected = List<WarehouseDetailModel>.from(tempMapATKConfirmation["${id}"]["listNotSelected"]).toList();

    listSelected.add(item);
    listNotSelected.removeWhere((element) => element.idWarehouse == item.idWarehouse);
    tempMapATKConfirmation["${id}"]["listSelected"] = listSelected;
    tempMapATKConfirmation["${id}"]["listNotSelected"] = listNotSelected;

    mapATKConfirmation.clear();
    mapATKConfirmation.value = Map<String, dynamic>.from(tempMapATKConfirmation);

    setMaximumValue(id);
  }

  void deleteWarehouse(dynamic id, WarehouseDetailModel item){
    Map<String, dynamic> tempMapATKConfirmation = Map<String, dynamic>.from(mapATKConfirmation);
    List<WarehouseDetailModel> listSelected = List<WarehouseDetailModel>.from(tempMapATKConfirmation["${id}"]["listSelected"]).toList();
    List<WarehouseDetailModel> listNotSelected = List<WarehouseDetailModel>.from(tempMapATKConfirmation["${id}"]["listNotSelected"]).toList();

    listNotSelected.add(item);
    listSelected.removeWhere((element) => element.idWarehouse == item.idWarehouse);
    tempMapATKConfirmation["${id}"]["listSelected"] = listSelected;
    tempMapATKConfirmation["${id}"]["listNotSelected"] = listNotSelected;

    mapATKConfirmation.clear();
    mapATKConfirmation.value = Map<String, dynamic>.from(tempMapATKConfirmation);

    setMaximumValue(id);
  }

  void addQuantity(dynamic value, dynamic id, WarehouseDetailModel item){
    Map<String, dynamic> tempMapATKConfirmation = Map<String, dynamic>.from(mapATKConfirmation);
    List<WarehouseDetailModel> listSelected = List<WarehouseDetailModel>.from(tempMapATKConfirmation["${id}"]["listSelected"]).toList();

    WarehouseDetailModel newItem = WarehouseDetailModel(
      idWarehouse: item.idWarehouse,
      warehouseName: item.warehouseName,
      idItem: item.idItem,
      remarks: item.remarks,
      stockAvailable: item.stockAvailable,
      idAtkRequestDetail: item.idAtkRequestDetail,
      qtyApproved: value
    );

    int index = listSelected.indexWhere((element) => element.idWarehouse == item.idWarehouse);
    listSelected[index] = newItem;
    tempMapATKConfirmation["${id}"]["listSelected"] = listSelected;

    mapATKConfirmation.clear();
    mapATKConfirmation.value = Map<String, dynamic>.from(tempMapATKConfirmation);

    setMaximumValue(id);
  }
}
