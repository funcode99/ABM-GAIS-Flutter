import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/antavaya/get_reservation_ticket_model.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/approval_request_trip/get_approval_request_trip_byid_model.dart';
import 'package:gais/data/model/approval_request_trip/get_approval_request_trip_model.dart' as rt;
import 'package:gais/data/model/reference/get_document_code_model.dart' as doc;
import 'package:gais/data/model/reference/get_site_model.dart' as st;
import 'package:gais/data/model/request_trip/get_accommodation_model.dart' as acc;
import 'package:gais/data/model/request_trip/get_airliness_bytrip_model.dart';
import 'package:gais/data/model/request_trip/get_airliness_model.dart' as airliness;
import 'package:gais/data/model/request_trip/get_cash_advance_travel_model.dart' as ca;
import 'package:gais/data/model/request_trip/get_guest_bytrip_model.dart' as guest;
import 'package:gais/data/model/request_trip/get_other_transport_model.dart' as ot;
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:gais/data/model/request_trip/get_taxi_voucher_model.dart' as tv;
import 'package:gais/data/model/request_trip/get_train_trip_bytripid_model.dart' as train;
import 'package:gais/data/model/request_trip/get_transportation_model.dart' as transport;
import 'package:gais/data/model/approval_request_trip/approval_info_model.dart' as ai;
import 'package:gais/reusable/dialog/approval_confirmation_dialog.dart';
import 'package:gais/reusable/dialog/fail_dialog.dart';
import 'package:gais/reusable/dialog/reject_dialog.dart';
import 'package:gais/reusable/dialog/success_dialog.dart';
import 'package:gais/reusable/pdf_screen.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/add/add_accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/add/add_airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/add/add_cash_advance_travel_screen.dart';
import 'package:gais/screen/tms/request_trip/add/other_transport/add/add_other_transport_screen.dart';
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/add/add_taxi_voucher_screen.dart';
import 'package:gais/screen/tms/request_trip/add/train/add/add_train_screen.dart';
import 'package:gais/screen/tms/request_trip/add/transportation/add/add_transportation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/add/add_guest_screen.dart';
import 'package:gais/util/enum/approval_action_enum.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class ApprovalFormRequestTripController extends BaseController {
  ApprovalActionEnum? approvalActionEnum = Get.arguments['approvalEnum'];
  String? purposeID;
  String approvalID = Get.arguments['id'];
  int? requsetorID;
  int? siteID;
  int? jobID;

  final approvalModel = Rxn<ApprovalModel>();

  final formKey = GlobalKey<FormState>();
  final createdDate = TextEditingController();
  final requestor = TextEditingController();
  final purpose = TextEditingController();
  final site = TextEditingController();
  final attachment = TextEditingController();
  final notes = TextEditingController();
  final tlkRequestor = TextEditingController();
  final tlkJobBand = TextEditingController();
  final tlkZona = TextEditingController();
  final tlkTotal = TextEditingController();
  final tlkTotalMeals = TextEditingController();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  String? tabName;
  bool isDetail = true;
  bool isTLK = false;
  bool isApproval = false;
  bool isEdit = false;
  bool isAttachment = false;
  String selectedPurpose = "";
  int? codeDocument;
  int activeStep = 1;
  String? rtStatus;
  String? rtNumber;
  String? fromCity;
  String? toCity;
  String? departureDate;
  String? arrivalDate;
  String? zonaID;
  String fileURL = "";
  String pdfPath = "";

  String? tlkDay;
  String? tlk;
  String? travellerName;
  String? travellerSN;
  String? travellerGender;
  String? travellerHotel;
  String? travellerFlight;

  List items = [
    {
      "title": "Traveller Guest",
      "isFilled": true,
      "screen": const AddGuestScreen(),
      "showList": true,
    },
    {
      "title": "Airlines",
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
    {
      "title": "Transportation",
      "isFilled": false,
      "screen": const AddTransportationScreen(),
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
  List<tv.Data> tvList = [];
  List<ot.Data> otList = [];
  List<acc.Data> accommodationsList = [];
  List<ca.Data> caList = [];
  List<doc.Data> purposeList = [];
  List<st.Data> siteList = [];
  List<transport.Data> transportList = [];
  train.GetTrainTripBytripidModel? trainModel;
  List<train.Data> trainList = [];
  List<ai.Data> approvalInfoList = [];


  GetRequestTripByidModel? rtModel;
  GetApprovalRequestTripByidModel? getApprovalModel;

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
    Future.wait([fetchRequestTrip()]);
    approvalID.printInfo(info: "approvalID");
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

  checkItems() {
    if (selectedPurpose == "4") {
      for (var item in items) {
        item['isFilled'] = item['title'] == "Taxi Voucher"
            ? true
            : item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Other Transportation"
            ? true
            : item['title'] == "Transportation"
            ? true
            : false;

        item['showList'] = item['title'] == "Taxi Voucher"
            ? true
            : item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Other Transportation"
            ? true
            : item['title'] == "Transportation"
            ? true
            : false;
      }
    } else if (selectedPurpose == "2") {
      for (var item in items) {
        item['isFilled'] = item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Airlines"
            ? true
            : item['title'] == "Accommodation"
            ? true
            : false;

        item['showList'] = item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Airlines"
            ? true
            : item['title'] == "Accommodation"
            ? true
            : false;
      }
    } else if (selectedPurpose == "2") {
      for (var item in items) {
        item['isFilled'] = item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Airlines"
            ? true
            : item['title'] == "Other Transportation"
            ? true
            : item['title'] == "Transportation"
            ? true
            : false;

        item['showList'] = item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Airlines"
            ? true
            : item['title'] == "Other Transportation"
            ? true
            : item['title'] == "Transportation"
            ? true
            : false;
      }
    } else if (selectedPurpose == "5") {
      for (var item in items) {
        item['isFilled'] = item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Airlines"
            ? true
            : item['title'] == "Other Transportation"
            ? true
            : item['title'] == "Transportation"
            ? true
            : false;

        item['showList'] = item['title'] == "Traveller Guest"
            ? true
            : item['title'] == "Airlines"
            ? true
            : item['title'] == "Other Transportation"
            ? true
            : item['title'] == "Transportation"
            ? true
            : false;
      }
    } else {
      items.where((e) => e['isFilled'] == false).forEach((item) {
        item['isFilled'] = true;
        item['showList'] = true;
      });
    }
    print("selected purpose: $selectedPurpose");
    update();
  }

  Future<File> getFileFromUrl({name}) async {
    Completer<File> completer = Completer();
    debugPrint("Start download file from internet!");
    try {
      final url = fileURL;
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      debugPrint("Download files : ${dir.path}/$filename");
      File file = File("${dir.path}/$filename");
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
      update();
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Future<void> fetchApprovalInfo() async {
    try {
      var approvalInfoData = await approvalRequestTrip.approval_info(purposeID!);
      approvalInfoList.addAll(approvalInfoData.data?.toSet().toList() ?? []);
    } catch (e) {
      e.printError();
    }
  }

  Future<void> fetchRequestTrip() async {
    approvalRequestTrip.getByID(approvalID).then((rtApproval)async{
      getApprovalModel = rtApproval;

      if (approvalActionEnum == ApprovalActionEnum.approve) {
        openApproveDialog();
      } else if (approvalActionEnum == ApprovalActionEnum.reject) {
        openRejectDialog();
      }

      purposeID = getApprovalModel?.data?.first.idRequestTrip.toString() ?? "";

      fetchApprovalInfo();
      fetchList();

      var rtData = await requestTrip.getRequestTripByid(purposeID!);

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
      attachment.text = rtModel?.data?.first.file.toString() ?? "";
      selectedPurpose = rtModel?.data?.first.idDocument.toString() ?? "";
      isAttachment = selectedPurpose == "1" || selectedPurpose == "2" ? true : false;
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

    });

    checkItems();

    await storage.readEmployeeInfo().then((value) {
      tlkJobBand.text = value.first.bandJobName != "null" ? value.first.bandJobName.toString() : "";
      // requsetorID = value.first.id?.toInt();
      jobID = value.first.idJobBand?.toInt();
      travellerName = value.first.employeeName;
      travellerSN = value.first.snEmployee;
      travellerGender = value.first.jenkel;
      travellerHotel = value.first.hotelFare;
      // travellerFlight = value.first.flightClass;
    });

    await storage.readEmployeeFlight().then((value) => travellerFlight = value.first.idFlightClass.toString());

    update();
  }

  viewFile() async {
    Get.to(PDFScreen(
      path: pdfPath,
      fileURL: fileURL,
    ));
  }

  Future<void> fetchList() async {
    guestList = [];
    airlinessList = [];
    trainList = [];
    transportList = [];
    tvList = [];
    otList = [];
    accommodationsList = [];
    caList = [];
    purposeList = [];
    // approvalInfoList = [];
    try {
      var docData = await repository.getDocumentCodeList();
      purposeList.addAll(docData.data?.toSet().toList() ?? []);

      var stData = await repository.getSiteList();
      siteList.addAll(stData.data?.toSet().toList() ?? []);

      var guestData = await requestTrip.getGuestBytripList(purposeID!);
      guestList.addAll(guestData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      var airlinessData = await requestTrip.getAirlinessBytripList(purposeID!);
      airlinessModel = airlinessData;
      // airlinessList.addAll(airlinessData.data?.toSet().toList() ?? []);
      airlinessData.data?.asMap().forEach((i, e) async {
        if (e.pnrid != null) {
          print("pnrID: ${e.pnrid}");
          print(e.ticketPrice);
          await antavaya.getRsvTicket(e.pnrid!).then((rsv) {
            GetReservationTicketModel.fromJson(rsv).data?.passengers?.first.type.printInfo();
            var reservation = GetReservationTicketModel.fromJson(rsv).data;
            // print("rsv: ${reservation.toString()}");
            // print("rsv: ${reservation['Passengers'][0]['Type'].toString()}");
            //
            airlinessList.add(airliness.Data(
              id: e.id,
              idRequestTrip: e.idRequestTrip,
              pnrid: e.pnrid,
              employeeName: e.travelerName,
              createdAt: e.createdAt,
              origin: e.origin,
              destination: e.destination,
              // departureTime: reservation['FlightDetails'][0]['DepartTime'],
              // arrivalTime: reservation['FlightDetails'][0]['ArriveTime'],
              // flightNo: reservation['FlightDetails'][0]['FlightNumber'],
              departureTime: reservation?.flightDetails?.first.departDate,
              arrivalTime: reservation?.flightDetails?.first.arriveTime,
              flightNo: reservation?.flightDetails?.first.flightNumber,
              ticketPrice: reservation?.payments?.last.amount.toString(),
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

      var trainData = await requestTrip.getTrainTripByTrip(purposeID!);
      trainModel = trainData;
      trainList.addAll(trainData.data?.toSet().toList() ?? []);

      var tvData = await requestTrip.getTaxiVoucherBytripList(purposeID!);
      tvList.addAll(tvData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      var otData = await requestTrip.getOtherTransportBytripList(purposeID!);
      otList.addAll(otData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      var caData = await requestTrip.getCashAdvanceTravelList(purposeID!);
      caList.addAll(caData.data?.toSet().toList() ?? []);

      var transportData = await requestTrip.getTransportationBytrip(purposeID!);
      transportList.addAll(transportData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      var accData = await requestTrip.getAccommodationBytripList(purposeID!);
      accommodationsList.addAll(accData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);
    } catch (e, i) {
      e.printError();
      i.printError();
    }

    update();
  }

  openApproveDialog() async {
    // print("approval model: ${approvalAuthID} $requsetorID $siteID $companyID");
    ApprovalModel? result = await Get.dialog(ApprovalConfirmationDialog(
      // idEmployee: requsetorID,
      // idSite: siteID,
      idCompany: getApprovalModel?.data?.first.idCompany?.toInt(),
      idApprovalAuth: getApprovalModel?.data?.first.idApprovalAuth?.toInt(),
    ));

    if (result != null) {
      approvalModel(result);
      // print('result : ${result.approvedBehalf}');
      // print('approveID: $approvalID');
      try {
        isLoadingHitApi(true);
        await approvalRequestTrip.approve(approvalID, result).then((value) {
          isLoadingHitApi(false);
          // Get.back(result: true);
          Get.dialog(SuccessDialog(
            message: "The request was successfully approved!",
            onClosePressed: () {
              Get.back(result: true);
            },
          ));
          fetchRequestTrip();
        });
      } catch (e, i) {
        isLoadingHitApi(false);
        e.printError();
        i.printError();
        Get.dialog(FailDialog(
          message: "Request failed to be approved!",
          onClosePressed: () {
            Get.back(result: true);
          },
        ));
      }
    }
    update();
  }

  openRejectDialog() async {
    ApprovalModel? result = await Get.dialog(const RejectDialog());

    if (result != null) {
      approvalModel(result);
      // print('result : ${result.notes}');
      try {
        isLoadingHitApi(true);
        await approvalRequestTrip.reject(approvalID, result).then((value) {
          isLoadingHitApi(false);
          Get.dialog(SuccessDialog(
            message: "The request was successfully rejected!",
            onClosePressed: () {
              Get.back(result: true);
            },
          ));
          fetchRequestTrip();
        });
      } catch (e, i) {
        isLoadingHitApi(false);
        e.printError();
        i.printError();
        Get.dialog(SuccessDialog(
          message: "Request failed to be rejected!",
          onClosePressed: () {
            Get.back(result: true);
          },
        ));
      }
    }
    update();
  }
}
