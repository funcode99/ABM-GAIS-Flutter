import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/master/city/city_model.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormActivityActualizationTripController extends  BaseController
    with MasterDataMixin {
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final dateController = TextEditingController();
  final activitiesController = TextEditingController();

  final enableButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData()async{


  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

}