import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/request_trip/get_document_code_model.dart'
    as purpose;
import 'package:gais/data/model/reference/get_city_model.dart' as city;
import 'package:gais/data/model/reference/get_zona_model.dart' as zone;
import 'package:gais/screen/tms/request_trip/add/traveller/traveller_screen.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class PurposeOfTripController extends BaseController {
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  final formKey = GlobalKey<FormState>();
  final notesPurpose = TextEditingController();
  final fileName = TextEditingController();
  final departureDate = TextEditingController();
  final arrivalDate = TextEditingController();
  final zona = TextEditingController();
  final tlkDay = TextEditingController();
  final totalTLK = TextEditingController();

  String? selectedPurpose = "CB";
  int? idDocument = 1;
  DateTime? selectedDate;
  bool? isAttachment = false;
  String? fromCity;
  String? toCity;
  File? gettedFile;
  int? purposeID;

  purpose.GetDocumentCodeModel? purposeModel;
  List<purpose.Data> purposeList = [];
  city.GetCityModel? cityModel;
  List<city.Data> cityList = [];
  zone.GetZonaModel? zonaModel;
  List<city.Data> zonaList = [];

  getSingleFile() async {
    // Pick an file
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      gettedFile = File(result.files.single.path ?? "Not Attached");
      PlatformFile nameFile = result.files.first;
      fileName.text = nameFile.name;
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
    zona.text = "1";
    tlkDay.text;
    totalTLK.text;
    Future.wait([
      fetchList(),
    ]);
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

  Future<void> fetchList() async {
    cityList = [];
    purposeList = [];
    try {
      var dataCity = await repository.getCityList();
      cityModel = dataCity;
      cityList.addAll(dataCity.data?.toSet().toList() ?? []);

      var dataPurpose = await repository.getDocumentCodeList();
      purposeModel = dataPurpose;
      purposeList.addAll(dataPurpose.data?.toSet().toList() ?? []);

      update();
    } catch (e) {}
  }

  Future<void> getZonaCity() async {}

  Future<void> postPurposeOfTrip() async {
    try {
      await repository
          .savePurposeOfTrip(
        await Get.arguments['employeeID'] ?? "1",
        "1",
        selectedPurpose ?? "",
        Get.arguments['siteID'],
        notesPurpose.text,
        fromCity ?? "",
        toCity ?? "",
        departureDate.text,
        arrivalDate.text,
        "1",
        tlkDay.text,
        totalTLK.text,
        gettedFile ?? null,
      )
          .then(
        (value) {
          print(value.success);
          purposeID = value.data?.id?.toInt() ?? 0;
          print(purposeID);
        },
      ).then(
        (value) => Get.to(
          TravellerScreen(),
          arguments: {'purposeID': purposeID},
        ),
      );
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Data Tidak Lengkap',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
