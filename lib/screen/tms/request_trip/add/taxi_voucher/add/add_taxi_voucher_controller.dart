import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_city_model.dart' as city;
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:gais/data/model/request_trip/get_taxi_voucher_model.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaxiVoucherController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat saveDateFormat = DateFormat("yyyy/MM/dd");
  DateTime lastDate = DateTime.now().add(const Duration(days: 30));

  final formKey = GlobalKey<FormState>();
  final traveller = TextEditingController();
  final date = TextEditingController();
  final amount = TextEditingController();
  final accountName = TextEditingController();
  final remarks = TextEditingController();

  int? travellerID;
  DateTime? selectedDate;
  String? departure;
  String? arrival;

  GetRequestTripByidModel? rtModel;
  GetTaxiVoucherModel? item;
  city.GetCityModel? cityModel;
  List<city.Data> cityList = [];

  @override
  void onInit() {
    super.onInit();
    traveller.text;
    date.text;
    amount.text;
    accountName.text;
    remarks.text;
    Future.wait([fetchList()]);
  }

  @override
  void dispose() {
    super.dispose();
    traveller.dispose();
    date.dispose();
    amount.dispose();
    accountName.dispose();
    remarks.dispose();
  }

  Future<void> fetchList() async {
    await storage.readEmployeeInfo().then((value) {
      print(value.isNotEmpty);
      travellerID = int.parse(value.first.id.toString());
      traveller.text = value.first.employeeName.toString();
      accountName.text = value.first.employeeName.toString();
    });

    cityList = [];
    var dataCity = await repository.getCityList();
    cityModel = dataCity;
    cityList.addAll(dataCity.data?.toSet().toList() ?? []);

    var rtData = await requestTrip.getRequestTripByid(purposeID);
    rtModel = rtData;
    lastDate = DateTime.parse(rtModel?.data?.first.dateArrival.toString() ?? "");
    if(lastDate.isBefore(DateTime.now())){
      lastDate = DateTime.now().add(Duration(days: 30));
    }
    if(lastDate.isBefore(DateTime.now())){
      lastDate = DateTime.now().add(Duration(days: 30));
    }

    update();
  }

  Future<void> save() async {
    try {
      await requestTrip
          .saveTaxiVoucher(
        purposeID.toString(),
        amount.text.digitOnly(),
        accountName.text,
        departure.toString(),
        arrival.toString(),
        remarks.text,
        saveDateFormat.format(selectedDate!).toString(),
        accountName.text,
      )
          .then(
        (value) {
          print(value.success);
          print(purposeID);
          // Get.off(TravellerScreen(), arguments: {'purposeID': purposeID});
          Get.back(result: value.success);
        },
      );
    } catch (e) {
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
