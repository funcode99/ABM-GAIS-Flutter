import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_city_model.dart' as city;
import 'package:gais/data/model/reference/get_type_transportation_model.dart' as type;
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddOtherTransportController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];

  final formKey = GlobalKey<FormState>();
  final travellerName = TextEditingController();
  final fromDate = TextEditingController();
  final toDate = TextEditingController();
  final quantity = TextEditingController();
  final remarks = TextEditingController();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateTime lastDate = DateTime.now().add(const Duration(days: 30));

  int? travellerID;
  DateTime? selectedDate;
  String? transportType;
  String? selectedCity;

  GetRequestTripByidModel? rtModel;
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

      var dataType = await requestTrip.getTypeTransportation();
      typeModel = dataType;
      typeList.addAll(dataType.data?.toSet().toList() ?? []);

      var dataCity = await repository.getCityList();
      cityModel = dataCity;
      cityList.addAll(dataCity.data?.toSet().toList() ?? []);

      var rtData = await requestTrip.getRequestTripByid(purposeID);
      rtModel = rtData;
      lastDate = DateTime.parse(rtModel?.data?.first.dateArrival.toString() ?? "");
      if(lastDate.isBefore(DateTime.now())){
        lastDate = DateTime.now().add(Duration(days: 30));
      }
    } catch (e) {
      e.printError();
    }

    update();
  }

  Future<void> save() async {
    try {
      await requestTrip
          .saveOtherTransportation(
              purposeID.toString(), transportType.toString(), fromDate.text, toDate.text, selectedCity.toString(), quantity.text, remarks.text)
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
