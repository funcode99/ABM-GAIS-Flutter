import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gais/data/model/reference/get_city_model.dart' as city;
import 'package:gais/data/model/reference/get_type_transportation_model.dart'
    as type;

class AddOtherTransportController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];

  final formKey = GlobalKey<FormState>();
  final travellerName = TextEditingController();
  final fromDate = TextEditingController();
  final toDate = TextEditingController();
  final quantity = TextEditingController();
  final remarks = TextEditingController();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  int? travellerID;
  DateTime? selectedDate;
  String? transportType;
  String? selectedCity;

  type.GetTypeTransportationModel? typeModel;
  List<type.Data> typeList = [];
  city.GetCityModel? cityModel;
  List<city.Data> cityList = [];

  @override
  void onInit() {
    super.onInit();
    travellerName.text;
    fromDate.text;
    toDate.text;
    quantity.text;
    remarks.text;

    Future.wait([fetchList()]);
  }

  @override
  void dispose() {
    super.dispose();
    travellerName.dispose();
    fromDate.dispose();
    toDate.dispose();
    quantity.dispose();
    remarks.dispose();
  }

  Future<void> fetchList() async {
    try {
      await storage.readEmployeeInfo().then((value) {
        print(value.isNotEmpty);
        travellerID = int.parse(value.first.id.toString());
        travellerName.text = value.first.employeeName.toString();
      });

      var dataType = await repository.getTypeTransportation();
      typeModel = dataType;
      typeList.addAll(dataType.data?.toSet().toList() ?? []);

      var dataCity = await repository.getCityList();
      cityModel = dataCity;
      cityList.addAll(dataCity.data?.toSet().toList() ?? []);

      update();
    } catch (e) {
      e.printError();
    }
  }

  Future<void> save() async {
    try {
      await repository
          .saveOtherTransportation(
              purposeID.toString(),
              transportType.toString(),
              fromDate.text,
              toDate.text,
              selectedCity.toString(),
              quantity.text,
              remarks.text)
          .then((value) => Get.back());
    } catch (e) {
      e.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Failed To Save',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
