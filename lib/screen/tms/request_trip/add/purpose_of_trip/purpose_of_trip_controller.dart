import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_document_code_model.dart'
    as purpose;
import 'package:gais/data/model/reference/get_city_model.dart' as city;
import 'package:gais/screen/tms/request_trip/add/traveller/traveller_screen.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class PurposeOfTripController extends BaseController {
  int? requsetorID;
  int? siteID;

  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  DateFormat saveDateFormat = DateFormat("yyyy/MM/dd");

  final formKey = GlobalKey<FormState>();
  final notesPurpose = TextEditingController();
  final fileName = TextEditingController();
  final departureDate = TextEditingController();
  final arrivalDate = TextEditingController();
  final zona = TextEditingController();
  final tlkDay = TextEditingController();
  final totalTLK = TextEditingController();

  String? selectedPurpose = "3";
  int? idDocument = 1;
  DateTime? selectedDate;
  bool? isAttachment = false;
  String? selectedDepartureDate;
  String? selectedArrivalDate;
  String? fromCity;
  String? toCity;
  File? gettedFile;
  int? purposeID;
  String? zonaID;
  bool? isFilled = false;

  purpose.GetDocumentCodeModel? purposeModel;
  List<purpose.Data> purposeList = [];
  city.GetCityModel? cityModel;
  List<city.Data> cityList = [];

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
    zona.text;
    tlkDay.text;
    totalTLK.text;
    Future.wait([
      fetchList(),
    ]);
    requsetorID.printInfo(info: "requestorID");
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

    await storage.readEmployeeInfo().then((value) {
      requsetorID = value.first.id?.toInt();
      siteID = value.first.idSite?.toInt();
    });

    var dataCity = await repository.getCityList();
    cityModel = dataCity;
    cityList.addAll(dataCity.data?.toSet().toList() ?? []);

    var dataPurpose = await repository.getDocumentCodeList();
    purposeModel = dataPurpose;
    purposeList.addAll(dataPurpose.data?.toSet().toList() ?? []);

    update();
  }

  Future<void> getZonaCity() async {
    var datazona = await repository.getZonaByIDCity(int.parse(toCity!));
    zona.text = datazona.data?.first.zonaName ?? "";
    zonaID = datazona.data?.first.idZona.toString() ?? "";
    print("Zona : ${ datazona.data?.first.idZona}");
    update();
  }

  Future<void> postPurposeOfTrip() async {
    if (isFilled == false) {
      try {
        await repository
            .saveRequestTrip(
          requsetorID.toString(),
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
          int.parse(tlkDay.text),
          totalTLK.text,
          gettedFile,
        )
            .then(
          (value) {
            purposeID = int.parse(value.data!.id.toString());
            isFilled = value.success;
            print("requsetorID: $requsetorID");
            print("purposeID : $purposeID");
            print("isFilled : $isFilled");
          },
        ).then(
          (value) => Get.to(
            const TravellerScreen(),
            arguments: {
              'purposeID': purposeID,
              'codeDocument': int.parse(selectedPurpose.toString())
            },
          )?.then((result) {
            isFilled = result;
            update();
            print("purpose is filled : $result");
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
    } else {
      Get.to(
        const TravellerScreen(),
        arguments: {
          'purposeID': purposeID,
          'codeDocument': int.parse(selectedPurpose.toString())
        },
      )?.then((result) {
        isFilled = result;
        update();
        print("purpose is filled : $result");
      });
    }

    print("purposeID:$purposeID");
    print("purpose : ${selectedPurpose}");
  }
}
