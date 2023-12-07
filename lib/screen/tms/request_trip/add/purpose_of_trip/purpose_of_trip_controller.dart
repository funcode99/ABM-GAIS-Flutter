import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/employee_info_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/reference/get_city_model.dart' as city;
import 'package:gais/data/model/reference/get_coset_center_model.dart' as cc;
import 'package:gais/data/model/reference/get_document_code_model.dart' as purpose;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:gais/data/storage_core.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/traveller_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PurposeOfTripController extends BaseController {
  EmployeeModel? requestorData = Get.arguments['requestorData'];
  int? requestorID;
  int? siteID;
  String? jobID;

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat saveDateFormat = DateFormat("yyyy/MM/dd");

  final formKey = GlobalKey<FormState>();
  final notesPurpose = TextEditingController();
  final fileName = TextEditingController();
  final departureDate = TextEditingController();
  final arrivalDate = TextEditingController();
  final zona = TextEditingController();
  final tlkDay = TextEditingController();
  final totalTLK = TextEditingController();
  final nomorDA = TextEditingController();

  String? selectedPurpose = "3";
  String? selectedPurposeName;
  String? selectedCostCenter;
  int? idDocument = 1;
  DateTime departure = DateTime.now();
  DateTime arrival = DateTime.now();
  int rangeDate = 0;
  String? selectedDepartureDate;
  String? selectedArrivalDate;
  String? fromCity;
  String? toCity;
  File? gettedFile;
  String? purposeID;
  String? zonaID;
  String? fileExtension;
  String? costCenterID;

  bool? isFilled = false;
  bool? isEnabledButton = false;
  bool isAttachment = false;
  bool attachFile = true;
  bool isLoading = false;
  bool isDANumber = false;
  bool isCKB = false;

  purpose.GetDocumentCodeModel? purposeModel;
  List<purpose.Data> purposeList = [];
  site.GetSiteModel? siteModel;
  List<site.Data> siteList = [];
  city.GetCityModel? cityModel;
  List<city.Data> cityList = [];
  List<cc.Data> costCenterList = [];
  List requestorFlight = [];

  getSingleFile() async {
    // Pick an file
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      gettedFile = File(result.files.single.path ?? "Not Attached");
      PlatformFile nameFile = result.files.first;
      fileName.text = nameFile.name;
      fileExtension = result.files.first.extension;
      update();
    } else {
      // User canceled the picker
    }
  }

  @override
  void onInit() {
    super.onInit();
    notesPurpose.text;
    fileName.text;
    departureDate.text;
    zona.text;
    tlkDay.text;
    totalTLK.text;
    Future.wait([
      fetchList(),
    ]);

    initData();
  }

  @override
  void dispose() {
    super.dispose();
    notesPurpose.dispose();
    fileName.dispose();
    departureDate.dispose();
    zona.dispose();
    tlkDay.dispose();
    totalTLK.dispose();
  }

  void initData()async{
    if(requestTripVariable.requestTripRequestorGroupCompanyCode?.toUpperCase() == "CKB"){
      isCKB = true;
      update();
    }

  }

  Future<void> fetchList() async {
    cityList = [];
    purposeList = [];
    costCenterList = [];
    isLoading = true;
    requestorFlight = requestorData?.flightClass;
    print(requestorFlight.first['id_flight_class']);
    // print(requestorFlight.first.idFlightClass);
    print("requestor name : ${requestorData?.employeeName}");
    print("jenkel : ${requestorData?.jenkel}");

    try {
      requestorID = requestTripVariable.requestTripRequestorID;
      siteID = requestTripVariable.requestTripRequestorSiteID;
      requestorID.printInfo(info: "requestorID");
      await storage.readEmployeeInfo().then((value) {
        // requsetorID = value.first.id?.toInt();
        // siteID = value.first.idSite?.toInt();
        jobID = value.first.idJobBand.toString();
      });

      var dataCity = await repository.getCityList();
      cityModel = dataCity;
      // cityList.add(city.Data(id: 0, cityName: "City"));
      cityList.addAll(dataCity.data?.toSet().toList() ?? []);
      // fromCity = "0";
      // toCity = "0";

      var dataPurpose = await repository.getDocumentCodeList();
      purposeModel = dataPurpose;
      // purposeList.add(purpose.Data(id: 0, documentName: "Purpose of Trip"));
      purposeList.addAll(dataPurpose.data?.toSet().toList() ?? []);
      // selectedPurpose = "0";

      var dataSite = await repository.getSiteList();
      siteModel = dataSite;
      siteList.addAll(dataSite.data?.toSet().toList() ?? []);

      // await repository.getTLKJobByIDJob(jobID!).then((value) {
      //   tlkDay.text = int.parse(value.data?.first.tlkRate ?? "0").toCurrency();
      // });
      await repository.getCostCenterList().then((value) => costCenterList.addAll(value.data?.toSet().toList() ?? []));
      costCenterID = await storage.readString(StorageCore.costCenterID);

      await storage.readString(StorageCore.tlkRate).then((value) => tlkDay.text = int.parse(value).toCurrency().toString());
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    isLoading = false;
    update();
  }

  Future<void> getZonaCity() async {
    var datazona = await repository.getZonaByIDCity(toCity!);
    zona.text = datazona.data?.first.zonaName ?? "";
    zonaID = datazona.data?.first.idZona.toString() ?? "";
    // print("Zona : ${datazona.data?.first.idZona}");
    update();
  }

  Future<void> saveGuest(String purposeID) async {
    try {
      await requestTrip
          .saveTravellerGuest(
            requestorData?.employeeName ?? '',
            purposeID,
            requestorData?.idCompany.toString() ?? '',
            requestorData?.companyName ?? '',
            '0',
            requestorData?.nik ?? '',
            requestorData?.phoneNumber ?? '',
            requestorData?.departementName ?? '',
            requestorData?.hotelFare ?? '',
            requestorFlight.first['id_flight_class'].toString(),
            '',
            requestorData?.jenkel ?? '',
            '0',
          )
          .then((value) => print("saveGuest : $value"));
    } catch (e, i) {
      e.printError();
      i.printError();
      // Get.showSnackbar(
      //   const GetSnackBar(
      //     icon: Icon(
      //       Icons.error,
      //       color: Colors.white,
      //     ),
      //     message: 'Failed to save guest',
      //     isDismissible: true,
      //     duration: Duration(seconds: 3),
      //     backgroundColor: Colors.red,
      //   ),
      // );
    }
  }

  Future<void> postPurposeOfTrip() async {
    if (isFilled == false) {
      try {
        await requestTrip
            .saveRequestTrip(
          requestorID.toString(),
          "1",
          selectedPurpose ?? "0",
          siteID.toString(),
          notesPurpose.text,
          fromCity ?? "",
          toCity ?? "",
          selectedDepartureDate ?? "",
          selectedArrivalDate ?? "",
          zonaID ?? "1",
          // "7",
          int.parse(tlkDay.text.digitOnly()),
          totalTLK.text.digitOnly(),
          gettedFile,
          nomorDA.text,
          selectedCostCenter ?? costCenterID.toString(),
        )
            .then(
          (value) {
            purposeID = value.data?.id.toString();
            isFilled = value.success;
            saveGuest(purposeID!).then((guest) {
              if (value.success == false) {
                Get.showSnackbar(
                  GetSnackBar(
                    icon: const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                    message: value.message,
                    isDismissible: true,
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                Get.to(
                  const TravellerScreen(),
                  arguments: {'purposeID': purposeID, 'codeDocument': int.parse(selectedPurpose.toString())},
                )?.then((result) {
                  isFilled = result;
                  update();
                  // print("purpose is filled : $result");
                });
              }
            });
            // print("requsetorID: $requestorID");
            // print("purposeID : $purposeID");
            // print("isFilled : $isFilled");
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
    } else {
      updateData();
    }
    // print("purposeID:$purposeID");
    // print("purpose : ${selectedPurpose}");
  }

  Future<void> updateData() async {
    try {
      await requestTrip
          .updateRequestTrip(
        purposeID!,
        requestorID.toString(),
        "1",
        selectedPurpose ?? "0",
        siteID.toString(),
        notesPurpose.text,
        fromCity ?? "",
        toCity ?? "",
        selectedDepartureDate ?? "",
        selectedArrivalDate ?? "",
        zonaID ?? "1",
        // "7",
        tlkDay.text.digitOnly(),
        totalTLK.text.digitOnly(),
        nomorDA.text,
        gettedFile,
      )
          .then(
        (value) {
          purposeID = value.data!.id.toString();
          isFilled = value.success;
          // print("requsetorID: $requestorID");
          // print("purposeID : ${value.data!.id.toString()}");
          // print("isFilled : $isFilled");
        },
      ).then(
        (value) => Get.to(
          const TravellerScreen(),
          arguments: {'purposeID': purposeID, 'codeDocument': int.parse(selectedPurpose.toString())},
        )?.then((result) {
          isFilled = result;
          update();
          // print("purpose is filled : $result");
        }),
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
