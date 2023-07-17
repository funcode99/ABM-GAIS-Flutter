import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/approval_request_atk/approval_request_atk_model.dart';
import 'package:gais/data/model/request_atk/request_atk_detail_model.dart';
import 'package:gais/data/repository/request_atk/request_atk_repository.dart';
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
  final listEditedDetail = <RequestATKDetailModel>[].obs;

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
        listEditedDetail.add(RequestATKDetailModel(
          id: item.id,
          qty: item.qty,
          idItem: item.idItem,
          idAtkRequest: item.idAtkRequest,
          idWarehouse: item.idWarehouse,
          idBrand: item.idBrand,
          idUom: item.idUom
        ));
      }
    });
  }
}
