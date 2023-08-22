import 'dart:convert';

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

class DeliveryApprovalRequestATKController extends BaseController {
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final selectedItem = ApprovalRequestATKModel().obs;
  final approvalModel = Rxn<ApprovalModel>();

  final listDetail = <RequestATKDetailModel>[].obs;
  final listDetailApproval = <WarehouseDetailModel>[].obs;
  // final listEditedDetail = <RequestATKDetailModel>[].obs;

  final mapATKConfirmation = <String, dynamic>{}.obs;
  final mapATKSelected = <String, dynamic>{}.obs;

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
    result.fold((l) => null, (r) async{
      listDetail.value = [...r];

      final resultDataApproval = await _repository.getDetailsApproval(selectedItem.value.id!);
      resultDataApproval.fold(
          (l2){

          },
          (r2){
            for (RequestATKDetailModel item in r) {
              List<WarehouseDetailModel>? listDetailWarehouse = [];
              item.arrayWarehouse?.forEach((e){
                final tempWarehouse = WarehouseDetailModel.fromJson(e);
                List<WarehouseDetailModel> tempList = r2.where((element){
                  return element.idAtkRequestDetail == item.id && element.idWarehouse == tempWarehouse.idWarehouse && element.idItem == item.idItem;
                }).toList();

                if(tempList.isNotEmpty){
                  final tempWarehouseForApproval = tempList.first;


                  WarehouseDetailModel warehouseDetailModel = WarehouseDetailModel(
                    idItem: item.idItem,
                    idAtkRequestDetail: item.id,
                    stockAvailable: tempWarehouse.stockAvailable,
                    remarks: tempWarehouse.remarks,
                    idWarehouse: tempWarehouse.idWarehouse,
                    qtyApproved: tempWarehouseForApproval.qtyApproved ?? 0,
                    warehouseName: tempWarehouse.warehouseName,
                    maxValue: tempWarehouseForApproval.qtyApproved ?? 0,
                  );

                  listDetailWarehouse.add(warehouseDetailModel);

                }
              });



              Map<String, dynamic> detail = {
                "detail" : item,
                "listDetailWarehouse" : listDetailWarehouse,
              };

              //init maximum value
              Map<String, dynamic> maxMap = {};
              for(WarehouseDetailModel warehouseDetailModel in listDetailWarehouse){
                maxMap.putIfAbsent("${warehouseDetailModel.idWarehouse}", () => 0);
              }

              mapATKConfirmation.putIfAbsent("${item.id}", () => detail);


            }
          }
      );

      
    });
  }


  List<WarehouseDetailModel> listDetailWarehouse(dynamic id){
    List<WarehouseDetailModel> result = [];

    if(mapATKConfirmation["$id"]!=null){
      final temp =   List<WarehouseDetailModel>.from(mapATKConfirmation["$id"]["listDetailWarehouse"]).toList();
      result.addAll(temp);
    }

    return result;
  }

  void addQuantity(dynamic value, dynamic id, WarehouseDetailModel item){
    Map<String, dynamic> tempMapATKConfirmation = Map<String, dynamic>.from(mapATKConfirmation);
    List<WarehouseDetailModel> listDetailWarehouse = List<WarehouseDetailModel>.from(tempMapATKConfirmation["${id}"]["listDetailWarehouse"]).toList();

    WarehouseDetailModel newItem = WarehouseDetailModel(
        idWarehouse: item.idWarehouse,
        warehouseName: item.warehouseName,
        idItem: item.idItem,
        remarks: item.remarks,
        stockAvailable: item.stockAvailable,
        idAtkRequestDetail: item.idAtkRequestDetail,
        qtyApproved: value,
        maxValue: item.maxValue
    );

    int index = listDetailWarehouse.indexWhere((element) => element.idWarehouse == item.idWarehouse);
    listDetailWarehouse[index] = newItem;
    tempMapATKConfirmation["${id}"]["listDetailWarehouse"] = listDetailWarehouse;

    mapATKConfirmation.clear();
    mapATKConfirmation.value = Map<String, dynamic>.from(tempMapATKConfirmation);
  }

  void confirm(){
    List<WarehouseDetailModel> warehouseDetail = [];

    mapATKConfirmation.forEach((key, value) {
      List<WarehouseDetailModel> listDetailWarehouse = List<WarehouseDetailModel>.from(value["listDetailWarehouse"]).toList();
      for(WarehouseDetailModel item in listDetailWarehouse){
        warehouseDetail.add(
          WarehouseDetailModel(
            qtyApproved: item.qtyApproved,
            idAtkRequestDetail: item.idAtkRequestDetail,
            idWarehouse: item.idWarehouse,
            remarks: noteController.text,
            idItem: item.idItem,
          )
        );
      }
    });

    Get.back(
      result: ApprovalModel(
          notes: noteController.text,
          warehouseDetail: warehouseDetail
    ));
  }
}
