import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_city_model.dart' as city;
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:gais/data/model/request_trip/get_taxi_voucher_model.dart' as tv;
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditTaxiVoucherController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  String tvID = Get.arguments['id'];
  bool? formEdit = Get.arguments['formEdit'];

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
  String? taxiVoucherID;

  GetRequestTripByidModel? rtModel;
  tv.GetTaxiVoucherModel? tvModel;
  List<tv.Data> tvList = [];
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
    Future.wait([fetchList(), fetchData()]);
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

    update();
  }

  Future<void> fetchData() async {
    await requestTrip.getTaxiVoucherByid(tvID).then((value) {
      print("other transport: $value");
      taxiVoucherID = value.data?.first.id;
      date.text = value.data?.first.date ?? "";
      departure = value.data?.first.idDepartureCity.toString();
      arrival = value.data?.first.idArrivalCity.toString();
      amount.text = int.parse(value.data?.first.amount ?? "").toCurrency();
      accountName.text = value.data?.first.accountName ?? "";
      remarks.text = value.data?.first.remarks ?? "";
    });
    update();
  }

  Future<void> save() async {
    try {
      await requestTrip
          .updateTaxiVoucher(
        taxiVoucherID!,
        purposeID.toString(),
        amount.text.digitOnly(),
        accountName.text,
        departure.toString(),
        arrival.toString(),
        remarks.text,
        selectedDate != null ? saveDateFormat.format(selectedDate!).toString() : date.text,
        accountName.text,
      )
          .then(
        (value) {
          print(value.success);
          print(purposeID);
          Get.back(result: value.success);
        },
      );
    } catch (e, i) {
      e.printError();
      i.printError();
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
