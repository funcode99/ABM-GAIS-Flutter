import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/approval_request_trip/approval_info_model.dart' as ai;
import 'package:gais/data/model/reference/get_document_code_model.dart' as doc;
import 'package:gais/data/model/reference/get_site_model.dart' as st;
import 'package:gais/data/model/request_trip/get_accommodation_model.dart' as acc;
import 'package:gais/data/model/request_trip/get_airliness_model.dart' as airliness;
import 'package:gais/data/model/request_trip/get_train_trip_bytripid_model.dart' as train;
import 'package:gais/data/model/request_trip/get_airliness_bytrip_model.dart';
import 'package:gais/data/model/request_trip/get_cash_advance_travel_model.dart' as ca;
import 'package:gais/data/model/request_trip/get_guest_bytrip_model.dart' as guest;
import 'package:gais/data/model/request_trip/get_other_transport_model.dart' as ot;
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:gais/data/model/request_trip/get_taxi_voucher_model.dart' as tv;
import 'package:gais/reusable/pdf_screen.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/add/add_accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/add/add_airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/add/add_cash_advance_travel_screen.dart';
import 'package:gais/screen/tms/request_trip/add/other_transport/add/add_other_transport_screen.dart';
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/add/add_taxi_voucher_screen.dart';
import 'package:gais/screen/tms/request_trip/add/train/add/add_train_screen.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/add/add_guest_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/actualization_trip/actualization_trip_screen.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class FormRequestTripController extends BaseController {
  String purposeID = Get.arguments['id'];
  int? codeDocument = Get.arguments['codeDocument'];
  int? requsetorID;
  int? siteID;
  int? jobID;
  String? role;
  String? actualID;

  final formKey = GlobalKey<FormState>();
  final createdDate = TextEditingController();
  final requestor = TextEditingController();
  final purpose = TextEditingController();
  final site = TextEditingController();
  final attachment = TextEditingController();
  final notes = TextEditingController();
  final daNumber = TextEditingController();
  final tlkRequestor = TextEditingController();
  final tlkJobBand = TextEditingController();
  final tlkZona = TextEditingController();
  final tlkTotal = TextEditingController();
  final tlkTotalMeals = TextEditingController();

  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  String? tabName;
  bool isDetail = true;
  bool isTLK = false;
  bool showTLK = false;
  bool isApproval = false;
  bool isEdit = false;
  bool isAttachment = false;
  bool isDAnumber = false;
  String? selectedPurpose;
  String fileURL = "";
  String pdfPath = "";
  String? fileFormat;

  int activeStep = 1;
  String? rtStatus;
  String? rtNumber;
  File? gettedFile;
  String? fromCity;
  String? toCity;
  String? departureDate;
  String? arrivalDate;
  String? zonaID;
  String? tlkDay;
  String? tlk;

  String? travellerName;
  String? travellerSN;
  String? travellerGender;
  String? travellerHotel;
  String? travellerFlight;
  String? idEmployee;

  List items = [
    {
      "title": "Traveller Guest",
      "isFilled": true,
      "screen": const AddGuestScreen(),
      "showList": true,
    },
    {
      "title": "Airliness",
      "isFilled": false,
      "screen": const AddAirlinessScreen(),
      "showList": false,
    },
    {
      "title": "Train",
      "isFilled": false,
      "screen": const AddTrainScreen(),
      "showList": false,
    },
    /*{
      "title": "Taxi Voucher",
      "isFilled": false,
      "screen": const AddTaxiVoucherScreen(),
      "showList": false,
    },
    {
      "title": "Other Transportation",
      "isFilled": false,
      "screen": const AddOtherTransportScreen(),
      "showList": false,
    },*/
    {
      "title": "Accommodation",
      "isFilled": false,
      "screen": const AddAccommodationScreen(),
      "showList": false,
    },
    {
      "title": "Cash Advance",
      "isFilled": false,
      "screen": const AddCashAdvanceTravelScreen(),
      "showList": false,
    },
  ];

  List<guest.Data> guestList = [];
  List<airliness.Data> airlinessList = [];
  GetAirlinessBytripModel? airlinessModel;
  List<train.Data> trainList = [];
  train.GetTrainTripBytripidModel? trainModel;
  List<tv.Data> tvList = [];
  List<ot.Data> otList = [];
  List<acc.Data> accommodationsList = [];
  List<ca.Data> caList = [];
  List<doc.Data> purposeList = [];
  List<st.Data> siteList = [];
  List<ai.Data> approvalInfoList = [];

  GetRequestTripByidModel? rtModel;

  @override
  void onInit() {
    super.onInit();
    createdDate.text;
    requestor.text;
    purpose.text;
    tlkRequestor.text;
    tlkJobBand.text;
    tlkZona.text;
    tlkTotal.text;
    tlkTotalMeals.text;
    isEdit = false;
    Future.wait([
      fetchRequestTrip(),
      fetchList(),
      fetchApprovalInfo(),
      checkRole(),
      fetchAirliness(),
    ]);
    purposeID.printInfo(info: "purposeID");
  }

  @override
  void dispose() {
    super.dispose();
    createdDate.dispose();
    requestor.dispose();
    purpose.dispose();
    tlkRequestor.dispose();
    tlkJobBand.dispose();
    tlkZona.dispose();
    tlkTotal.dispose();
    tlkTotalMeals.dispose();
  }

  Future<void> checkRole() async {
    role = await storage.readRole();
    print("role : $role");
    if (role == "3" || role == "2" || role == "1") {
      showTLK = true;
    }
    update();
  }

  checkItems() {
    if (selectedPurpose == "4") {
      for (var item in items) {
        item['isFilled'] = item['title'] == "Taxi Voucher"
            ? true
            : item['title'] == "Traveller Guest"
                ? true
                : item['title'] == "Other Transportation"
                    ? true
                    : false;

        item['showList'] = item['title'] == "Taxi Voucher"
            ? true
            : item['title'] == "Traveller Guest"
                ? true
                : item['title'] == "Other Transportation"
                    ? true
                    : false;
      }
    } else if (selectedPurpose == "2") {
      for (var item in items) {
        item['isFilled'] = item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Airliness"
                ? true
                : item['title'] == "Accommodation"
                    ? true
                    : false;

        item['showList'] = item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Airliness"
                ? true
                : item['title'] == "Accommodation"
                    ? true
                    : false;
      }
    } else if (selectedPurpose == "2") {
      for (var item in items) {
        item['isFilled'] = item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Airliness"
                ? true
                : item['title'] == "Other Transportation"
                    ? true
                    : false;

        item['showList'] = item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Airliness"
                ? true
                : item['title'] == "Other Transportation"
                    ? true
                    : false;
      }
    } else if (selectedPurpose == "5") {
      for (var item in items) {
        item['isFilled'] = item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Airliness"
                ? true
                : item['title'] == "Other Transportation"
                    ? true
                    : false;

        item['showList'] = item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Airliness"
                ? true
                : item['title'] == "Other Transportation"
                    ? true
                    : false;
      }
    } else {
      items.where((e) => e['isFilled'] == false).forEach((item) {
        item['isFilled'] = true;
        item['showList'] = true;
      });
    }
    update();
  }

  addDetails(int index) {
    index == 1 || index == 4 || index == 5
        ? Get.off(
            items[index]['screen'],
            arguments: {
              'purposeID': purposeID,
              'codeDocument': codeDocument,
              'formEdit': true,
              'isEdit': false,
            },
          )
        : selectedPurpose == "5" && index == 0
            ? Get.showSnackbar(const GetSnackBar(
                icon: Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                message: "unable to add guests",
                isDismissible: true,
                duration: Duration(seconds: 3),
                backgroundColor: Colors.red,
              ))
            : Get.to(
                items[index]['screen'],
                arguments: {
                  'purposeID': purposeID,
                  'codeDocument': codeDocument,
                  'formEdit': true,
                  'isEdit': false,
                },
              )?.then((value) {
                fetchList();
                update();
              });
  }

  getSingleFile() async {
    // Pick an file
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      gettedFile = File(result.files.single.path ?? "Not Attached");
      PlatformFile nameFile = result.files.first;
      attachment.text = nameFile.name;
      update();
    } else {
      // User canceled the picker
    }
  }

  viewFile() async {
    Get.to(PDFScreen(
      path: pdfPath,
      fileURL: fileURL,
    ));
    // print("go to preview file");
  }

  Future<File> getFileFromUrl({name}) async {
    Completer<File> completer = Completer();
    // print("Start download file from internet!");
    try {
      final url = fileURL;
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      // print("Download files");
      // print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");
      // fileFormat = file.
      await file.writeAsBytes(bytes, flush: true);
      update();
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Future<void> fetchRequestTrip() async {
    var rtData = await requestTrip.getRequestTripByid(purposeID);
    DateTime? tempDate;
    rtModel = rtData;
    rtStatus = rtModel?.data?.first.status ?? "";
    rtNumber = rtModel?.data?.first.noRequestTrip ?? "";
    tempDate = DateTime.parse(rtModel?.data?.first.createdAt ?? "");
    createdDate.text = dateFormat.format(tempDate);
    requestor.text = rtModel?.data?.first.employeeName ?? "";
    purpose.text = rtModel?.data?.first.documentName ?? "";
    // codeDocument = int.parse(rtModel?.data?.first.idDocument ?? "");
    siteID = rtModel?.data?.first.idSite?.toInt();
    site.text = rtModel?.data?.first.siteName ?? "";
    notes.text = rtModel?.data?.first.notes ?? "";
    daNumber.text = rtModel?.data?.first.numberDa ?? "";
    selectedPurpose = rtModel?.data?.first.idDocument.toString() ?? "";
    isAttachment = selectedPurpose == "1" || selectedPurpose == "2" || selectedPurpose == "3" || selectedPurpose == "5" ? true : false;
    isDAnumber = selectedPurpose == "3" ? true : false;
    print("attachment : ${rtModel?.data?.first.file}");
    if (isAttachment == true) {
      attachment.text = (rtModel?.data?.first.file.toString() != "{}" ? rtModel?.data?.first.file : "no attachment") ?? 'no attachment';
      fileURL = rtModel?.data?.first.file.toString() ?? "";
      print("file URL : $fileURL");
      if (fileURL != "{}") {
        getFileFromUrl().then((f) {
          pdfPath = f.path;
          gettedFile = f;
          update();
        });
      }
      update();
    }
    selectedPurpose = codeDocument.toString();
    // print("selected purpose : $selectedPurpose");
    // print("file : $fileURL");
    // print("pdfPath : $pdfPath");
    tlkRequestor.text = rtModel?.data?.first.employeeName ?? "";
    // tlkJobBand.text = rtModel?.data?.first.
    tlkZona.text = rtModel?.data?.first.zonaName ?? "";
    tlkTotal.text = rtModel?.data?.first.totalTlk ?? "";
    // tlkTotalMeals.text = rtModel?.data?.first. ?? "";
    fromCity = rtModel?.data?.first.idCityFrom.toString();
    toCity = rtModel?.data?.first.idCityTo.toString();
    departureDate = rtModel?.data?.first.dateDeparture;
    arrivalDate = rtModel?.data?.first.dateArrival;
    zonaID = rtModel?.data?.first.idZona.toString();
    tlkDay = rtModel?.data?.first.tlkPerDay.toString();
    tlk = rtModel?.data?.first.totalTlk;

    checkItems();

    await storage.readEmployeeInfo().then((value) {
      travellerName = value.first.employeeName;
      travellerSN = value.first.snEmployee;
      travellerGender = value.first.jenkel;
      travellerHotel = value.first.hotelFare;
      // travellerFlight = value.first.flightClass;
      tlkJobBand.text = value.first.bandJobName.toString();
      idEmployee = value.first.id.toString();
      print("id_employee: $idEmployee");
    });

    await storage.readEmployeeFlight().then((value) => travellerFlight = value.first.idFlightClass.toString());

    await storage.readEmployeeInfo().then((value) {
      tlkJobBand.text = value.first.bandJobName != "null" ? value.first.bandJobName.toString() : "";
      requsetorID = value.first.id?.toInt();
      jobID = value.first.idJobBand?.toInt();
    });

    update();
  }

  Future<void> fetchList() async {
    guestList = [];
    airlinessList = [];
    trainList = [];
    tvList = [];
    otList = [];
    accommodationsList = [];
    caList = [];
    purposeList = [];
    approvalInfoList = [];
    try {
      var docData = await repository.getDocumentCodeList();
      purposeList.addAll(docData.data?.toSet().toList() ?? []);

      var stData = await repository.getSiteList();
      siteList.addAll(stData.data?.toSet().toList() ?? []);

      var guestData = await requestTrip.getGuestBytripList(purposeID);
      guestList.addAll(guestData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      var airlinessData = await requestTrip.getAirlinessBytripList(purposeID);
      airlinessModel = airlinessData;
      // airlinessList.addAll(airlinessData.data?.toSet().toList() ?? []);
      airlinessData.data?.asMap().forEach((i, e) async {
        if (e.pnrid != null) {
          print("pnrID: ${e.pnrid}");
          await antavaya.getRsvTicket(e.pnrid!).then((rsv) {
            var reservation = jsonDecode(rsv);
            print("rsv: ${reservation.toString()}");
            print("rsv: ${reservation['Passengers'][0]['Type'].toString()}");

            airlinessList.add(airliness.Data(
              id: e.id,
              idRequestTrip: e.idRequestTrip,
              pnrid: e.pnrid,
              employeeName: e.travelerName,
              createdAt: e.createdAt,
              origin: e.origin,
              destination: e.destination,
              departureTime: reservation['FlightDetails'][0]['DepartTime'],
              arrivalTime: reservation['FlightDetails'][0]['ArriveTime'],
              flightNo: reservation['FlightDetails'][0]['FlightNumber'],
              ticketPrice: e.ticketPrice,
              departureDate: e.departDate,
              arrivalDate: e.returnDate,
              flightClass: e.flightClass,
            ));
            update();
          });
        } else {
          airlinessList.add(airliness.Data(
            id: e.id,
            idRequestTrip: e.idRequestTrip,
            pnrid: e.pnrid,
            employeeName: e.travelerName,
            createdAt: e.createdAt,
            origin: e.origin,
            destination: e.destination,
            departureTime: '-',
            arrivalTime: '-',
            flightNo: '-',
            ticketPrice: e.ticketPrice,
            departureDate: e.departDate,
            arrivalDate: e.returnDate,
            flightClass: e.flightClass,
          ));
          update();
        }
      });

      var trainData = await requestTrip.getTrainTripByTrip(purposeID);
      trainModel = trainData;
      trainList.addAll(trainData.data?.toSet().toList() ?? []);

      var tvData = await requestTrip.getTaxiVoucherBytripList(purposeID);
      tvList.addAll(tvData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      var otData = await requestTrip.getOtherTransportBytripList(purposeID);
      otList.addAll(otData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      var accData = await requestTrip.getAccommodationBytripList(purposeID);
      accommodationsList.addAll(accData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      // var caData = await repository.getCashAdvanceTravelList(purposeID);
      // caList.addAll(caData.data?.toSet().toList() ?? []);
    } catch (e, i) {
      e.printError();
      i.printError();
    }

    update();
  }

  Future fetchAirliness() async {}

  Future<void> fetchApprovalInfo() async {
    try {
      var approvalInfoData = await approvalRequestTrip.approval_info(purposeID);
      approvalInfoList.addAll(approvalInfoData.data?.toSet().toList() ?? []);
    } catch (e) {
      e.printError();
    }
  }

  Future<void> deleteGuest(String id) async {
    try {
      await requestTrip.deleteTravellerGuest(id).then((value) {
        fetchList();
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: 'Data Deleted',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: successColor,
          ),
        );
      });
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Delete Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: errorColor,
        ),
      );
    }
  }

  Future<void> deleteAirliness(String id) async {
    try {
      await requestTrip.deleteAirliness(id).then((value) {
        fetchList();
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: 'Data Deleted',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: successColor,
          ),
        );
      });
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Delete Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: errorColor,
        ),
      );
    }
  }

  Future<void> deleteTrain(String id) async {
    try {
      await requestTrip.deleteTrainTrip(id).then((value) {
        fetchList();
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: 'Data Deleted',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: successColor,
          ),
        );
      });
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Delete Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: errorColor,
        ),
      );
    }
  }

  Future<void> deleteTaxiVoucher(String id) async {
    try {
      await requestTrip.deleteTaxiVoucher(id).then((value) {
        fetchList();
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: 'Data Deleted',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: successColor,
          ),
        );
      });
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Delete Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: errorColor,
        ),
      );
    }
  }

  Future<void> deleteOtherTransport(String id) async {
    try {
      await requestTrip.deleteOtherTransportation(id).then((value) {
        fetchList();
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: 'Data Deleted',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: successColor,
          ),
        );
      });
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Delete Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: errorColor,
        ),
      );
    }
  }

  Future<void> deleteAccommodation(String id) async {
    try {
      await requestTrip.deleteAccommodation(id).then((value) {
        fetchList();
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: 'Data Deleted',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: successColor,
          ),
        );
      });
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Delete Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: errorColor,
        ),
      );
    }
  }

  Future<void> deleteCashAdvance(String id) async {
    try {
      await requestTrip.deleteCashAdvanceTravel(id).then((value) {
        fetchList();
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: 'Data Deleted',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: successColor,
          ),
        );
      });
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Delete Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: errorColor,
        ),
      );
    }
  }

  Future<void> submitRequestTrip() async {
    try {
      await requestTrip.submitRequestTrip(purposeID).then((value) {
        fetchRequestTrip();
        fetchList();
        Get.showSnackbar(GetSnackBar(
          icon: const Icon(
            Icons.info,
            color: Colors.white,
          ),
          message: "${value.message}",
          isDismissible: true,
          duration: const Duration(seconds: 3),
          backgroundColor: value.success == false ? redColor : greenColor,
        ));
      });
    } catch (e, i) {
      i.printError();
      Get.showSnackbar(const GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Submit Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
    update();
  }

  Future<void> updateRequestTrip() async {
    // print("getted file: $gettedFile");
    try {
      await requestTrip
          .updateRequestTrip(
        purposeID,
        requsetorID.toString(),
        rtNumber.toString(),
        selectedPurpose != null ? selectedPurpose.toString() : codeDocument.toString(),
        siteID.toString(),
        notes.text,
        fromCity.toString(),
        toCity.toString(),
        departureDate.toString(),
        arrivalDate.toString(),
        zonaID.toString(),
        tlkDay.toString(),
        tlk.toString(),
        daNumber.text,
        gettedFile,
      )
          .then((value) {
        print(value);
        fetchList();
        fetchRequestTrip();
        isEdit = false;
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: 'Data Updated',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: successColor,
          ),
        );
      });
    } catch (e, i) {
      e.printError();
      i.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Update Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: errorColor,
        ),
      );
    }
  }

  Future<void> checkActual() async {
    try {
      await actualizationTrip.getActualBytripID(purposeID).then((value) async {
        print("actual : ${value.data?.isNotEmpty}");
        if (value.data!.isEmpty) {
          await actualizationTrip
              .saveActualizationTrip(
                purposeID,
                departureDate.toString(),
                arrivalDate.toString(),
                fromCity.toString(),
                toCity.toString(),
                zonaID.toString(),
                tlkDay.toString(),
                "-",
                "",
                "-",
                tlkTotal.text.digitOnly(),
                "-",
                idEmployee.toString(),
              )
              .then((saveAct) => Get.to(const ActualizationTripScreen(), arguments: {
                    "idRequestTrip": purposeID,
                    "idActual": saveAct.data?.id,
                    "idZona": zonaID,
                    "tlkRate": tlkDay,
                  }));
        } else {
          Get.to(const ActualizationTripScreen(), arguments: {
            "idRequestTrip": purposeID,
            "idActual": value.data?.first.id,
            "idZona": zonaID,
            "tlkRate": tlkDay,
          });
        }
      });
    } catch (e, i) {
      e.printError();
      i.printError();
    }
  }
}
