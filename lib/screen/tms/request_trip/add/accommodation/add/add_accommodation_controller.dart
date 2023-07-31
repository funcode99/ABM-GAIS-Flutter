import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_city_model.dart' as city;
import 'package:gais/data/model/reference/get_hotel_type_model.dart' as type;
import 'package:gais/data/model/request_trip/get_guest_bytrip_model.dart' as guest;
import 'package:gais/screen/tms/request_trip/add/accommodation/check_accommodation/check_accommodation_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddAccommodationController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];
  bool? isEdit = Get.arguments['isEdit'];
  String? id = Get.arguments['id'];

  final formKey = GlobalKey<FormState>();
  final travellerName = TextEditingController();
  final hotelFare = TextEditingController();
  final travellerGender = TextEditingController();
  final checkinDate = TextEditingController();
  final checkoutDate = TextEditingController();
  final remarks = TextEditingController();
  final sharingName = TextEditingController();

  DateFormat dateFormat = DateFormat("MM/dd/yyyy");

  int? travellerID;
  int? jobBandID;
  DateTime? selectedDate;
  String? gender;
  String? selectedCity;
  String? accommodationType;
  String? arrival;
  bool isSharing = false;
  bool createGL = false;
  bool isButtonEnabled = false;

  city.GetCityModel? cityModel;
  List<city.Data> cityList = [];
  type.GetHotelTypeModel? hotelTypeModel;
  List<type.Data> hotelTypeList = [];
  List<guest.Data> shareList = [];

  @override
  void onInit() {
    super.onInit();
    checkinDate.text;
    checkoutDate.text;
    remarks.text;
    isSharing = false;
    createGL = false;
    Future.wait([fetchList()]);
    if(isEdit == true){
      fetchData();
    }
  }


  Future<void> fetchData() async {
    try {
      await repository.getAccommodationByid(id!).then((value) {
        selectedCity = value.data?.first.idCity.toString();
        checkinDate.text = value.data?.first.checkInDate ?? "";
        checkoutDate.text = value.data?.first.checkOutDate ?? "";
        accommodationType = value.data?.first.idTypeAccomodation.toString();
        remarks.text = value.data?.first.remarks ?? "";
        sharingName.text = value.data?.first.sharingWName ?? "";
        value.data?.first.sharingWName != null ? isSharing = true : false;
        value.data?.first.useGl == 1 ? createGL = true: false;
      });
    } catch (e,i) {
      e.printError();
      i.printError();
    }
  }

  Future<void> fetchList() async {
    try {
      await storage.readEmployeeInfo().then((value) {
        travellerID = int.parse(value.first.id.toString());
        travellerName.text = value.first.employeeName.toString();
        hotelFare.text = value.first.hotelFare.toString();
        travellerGender.text =
            value.first.jenkel.toString() == "L" ? "Male" : "Female";
        jobBandID = int.parse(value.first.idJobBand.toString());

      });

      var dataCity = await repository.getCityList();
      cityModel = dataCity;
      cityList.addAll(dataCity.data?.toSet().toList() ?? []);

      var hotelType = await repository.getHotelTypeList();
      hotelTypeModel = hotelType;
      hotelTypeList.addAll(hotelType.data?.toSet().toList() ?? []);

      var share = await repository.getGuestBytripList(purposeID);
      shareList.addAll(share.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);
      sharingName.text = shareList.first.nameGuest ?? "";

      update();
    } catch (e,i) {
      e.printError();
      i.printError();
    }
  }

  Future<void> check() async {
    Get.off(
      const CheckAccommodationScreen(),
      arguments: {
        'purposeID': purposeID,
        'codeDocument': codeDocument,
        'city': int.parse(selectedCity.toString()),
        'checkIn': checkinDate.text,
        'checkOut': checkoutDate.text,
        'accommodationType': int.parse(accommodationType.toString()),
        'useGL': createGL == true ? "1" : "0",
        'sharingName': sharingName.text,
        'remarks': remarks.text,
        'formEdit': formEdit,
        'isEdit': isEdit,
        'id': id,
      },
    );
  }
}
