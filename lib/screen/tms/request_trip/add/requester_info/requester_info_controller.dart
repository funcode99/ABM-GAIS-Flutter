import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/employee_info_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';

class RequesterInfoController extends BaseController with MasterDataMixin {
  final formKey = GlobalKey<FormState>();
  final requester = TextEditingController();
  final sn = TextEditingController();
  final location = TextEditingController();
  final phone = TextEditingController();

  String? requestorName;
  String? requestorGender;
  int? requestorID;
  int? requestorJobBandID;
  int? requestorFlightID;
  String? requestorSN;
  String? requestorHotel;
  String? requestorFlight;
  int? siteID;

  int? requestID;

  bool isLoading = false;

  bool enableSelectRequestor = false;
  List<EmployeeModel> employeeList = [];
  EmployeeModel? selectedEmployee;

  @override
  void onInit() {
    super.onInit();
    requester.text;
    sn.text;
    location.text;
    phone.text;
    Future.wait([
      getRequesterInfo(),
    ]);

    requestTripVariable.requestTripRequestorID = null;
    requestTripVariable.requestTripRequestorName = null;
    requestTripVariable.requestTripRequestorSiteID = null;
  }

  @override
  void dispose() {
    super.dispose();
    requester.dispose();
    sn.dispose();
    location.dispose();
    phone.dispose();
  }

  Future<void> getRequesterInfo() async {
    String codeRole = await storage.readString(StorageCore.codeRole);
    String isCrewing = await storage.readString(StorageCore.isCrewing) ?? "";

    if (codeRole == RoleEnum.secretary.value || (codeRole == RoleEnum.superAdmin.value && isCrewing == "1")) {
      enableSelectRequestor = true;
      fetchList();
    } else {
      await storage.readEmployeeFlight().then((value) {
        requestorFlight = value.first.flightClass.toString();
        requestorFlightID = value.first.idFlightClass;
      });

      await storage.readEmployeeInfo().then((value) {
        print(value.isNotEmpty);
        requester.text = value.first.employeeName.toString();
        phone.text = value.first.phoneNumber.toString();
        sn.text = value.first.snEmployee.toString();
        location.text = value.first.siteName.toString();

        siteID = int.parse(value.first.idSite.toString());
        requestorID = int.parse(value.first.id.toString());
        requestorName = value.first.employeeName.toString();
        requestorGender = value.first.jenkel.toString();
        requestorJobBandID = int.parse(value.first.idJobBand.toString());
        requestorSN = value.first.snEmployee;
        requestorHotel = value.first.hotelFare;

        selectedEmployee = EmployeeModel(
            id: requestorID,
            employeeName: requestorName,
            idCompany: value.first.idCompany,
            companyName: value.first.companyName,
            companyCode: value.first.companyCode,
            idSite: value.first.idSite,
            siteName: value.first.siteName,
            siteCode: value.first.siteCode,
            email: value.first.email,
            phoneNumber: value.first.phoneNumber,
            hotelFare: value.first.hotelFare,
            idDepartment: value.first.idDepartment,
            departementName: value.first.departementName,
            flightClass: [
              {
                'id_flight_class': requestorFlightID,
                'flight_class': requestorFlight,
              }
            ]);
      });

      update();
    }

    update();
  }

  Future<void> fetchList() async {
    isLoading = true;
    employeeList = [];

    try {
      await getOtherEmployee().then((value) {
        employeeList.addAll(value ?? []);
        onChangeRequestor(employeeList.first.id);
      });
    } catch (e) {
      e.printError();
    }

    isLoading = false;
    update();
  }

  void onChangeRequestor(dynamic id) {
    if (employeeList.isNotEmpty) {
      final selected = employeeList.firstWhere((item) => item.id.toString() == id.toString(), orElse: () => employeeList.first);

      selectedEmployee = selected;

      sn.text = selectedEmployee?.snEmployee ?? "";
      location.text = selectedEmployee?.siteName ?? "";
      phone.text = selectedEmployee?.phoneNumber ?? "";

      siteID = selectedEmployee?.idSite;
      requestorID = selectedEmployee?.id;
      requestorName = selectedEmployee?.employeeName;
      requestorGender = selectedEmployee?.jenkel;
      requestorJobBandID = int.parse(selectedEmployee?.idJobBand.toString() ?? "0");
      requestorSN = selectedEmployee?.snEmployee;
      requestorHotel = selectedEmployee?.hotelFare;

      List<Map<String, dynamic>> tempList = List<Map<String, dynamic>>.from(selectedEmployee?.flightClass);
      if (tempList.isNotEmpty) {
        Map<String, dynamic> flightClass = tempList.first;
        requestorFlightID = flightClass["id_flight_class"] ?? 0;
        requestorFlight = flightClass["flight_class"] ?? "";
      }
    }

    update();
  }

  void onClickNext() {
    requestTripVariable.requestTripRequestorID = requestorID;
    requestTripVariable.requestTripRequestorName = requestorName;
    requestTripVariable.requestTripRequestorSiteID = siteID;
    requestTripVariable.requestTripRequestorGender = requestorGender;
    requestTripVariable.requestTripRequestorHotelFare = requestorHotel;
    requestTripVariable.requestTripRequestorSN = requestorSN;
    requestTripVariable.requestTripRequestorJobBandID = requestorJobBandID;
    requestTripVariable.requestTripRequestorFlight = requestorFlight;
    requestTripVariable.requestTripRequestorFlightID = requestorFlightID;

    // print("requestTripVariable.requestTripRequestorID ${requestTripVariable.requestTripRequestorID}");
    // print("requestTripVariable.requestTripRequestorName ${requestTripVariable.requestTripRequestorName}");
    // print("requestTripVariable.requestTripRequestorSiteID ${requestTripVariable.requestTripRequestorSiteID}");
    // print("requestTripVariable.requestTripRequestorGender ${requestTripVariable.requestTripRequestorGender}");
    // print("requestTripVariable.requestTripRequestorHotel ${requestTripVariable.requestTripRequestorHotelFare}");
    // print("requestTripVariable.requestTripRequestorSN ${requestTripVariable.requestTripRequestorSN}");
    // print("requestTripVariable.requestTripRequestorJobBandID ${requestTripVariable.requestTripRequestorJobBandID}");
    // print("requestTripVariable.requestTripRequestorFlightID ${requestTripVariable.requestTripRequestorFlightID}");
    // print("requestTripVariable.requestTripRequestorFlight ${requestTripVariable.requestTripRequestorFlight}");
  }
}
