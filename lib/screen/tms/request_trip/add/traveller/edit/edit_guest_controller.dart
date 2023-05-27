import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_traveller_type_model.dart'
    as type;
import 'package:gais/data/model/reference/get_department_model.dart'
    as department;
import 'package:gais/data/model/reference/get_company_model.dart' as company;
import 'package:gais/data/model/reference/get_job_band_model.dart' as hotel;
import 'package:gais/data/model/reference/get_flight_class_model.dart'
    as flight;
import 'package:gais/data/model/request_trip/get_guest_byid_model.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class EditGuestController extends BaseController {
  int purposeID = Get.arguments['purposeID'] ?? 1;
  int guestID = Get.arguments['guestID'];
  bool isLoading = true;

  final formKey = GlobalKey<FormState>();
  final guestName = TextEditingController();
  final guestNIK = TextEditingController();
  final guestContact = TextEditingController();
  final guestNotes = TextEditingController();
  final hotelFare = TextEditingController();
  final flightEntitlement = TextEditingController();

  String? selectedType;
  String? selectedGuest;
  String? gender;
  String? selectedDepartment;
  String? selectedCompany;
  String? travellerId;
  int? jobBandID;
  int? flightID;

  GetGuestByidModel? guestModel;
  List<type.Data> typeList = [];
  type.GetTravellerTypeModel? typeModel;
  List<department.Data> departmentList = [];
  department.GetDepartmentModel? departmentModel;
  List<company.Data> companyList = [];
  company.GetCompanyModel? companyModel;

  @override
  void onInit() {
    super.onInit();
    guestName.text;
    guestNIK.text;
    guestContact.text;
    guestNotes.text;
    hotelFare.text;
    flightEntitlement.text;
    Future.wait([
      fetchList(),
      fetchData(),
    ]);
    print("purpose id : $purposeID");
  }

  @override
  void dispose() {
    super.dispose();
    guestName.dispose();
    guestNIK.dispose();
    guestContact.dispose();
    guestNotes.dispose();
    hotelFare.dispose();
    flightEntitlement.dispose();
  }

  Future<void> fetchData() async {
    try {
      await repository.getGuestByID(guestID).then((value) {
        selectedType = value.data?.first.idTypeTraveller.toString();
        guestName.text = value.data?.first.idEmployee.toString() ?? "";
        guestNIK.text = value.data?.first.nik.toString() ?? "";
        guestContact.text = value.data?.first.contactNo.toString() ?? "";
        selectedCompany = value.data?.first.idCompany.toString();
        hotelFare.text = "${int.parse(value.data?.first.hotelFare ?? "0").toCurrency()}";
        selectedDepartment = value.data?.first.departement;
        flightID = value.data?.first.idFlightClass?.toInt();
        guestNotes.text = value.data?.first.notes ?? "";
        travellerId = value.data?.first.idTypeTraveller.toString();
        gender = value.data?.first.gender.toString();
        update();
      });
      isLoading = false;
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
          message: 'Guest Kosong',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> fetchList() async {
    typeList = [];
    departmentList = [];
    companyList = [];

    try {
      var dataType = await repository.getTravellerTypeList();
      typeModel = dataType;
      typeList.addAll(dataType.data?.toSet().toList() ?? []);

      var dataDepartment = await repository.getDepartmentList();
      departmentModel = dataDepartment;
      departmentList.addAll(dataDepartment.data?.toSet().toList() ?? []);

      var dataCompany = await repository.getCompanyList();
      companyModel = dataCompany;
      companyList.addAll(dataCompany.data?.toSet().toList() ?? []);
      companyList.add(company.Data(id: 0, companyName: "Other..."));

      var dataFlight = await repository.getFlightList();
      flightEntitlement.text = dataFlight.data?.where((e) => e.id == flightID).first.flightClass ?? "";

      update();
    } catch (e) {
      e.printError();
    }
    print("purposeID : $purposeID");
  }

  Future<void> updateGuest() async {
    try {
      await repository
          .updateTravellerGuest(
        guestID,
        int.parse(guestName.text),
        purposeID,
        int.parse(selectedCompany ?? "1"),
        selectedCompany ?? "1",
        int.parse(travellerId ?? "1"),
        guestNIK.text,
        guestContact.text,
        selectedDepartment ?? "1",
        hotelFare.text.digitOnly() ?? "1",
        flightID ?? 1,
        guestNotes.text,
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
      s.printInfo();
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
