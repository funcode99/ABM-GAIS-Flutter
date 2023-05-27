import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_traveller_type_model.dart'
    as type;
import 'package:gais/data/model/reference/get_department_model.dart'
    as department;
import 'package:gais/data/model/reference/get_company_model.dart' as company;
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class AddGuestController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
  int travellerID = Get.arguments['travellerID'];
  int? guestID = Get.arguments['guestID'];

  final formKey = GlobalKey<FormState>();
  final guestName = TextEditingController();
  final guestNIK = TextEditingController();
  final guestContact = TextEditingController();
  final notes = TextEditingController();
  final otherCompany = TextEditingController();
  final hotelFare = TextEditingController();
  final flightEntitlement = TextEditingController();

  String? selectedType;
  String? selectedGuest;
  String? gender = "Gender";
  String? selectedDepartment;
  String? selectedCompany;
  int? jobBandID;
  int? idFlight;

  List<type.Data> typeList = [];
  type.GetTravellerTypeModel? typeModel;
  // List<SelectedGuestModel> guestList = [];
  // List _guestList = [];
  // guest.GetEmployeeModel? guestModel;
  List<department.Data> departmentList = [];
  department.GetDepartmentModel? departmentModel;
  List<company.Data> companyList = [];
  company.GetCompanyModel? companyModel;

  // List<hotel.Data> hotelList = [];
  // hotel.GetJobBandModel? hotelModel;
  // List<flight.Data> flightList = [];
  // flight.GetFlightClassModel? flightModel;

  @override
  void onInit() {
    super.onInit();
    guestName.text;
    guestNIK.text;
    guestContact.text;
    notes.text;
    otherCompany.text;
    hotelFare.text;
    flightEntitlement.text;
    Future.wait([fetchList()]);
    print("purpose id : $purposeID");
  }

  @override
  void dispose() {
    super.dispose();
    guestName.dispose();
    guestNIK.dispose();
    guestContact.dispose();
    notes.dispose();
    otherCompany.dispose();
    hotelFare.dispose();
    flightEntitlement.dispose();
  }

  Future<void> fetchList() async {
    typeList = [];
    departmentList = [];
    companyList = [];
    // hotelList = [];
    // flightList = [];
    try {
      var dataType = await repository.getTravellerTypeList();
      typeModel = dataType;
      typeList.addAll(dataType.data?.toSet().toList() ?? []);

      // var dataGuest = await repository.getEmployeeList();
      // guestModel = dataGuest;
      // _guestList.addAll(dataGuest.data ?? []);
      // guestModel?.data?.forEach((element) {
      //   guestList.add(SelectedGuestModel(
      //     name: element.employeeName.toString(),
      //     value: element.id.toString(),
      //     isSelected: false,
      //     gender: element.jenkel,
      //     sn: element.snEmployee,
      //     phone: element.phoneNumber,
      //     nik: element.nik,
      //   ));
      // });

      var dataDepartment = await repository.getDepartmentList();
      departmentModel = dataDepartment;
      departmentList.addAll(dataDepartment.data?.toSet().toList() ?? []);

      var dataCompany = await repository.getCompanyList();
      companyModel = dataCompany;
      companyList.addAll(dataCompany.data?.toSet().toList() ?? []);
      companyList.add(company.Data(id: 0, companyName: "Other..."));

      storage.readEmployeeInfo().then((value) {
        jobBandID = int.parse(value.first.idJobBand.toString());
        flightEntitlement.text = value.first.flightClass;
        // idFlight = int.parse(value.first.)
      });

      var dataHotel = await repository.getJobBandList();
      hotelFare.text =
          "${int.parse(dataHotel.data?.where((e) => e.id == jobBandID).first.hotelFare ?? " ").toCurrency()}";
      idFlight = dataHotel.data?.where((e) => e.id == jobBandID).first.idFlightClass?.toInt() ?? 0;
      // hotelModel = dataHotel;
      // hotelList.addAll(dataHotel.data?.toSet().toList() ?? []);



      // var dataFlight = await repository.getFlightList();
      // idFlight = dataFlight.data.where((e) => false)
      // flightModel = dataFlight;
      // flightList.addAll(dataFlight.data?.toSet().toList() ?? []);

      update();
    } catch (e) {
      print("error : $e");
    }
    print("purposeID : $purposeID");
  }

  // Future<void> setGuestInfo() async {
  //   gender = guestList
  //       .where((e) => e.value == selectedGuest)
  //       .first
  //       .gender
  //       .toString();
  //   guestNIK.text =
  //       guestList.where((e) => e.value == selectedGuest).first.sn.toString();
  //   guestContact.text =
  //       guestList.where((e) => e.value == selectedGuest).first.phone.toString();
  //   // guestNIK =
  //   //     guestList.where((e) => e.value == selectedGuest).first.nik.toString();
  //   print(selectedGuest);
  //   // print("list : ${_guestList.first.employeeName}");
  //   print(guestList.where((e) => e.value == selectedGuest).first);
  // }

  Future<void> saveGuest() async {
    try {
      await repository
          .saveTravellerGuest(
        guestName.text,
        purposeID.toString(),
        selectedCompany ?? "1",
        otherCompany.text,
        travellerID.toString(),
        guestNIK.text,
        guestContact.text,
        selectedDepartment ?? "",
        hotelFare.text.digitOnly() ?? "",
        idFlight.toString() ?? "1",
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
    } catch (e,i) {
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
}
