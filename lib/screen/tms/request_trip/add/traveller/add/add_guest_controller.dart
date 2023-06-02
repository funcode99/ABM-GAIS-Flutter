import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_traveller_type_model.dart' as type;
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class AddGuestController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  int? guestID = Get.arguments['guestID'];
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
  List<type.Data> typeList = [];
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
      await repository.getGuestByID(guestID!).then((value) {
        selectedType = value.data?.first.idTypeTraveller.toString();
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
    try {
      await repository.getTravellerTypeList().then((value) {
        typeModel = value;
        typeList.addAll(value.data?.toSet().toList() ?? []);
      });

      storage.readEmployeeInfo().then((value) {
        jobBandID = int.parse(value.first.idJobBand.toString());
        flightEntitlement.text = value.first.flightClass;
        travellerID = int.tryParse(value.first.id.toString());
      });

      var dataHotel = await repository.getJobBandList();
      hotelFare.text = int.parse(dataHotel.data?.data?.where((e) => e.id == jobBandID).first.hotelFare ?? " ").toCurrency();
      idFlight = dataHotel.data?.data?.where((e) => e.id == jobBandID).first.idFlightClass?.toInt() ?? 0;

      update();
    } catch (e) {
      e.printError();
    }
    print("purposeID : $purposeID");
  }

  Future<void> saveGuest() async {
    try {
      await repository
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
          print(value.success);
          purposeID = value.data?.id?.toInt() ?? 0;
          print(purposeID);
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
      await repository
          .updateTravellerGuest(
        guestID!,
        guestName.text,
        purposeID,
        int.parse(selectedCompany ?? "1"),
        guestCompany.text,
        int.parse(selectedType ?? "1"),
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
          print(value.success);
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
  }}
