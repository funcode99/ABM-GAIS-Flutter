import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_city_model.dart' as city;
import 'package:gais/data/model/reference/get_type_transportation_model.dart'
    as type;
import 'package:gais/data/model/request_trip/get_other_transport_model.dart'
    as ot;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditOtherTransportController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  String otID = Get.arguments['otID'];

  final formKey = GlobalKey<FormState>();
  final travellerName = TextEditingController();
  final fromDate = TextEditingController();
  final toDate = TextEditingController();
  final quantity = TextEditingController();
  final remarks = TextEditingController();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  int? otherTransportID;
  int? travellerID;
  DateTime? selectedDate;
  String? transportType;
  String? selectedCity;

  List<ot.Data> otList = [];
  ot.GetOtherTransportModel? otModel;
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

    Future.wait([fetchList(), fetchData()]);
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
      // var otherTransportData =
      //     await repository.getOtherTransportBytripList(purposeID);
      // otModel = otherTransportData;
      // otList.addAll(otherTransportData.data
      //         ?.where((e) => e.id == otID)
      //         .toSet()
      //         .toList() ??
      //     []);

      //travellerName.text
      // otherTransportID = otList.first.id?.toInt();
      // transportType = otList.first.idTypeTransportation.toString();
      // fromDate.text = otList.first.fromDate ?? "";
      // toDate.text = otList.first.toDate ?? "";
      // selectedCity = otList.first.idCity.toString();
      // quantity.text = otList.first.qty.toString() ?? "";
      // remarks.text = otList.first.remarks ?? "";

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

  Future<void> fetchData() async {
    await repository.getOtherTransportByid(otID).then((value) {
      print("other transport: $value");
      otherTransportID = value.data?.first.id?.toInt();
      transportType = value.data?.first.idTypeTransportation.toString();
      fromDate.text = value.data?.first.fromDate.toString() ?? "";
      toDate.text = value.data?.first.toDate.toString() ?? "";
      selectedCity = value.data?.first.idCity.toString();
      quantity.text = value.data?.first.qty.toString() ?? "";
      remarks.text = value.data?.first.remarks ?? "";
    });
    update();
  }

  Future<void> save() async {
    try {
      await repository
          .updateOtherTransportation(
              otID,
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
