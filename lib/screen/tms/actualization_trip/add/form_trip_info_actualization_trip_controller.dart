import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/master/city/city_model.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormTripInfoActualizationTripController extends  BaseController
    with MasterDataMixin {
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final departureDate = TextEditingController();
  final arrivalDate = TextEditingController();
  final listCity =  <CityModel>[].obs;
  final selectedFrom =  Rxn<CityModel>();
  final selectedTo =  Rxn<CityModel>();

  final enableButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData()async{
    listCity.clear();
    final cities = await getListCity();
    listCity.addAll(cities);

  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

  void onChangeSelectedFrom(dynamic id){
    final selected = listCity.firstWhere((item) => item.id.toString() == id.toString());
    selectedFrom(selected);
  }

  void onChangeSelectedTo(dynamic id){
    final selected = listCity.firstWhere((item) => item.id.toString() == id.toString());
    selectedTo(selected);
  }
}