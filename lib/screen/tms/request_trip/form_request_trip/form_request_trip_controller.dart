import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/request_trip/get_guest_bytrip_model.dart' as guest;
import 'package:gais/data/model/request_trip/get_airliness_model.dart' as airliness;
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:gais/data/model/request_trip/get_taxi_voucher_model.dart' as tv;
import 'package:gais/data/model/request_trip/get_other_transport_model.dart' as ot;
import 'package:gais/data/model/request_trip/get_accommodation_model.dart' as acc;
import 'package:gais/data/model/request_trip/get_cash_advance_travel_model.dart' as ca;
import 'package:gais/data/model/reference/get_document_code_model.dart' as doc;
import 'package:gais/screen/tms/request_trip/add/accommodation/accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/cash_advance_screen.dart';
import 'package:gais/screen/tms/request_trip/add/other_transport/other_transport_screen.dart';
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/taxi_voucher_screen.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/traveller_screen.dart';
import 'package:get/get.dart';

class FormRequestTripController extends BaseController {
  int purposeID = Get.arguments['id'];

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

  String? tabName;
  bool isDetail = true;
  bool isTLK = false;
  bool isApproval = false;
  bool isEdit = true;
  bool isAttachment = false;
  String selectedPurpose = "";
  int? codeDocument;
  int activeStep = 1;
  String? rtStatus;
  String? rtNumber;

  List requestTrip = ["Traveller Guest", "Airliness", "Taxi Voucher", "Other Transportation", "Accommodation", "Cash Advance"];

  List<bool> showList = [true, true, true, true, true, true];

  List addScreen = [
    const TravellerScreen(),
    const AirlinessScreen(),
    const TaxiVoucherScreen(),
    const OtherTransportScreen(),
    const AccommodationScreen(),
    const CashAdvanceScreen(),
  ];

  List<guest.Data> guestList = [];
  List<airliness.Data> airlinessList = [];
  List<tv.Data> tvList = [];
  List<ot.Data> otList = [];
  List<acc.Data> accommodationsList = [];
  List<ca.Data> caList = [];
  List<doc.Data> purposeList = [];

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
    Future.wait([fetchRequestTrip(), fetchList()]);
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

  Future<void> fetchRequestTrip() async {
    var rtData = await repository.getRequestTripByid(purposeID);
    rtModel = rtData;
    rtStatus = rtModel?.data?.first.status ?? "";
    rtNumber = rtModel?.data?.first.noRequestTrip ?? "";
    createdDate.text = rtModel?.data?.first.createdAt?.substring(0, 10) ?? "";
    requestor.text = rtModel?.data?.first.employeeName ?? "";
    purpose.text = rtModel?.data?.first.documentName ?? "";
    // codeDocument = int.parse(rtModel?.data?.first.codeDocument ?? "");
    site.text = rtModel?.data?.first.siteName ?? "";
    selectedPurpose = rtModel?.data?.first.codeDocument ?? "CB";
    tlkRequestor.text = rtModel?.data?.first.employeeName ?? "";
    // tlkJobBand.text = rtModel?.data?.first.
    tlkZona.text = rtModel?.data?.first.zonaName ?? "";
    tlkTotal.text = rtModel?.data?.first.tlkPerDay ?? "";
    tlkTotalMeals.text = rtModel?.data?.first.totalTlk ?? "";

    var docData = await repository.getDocumentCodeList();
    purposeList.addAll(docData.data?.toSet().toList() ?? []);
  }

  Future<void> fetchList() async {
    guestList = [];
    airlinessList = [];
    tvList = [];
    otList = [];
    accommodationsList = [];
    caList = [];
    purposeList = [];
    try {
      var guestData = await repository.getGuestBytripList(purposeID);
      guestList.addAll(guestData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      var airlinessData = await repository.getAirlinessBytripList();
      airlinessList.addAll(airlinessData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      var tvData = await repository.getTaxiVoucherBytripList(purposeID);
      tvList.addAll(tvData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      var otData = await repository.getOtherTransportBytripList(purposeID);
      otList.addAll(otData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      var accData = await repository.getAccommodationBytripList(purposeID);
      accommodationsList.addAll(accData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      // var caData = await repository.getCashAdvanceTravelList();
      // caList.addAll(caData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    update();
  }

  Future<void> deleteGuest(int id) async {
    try {
      await repository.deleteTravellerGuest(id).then((value) {
        fetchList();
        Get.showSnackbar(
          GetSnackBar(
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
        GetSnackBar(
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

  Future<void> deleteAirliness(int id) async {
    try {
      await repository.deleteAirliness(id).then((value) {
        fetchList();
        Get.showSnackbar(
          GetSnackBar(
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
        GetSnackBar(
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

  Future<void> deleteTaxiVoucher(int id) async {
    try {
      await repository.deleteTaxiVoucher(id).then((value) {
        fetchList();
        Get.showSnackbar(
          GetSnackBar(
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
        GetSnackBar(
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

  Future<void> deleteOtherTransport(int id) async {
    try {
      await repository.deleteOtherTransportation(id).then((value) {
        fetchList();
        Get.showSnackbar(
          GetSnackBar(
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
        GetSnackBar(
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

  Future<void> deleteAccommodation(int id) async {
    try {
      await repository.deleteAccommodation(id).then((value) {
        fetchList();
        Get.showSnackbar(
          GetSnackBar(
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
        GetSnackBar(
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
}
