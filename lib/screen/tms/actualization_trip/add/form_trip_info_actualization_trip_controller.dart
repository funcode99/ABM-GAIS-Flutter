import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/actualization_trip/trip_info_model.dart';
import 'package:gais/data/model/master/city/city_model.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormTripInfoActualizationTripController extends  BaseController
    with MasterDataMixin {
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat saveFormat = DateFormat("yyyy-MM-dd");

  final departureDateController = TextEditingController();
  final arrivalDateController = TextEditingController();
  final departureDate = Rxn<DateTime>();
  final arrivalDate = Rxn<DateTime>();

  final listCity =  <CityModel>[].obs;
  final selectedFrom =  Rxn<CityModel>();
  final selectedTo =  Rxn<CityModel>();

  final tripInfoModel = Rxn<TripInfoModel>();

  final enableButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
    listCity.clear();
    getListCity().then((cities){
      listCity.addAll(cities);

      if(tripInfoModel.value != null){
        if(tripInfoModel.value!.idCityFrom != null){
          selectedFrom.value = listCity.firstWhere((element) => element.id == tripInfoModel.value?.idCityFrom);
        }

        if(tripInfoModel.value!.idCityTo != null){
          selectedTo.value = listCity.firstWhere((element) => element.id == tripInfoModel.value?.idCityTo);
        }
      }
    });

    if(tripInfoModel.value != null){
      String departureDateString = tripInfoModel.value?.dateDeparture ?? tripInfoModel.value?.dateDepartTransportation ?? "";
      String arrivalDateString = tripInfoModel.value?.dateArrival ?? tripInfoModel.value?.dateReturnTransportation ?? "";

      if(departureDateString.isNotEmpty){
        try{
          departureDate.value = departureDateString.toDate(originFormat: "yyyy-MM-dd HH:mm:ss");
        }on FormatException catch(e){
          departureDate.value = departureDateString.toDate(originFormat: "yyyy-MM-dd");
        } catch(e){
          print("error $e");
        }
      }

      if(arrivalDateString.isNotEmpty){
        try{
          arrivalDate.value = arrivalDateString.toDate(originFormat: "yyyy-MM-dd HH:mm:ss");
        }on FormatException catch(e){
          arrivalDate.value = arrivalDateString.toDate(originFormat: "yyyy-MM-dd");
        } catch(e){
          print("error $e");
        }
      }

      if(departureDate.value != null){
        departureDateController.text = departureDate.value != null ? dateFormat.format(departureDate.value!) : "";
      }
      if(arrivalDate.value != null){
        arrivalDateController.text = arrivalDate.value != null ? dateFormat.format(arrivalDate.value!) : "";
      }

    }
  }

  TripInfoModel? saveButton(){
    TripInfoModel? result;
    if(tripInfoModel.value != null){
      result = tripInfoModel.value?.copyWith(
        dateDeparture: saveFormat.format(departureDate.value!),
        dateArrival: saveFormat.format(arrivalDate.value!),
        idCityFrom: selectedFrom.value?.id,
        idCityTo: selectedTo.value?.id,
        nameCityFrom: selectedFrom.value?.cityName,
        nameCityTo: selectedTo.value?.cityName,
      );
    }else{
      final tripInfoModel = TripInfoModel(
          dateDeparture: saveFormat.format(departureDate.value!),
          dateArrival: saveFormat.format(arrivalDate.value!),
          deletable: true,
          origin: selectedFrom.value?.cityCode,
          destination: selectedTo.value?.cityCode,
          idCityFrom: selectedFrom.value?.id,
          idCityTo: selectedTo.value?.id,
          nameCityFrom: selectedFrom.value?.cityName,
          nameCityTo: selectedTo.value?.cityName,
      );
      result = tripInfoModel.copyWith(
        key: "${tripInfoModel.hashCode}"
      );
    }

    return result;
  }

  void onChangeDepartureDate(DateTime dateTime){
    if(arrivalDate.value!=null){
      if(dateTime.isAfter(arrivalDate.value!)){
        arrivalDate.value = null;
        arrivalDateController.text = "";
      }
    }
    departureDate.value = dateTime;
    departureDateController.text = dateFormat.format(dateTime);
  }

  void onChangeArrivalDate(DateTime dateTime){
    arrivalDate.value = dateTime;
    arrivalDateController.text = dateFormat.format(dateTime);
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