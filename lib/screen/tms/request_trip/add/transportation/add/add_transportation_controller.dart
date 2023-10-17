import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_city_model.dart' as city;
import 'package:gais/data/model/reference/get_type_transportation_model.dart' as type;
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTransportationController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  String? tvID = Get.arguments['tvID'];
  String? otID = Get.arguments['otID'];
  String? transportID = Get.arguments['id'];
  bool? isEdit = Get.arguments['isEdit'];
  bool? formEdit = Get.arguments['formEdit'];

  final formKey = GlobalKey<FormState>();
  final travellerName = TextEditingController();
  final fromDate = TextEditingController();
  final toDate = TextEditingController();
  final quantity = TextEditingController();
  final remarks = TextEditingController();
  final date = TextEditingController();
  final amount = TextEditingController();
  final accountName = TextEditingController();
  final companyID = TextEditingController();
  final siteID = TextEditingController();

  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  DateFormat saveFormat = DateFormat("yyyy-MM-dd");
  DateTime lastDate = DateTime.now().add(const Duration(days: 30));

  int? travellerID;
  DateTime? dateFrom;
  DateTime? dateTo;
  String? transportType;
  String? selectedCity;
  String? departure;
  String? arrival;
  bool isLoading = false;
  bool loadLocation = false;

  GetRequestTripByidModel? rtModel;
  type.GetTypeTransportationModel? typeModel;
  List<type.Data> typeList = [];
  city.GetCityModel? cityModel;
  List<city.Data> cityList = [];
  List<comp.Data> companyList = [];
  List<site.Data> siteList = [];

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
    isLoading = true;
    cityList = [];
    typeList = [];
    companyList = [];
    siteList = [];
    try {
      await storage.readEmployeeInfo().then((value) {
        print(value.isNotEmpty);
        travellerID = int.parse(value.first.id.toString());
        travellerName.text = value.first.employeeName.toString();
      });
      // travellerID = requestTripVariable.requestTripRequestorID;
      // travellerName.text = requestTripVariable.requestTripRequestorName.toString();

      var dataType = await requestTrip.getTypeTransportation();
      typeModel = dataType;
      typeList.addAll(dataType.data?.toSet().toList() ?? []);

      var dataCity = await repository.getCityList();
      cityModel = dataCity;
      cityList.addAll(dataCity.data?.toSet().toList() ?? []);

      var rtData = await requestTrip.getRequestTripByid(purposeID);
      rtModel = rtData;
      lastDate = DateTime.parse(rtModel?.data?.first.dateArrival.toString() ?? "");

      await repository.getCompanyList().then((value) {
        companyList.addAll(value.data?.toSet().toList() ?? []);
      });

      await repository.getSiteList().then((value) {
        siteList.addAll(value.data?.toSet().toList() ?? []);
      });
    } catch (e) {
      e.printError();
    }
    isLoading = false;
    update();
    if (isEdit == true) {
      fetchData();
    }
  }

  Future<void> fetchSiteList(String id) async {
    loadLocation = true;
    siteList = [];
    update();
    try {
      await repository.getSiteListByCompanyID(id).then((value) {
        siteList.addAll(value.data?.toSet().toList() ?? []);
      });
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    loadLocation = false;
    update();
  }

  void save() {
    if (isEdit == true) {
      updateData();
    } else {
      saveData();
    }
  }

  Future<void> fetchData() async {
    try {
      await requestTrip.getTransportationByID(transportID!).then((value) {
        travellerName.text = value.data?.first.employeeName ?? '';
        transportType = value.data?.first.idTypeTransportation.toString();
        dateFrom = DateTime.parse(value.data!.first.fromDate.toString());
        fromDate.text = dateFormat.format(dateFrom!);
        dateTo = DateTime.parse(value.data!.first.toDate.toString());
        toDate.text = dateFormat.format(dateTo!);
        departure = value.data?.first.idDepartureCity.toString();
        arrival = value.data?.first.idArrivalCity.toString();
        selectedCity = value.data?.first.idCity.toString();
        quantity.text = value.data?.first.qty.toString() ?? '';
        amount.text = value.data?.first.amount?.toInt().toCurrency().toString() ?? '';
        accountName.text = value.data?.first.accountName.toString() ?? '';
        remarks.text = value.data?.first.remarks ?? '';
        companyID.text = value.data?.first.idCompany.toString() ?? '';
        siteID.text = value.data?.first.idSite.toString() ?? '';
      });
      // if (tvID != null) {
      //   await requestTrip.getTaxiVoucherByid(tvID!).then((value) {
      //     travellerName.text = value.data?.first.employeeName.toString() ?? '';
      //     transportType = '4';
      //     dateFrom = DateTime.parse(value.data!.first.date.toString());
      //     fromDate.text = dateFormat.format(dateFrom!);
      //     departure = value.data?.first.idDepartureCity.toString();
      //     arrival = value.data?.first.idArrivalCity.toString();
      //     accountName.text = value.data?.first.accountName.toString() ?? '';
      //     remarks.text = value.data?.first.remarks.toString() ?? '';
      //   });
      // } else {
      //   await requestTrip.getOtherTransportByid(otID!).then((value) {
      //     travellerName.text = value.data?.first.employeeName.toString() ?? '';
      //     transportType = value.data?.first.idTypeTransportation.toString();
      //     dateFrom = DateTime.parse(value.data!.first.fromDate.toString());
      //     fromDate.text = dateFormat.format(dateFrom!);
      //     dateTo = DateTime.parse(value.data!.first.toDate.toString());
      //     toDate.text = dateFormat.format(dateTo!);
      //     selectedCity = value.data?.first.idCity.toString();
      //     quantity.text = value.data?.first.qty.toString() ?? '';
      //     remarks.text = value.data?.first.remarks.toString() ?? '';
      //   });
      // }
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    update();
  }

  Future<void> saveData() async {
    try {
      await requestTrip
          .saveTransportation(
            purposeID,
            amount.text.digitOnly(),
            accountName.text,
            remarks.text,
            departure ?? selectedCity ?? '0',
            arrival ?? selectedCity ?? '0',
            transportType.toString(),
            saveFormat.format(dateFrom ?? DateTime.now()),
            saveFormat.format(dateTo ?? DateTime.now()),
            selectedCity ?? '0',
            quantity.text,
            companyID.text,
            siteID.text,
          )
          .then((value) => Get.back());
      // if (transportType == '4') {
      //   await requestTrip
      //       .saveTaxiVoucher(
      //         purposeID,
      //         amount.text,
      //         accountName.text,
      //         departure!,
      //         arrival!,
      //         remarks.text,
      //         saveFormat.format(dateFrom!),
      //         accountName.text,
      //       )
      //       .then((value) => Get.back());
      // } else {
      //   await requestTrip
      //       .saveOtherTransportation(
      //         purposeID.toString(),
      //         transportType.toString(),
      //         fromDate.text,
      //         toDate.text,
      //         selectedCity.toString(),
      //         quantity.text,
      //         remarks.text,
      //       )
      //       .then((value) => Get.back());
      // }
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

  Future<void> updateData() async {
    try {
      await requestTrip
          .updateTransportation(
            transportID!,
            purposeID,
            amount.text.digitOnly(),
            accountName.text,
            remarks.text,
            departure ?? selectedCity ?? '0',
            arrival ?? selectedCity ?? '0',
            transportType.toString(),
            saveFormat.format(dateFrom ?? DateTime.now()),
            saveFormat.format(dateTo ?? DateTime.now()),
            selectedCity ?? '0',
            quantity.text,
            companyID.text,
            siteID.text,
          )
          .then((value) => Get.back());
      // if (transportType == '4' && tvID != null) {
      //   await requestTrip
      //       .updateTaxiVoucher(
      //         tvID!,
      //         purposeID,
      //         amount.text,
      //         accountName.text,
      //         departure!,
      //         arrival!,
      //         remarks.text,
      //         saveFormat.format(dateFrom!),
      //         accountName.text,
      //       )
      //       .then((value) => Get.back());
      // } else if (otID != null) {
      //   await requestTrip
      //       .updateOtherTransportation(
      //         otID!,
      //         purposeID.toString(),
      //         transportType.toString(),
      //         fromDate.text,
      //         toDate.text,
      //         selectedCity.toString(),
      //         quantity.text,
      //         remarks.text,
      //       )
      //       .then((value) => Get.back());
      // } else {
      //   if (tvID != null) {
      //     await requestTrip.deleteTaxiVoucher(tvID!);
      //   } else if (otID != null) {
      //     await requestTrip.deleteOtherTransportation(otID!);
      //   }
      //   saveData();
      // }
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

  Future<void> deleteTV() async {}

  Future<void> deletOT() async {}
}
