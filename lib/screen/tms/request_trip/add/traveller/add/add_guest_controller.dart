import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_flight_class_model.dart' as flight;
import 'package:gais/data/model/reference/get_traveller_type_model.dart' as type;
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class AddGuestController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  String? guestID = Get.arguments['guestID'];
  bool? formEdit = Get.arguments['formEdit'];

  final formKey = GlobalKey<FormState>();
  final guestName = TextEditingController();
  final guestNIK = TextEditingController();
  final guestContact = TextEditingController();
  final notes = TextEditingController();
  final guestCompany = TextEditingController();
  final guestDepartment = TextEditingController();
  final hotelFare = TextEditingController();
  final flightEntitlement = TextEditingController();

  String? selectedType;
  String? selectedGuest;
  String? gender;
  String? selectedDepartment;
  String? selectedCompany;
  int? jobBandID;
  int? idFlight;
  int? travellerID;
  bool isLoading = false;
  List<type.Data> typeList = [];
  List<flight.Data> flightList = [];
  type.GetTravellerTypeModel? typeModel;

  @override
  void onInit() {
    super.onInit();
    guestName.text;
    guestNIK.text;
    guestContact.text;
    notes.text;
    guestCompany.text;
    hotelFare.text;
    flightEntitlement.text;
    guestCompany.text;
    guestDepartment.text;
    print("selected type : ${selectedType}");

    fetchList();
    if (guestID != null) {
      fetchData();
    }
  }

  @override
  void dispose() {
    super.dispose();
    guestName.dispose();
    guestNIK.dispose();
    guestContact.dispose();
    notes.dispose();
    guestCompany.dispose();
    hotelFare.dispose();
    flightEntitlement.dispose();
    guestCompany.dispose();
    guestDepartment.dispose();
  }

  Future<void> fetchData() async {
    try {
      await requestTrip.getGuestByID(guestID!).then((value) {
        selectedType = value.data?.first.idTypeTraveller.toString();
        print("selected type : ${selectedType}");
        guestName.text = value.data?.first.nameGuest.toString() ?? "";
        guestNIK.text = value.data?.first.nik.toString() ?? "";
        guestContact.text = value.data?.first.contactNo.toString() ?? "";
        guestCompany.text = value.data?.first.company.toString() ?? "";
        hotelFare.text = int.parse(value.data?.first.hotelFare ?? "0").toCurrency();
        guestDepartment.text = value.data?.first.departement ?? "";
        idFlight = value.data?.first.idFlightClass?.toInt();
        notes.text = value.data?.first.notes ?? "";
        travellerID = value.data?.first.idTypeTraveller?.toInt();
        gender = value.data?.first.gender.toString();
      });
      update();
    } catch (e, i) {
      e.printError();
      i.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Guest Empty',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> fetchList() async {
    typeList = [];
    flightList = [];
    isLoading = true;
    try {
      await repository.getTravellerTypeList().then((value) {
        typeModel = value;
        typeList.addAll(value.data?.toSet().toList() ?? []);
      });

      await repository.getFlightClassList().then((value) => flightList.addAll(value.data?.toSet().toList() ?? []));

      /*storage.readEmployeeInfo().then((value) {
        jobBandID = int.parse(value.first.idJobBand.toString());
        // flightEntitlement.text = value.first.flightClass.toString();
        travellerID = int.tryParse(value.first.id.toString());
        hotelFare.text = int.parse(value.first.hotelFare ?? "").toCurrency();
        // idFlight = int.parse(value.first.idJobBand.toString());
      });

      storage.readEmployeeFlight().then((value) {
        flightEntitlement.text = value.first.flightClass.toString();
        idFlight = value.first.idFlightClass;
      });*/

      travellerID = requestTripVariable.requestTripRequestorID;
      jobBandID = requestTripVariable.requestTripRequestorJobBandID;
      idFlight = requestTripVariable.requestTripRequestorFlightID;
      flightEntitlement.text = requestTripVariable.requestTripRequestorFlight.toString();
      hotelFare.text = requestTripVariable.requestTripRequestorHotelFare.toString();

    } catch (e, i) {
      e.printError();
      i.printError();
    }
    isLoading = false;
    update();
  }

  Future<void> saveGuest() async {
    try {
      await requestTrip
          .saveTravellerGuest(
        guestName.text,
        purposeID.toString(),
        guestCompany.text,
        guestCompany.text,
        selectedType.toString(),
        guestNIK.text,
        guestContact.text,
        guestDepartment.text,
        hotelFare.text.digitOnly(),
        idFlight.toString(),
        notes.text,
        gender.toString(),
      )
          .then(
        (value) {
          purposeID = value.data?.id.toString() ?? "";
          // Get.off(TravellerScreen(), arguments: {'purposeID': purposeID});
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
          message: 'Failed to save',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> updateGuest() async {
    try {
      await requestTrip
          .updateTravellerGuest(
        guestID!,
        guestName.text,
        purposeID,
        int.parse(selectedCompany ?? "1"),
        guestCompany.text,
        selectedType ?? "1",
        guestNIK.text,
        guestContact.text,
        guestDepartment.text,
        hotelFare.text.digitOnly(),
        idFlight ?? 1,
        notes.text,
        gender.toString(),
      )
          .then(
        (value) {
          Get.back();
        },
      );
    } catch (e, s) {
      e.printError();
      s.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Update Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
