import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/antavaya/get_country_hotel_model.dart' as country;
import 'package:gais/data/model/antavaya/get_city_hotel_model.dart' as city;

// import 'package:gais/data/model/reference/get_city_model.dart' as city;
import 'package:gais/data/model/reference/get_hotel_type_model.dart' as type;
import 'package:gais/data/model/request_trip/get_guest_bytrip_model.dart' as guest;
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/check_accommodation/check_accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/check_accommodation/hotels/check_hotels_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddAccommodationController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];
  bool? isEdit = Get.arguments['isEdit'];
  String? id = Get.arguments['id'];
  bool? isBooking = Get.arguments['booking'];

  final formKey = GlobalKey<FormState>();
  final travellerName = TextEditingController();
  final hotelFare = TextEditingController();
  final travellerGender = TextEditingController();
  final checkinDate = TextEditingController();
  final checkoutDate = TextEditingController();
  final remarks = TextEditingController();
  final sharingName = TextEditingController();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat saveFormat = DateFormat("yyyy-MM-dd");
  DateTime lastDate = DateTime.now().add(const Duration(days: 30));

  int? travellerID;
  int? jobBandID;
  DateTime? dateCheckin;
  DateTime? dateCheckout;
  String? gender;
  country.Data2? selectedCountry;
  city.Data2? selectedCity;
  String countryName = "Indonesia";
  String? cityName;
  String? accommodationType;
  String? arrival;
  bool isSharing = false;
  bool createGL = false;
  bool isButtonEnabled = false;
  bool hasGuest = false;
  bool isLoading = false;

  GetRequestTripByidModel? rtModel;

  // city.GetCityModel? cityModel;
  List<city.Data2> cityList = [];
  List<country.Data2> countryList = [];
  type.GetHotelTypeModel? hotelTypeModel;
  List<type.Data> hotelTypeList = [];
  List<guest.Data> shareList = [];

  List<guest.Data> travellerList = [];

  bool showTravellerError = false;
  late TextEditingController autocompleteController = TextEditingController();
  List<guest.Data> travellerListFiltered = [];
  List<guest.Data> selectedTravellerList = [];

  Color borderColor = greyColor;
  final roomController = TextEditingController();
  final guestController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    checkinDate.text;
    checkoutDate.text;
    remarks.text;
    isSharing = false;
    createGL = false;
    print("isEdit : $isEdit $id ");
    Future.wait([fetchList()]);
  }

  Future<void> fetchCity(String id) async {
    cityList = [];
    isLoading = true;
    try {
      await antavaya.getCity(id).then((value) => cityList.addAll(value.data?.data?.toSet().toList() ?? []));
    } catch (e) {
      e.printError();
    }
    isLoading = false;
    update();
  }

  Future<void> fetchData() async {
    print('accommodationID  :$id');
    try {
      await requestTrip.getAccommodationByid(id!).then((value) {
        // print(cityList.where((e) => e.cityName == value.data?.first.cityName.toString()).first.cityName);
        print(value.data?.first.nameCity.toString());
        selectedCountry = countryList.where((e) => e.countryName == value.data?.first.nameCountry.toString()).first;
        selectedCity = cityList.where((e) => e.cityName == value.data?.first.nameCity.toString()).first;
        checkinDate.text = dateFormat.format(DateTime.parse(value.data?.first.checkInDate ?? DateTime.now().toString())) ?? "";
        checkoutDate.text =  dateFormat.format(DateTime.parse(value.data?.first.checkOutDate ?? DateTime.now().toString())) ?? "";
        dateCheckin = DateTime.parse(value.data!.first.checkInDate.toString());
        dateCheckout = DateTime.parse(value.data!.first.checkOutDate.toString());
        if (dateCheckin!.isBefore(DateTime.now())) {
          dateCheckin = DateTime.now();
          dateCheckout = DateTime.now().add(const Duration(days: 1));
          checkinDate.text = dateFormat.format(dateCheckin!);
          checkoutDate.text = dateFormat.format(dateCheckout!);
        }
        accommodationType = value.data?.first.idTypeAccomodation.toString();
        remarks.text = value.data?.first.remarks ?? "";
        sharingName.text = value.data?.first.sharingWName ?? "";
        value.data?.first.sharingWName != null ? isSharing = true : false;
        value.data?.first.useGl == 1 ? createGL = true : false;

        roomController.text = "${value.data?.first.room ?? 1}";
        guestController.text = "${value.data?.first.guest ?? 0}";



        String? travellersObjectString = value.data?.first.travelersObject;
        if(travellersObjectString != null){
          final mapTravellers = jsonDecode(travellersObjectString);
          List<Map<String, dynamic>> templist = List<Map<String, dynamic>>.from(mapTravellers);
          selectedTravellerList.addAll(templist.map((element) => guest.Data.fromJson(element)).toList());
        }

      });
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    update();
  }

  Future<void> fetchList() async {
    isLoading = true;
    try {
      await storage.readEmployeeInfo().then((value) {
        travellerID = int.parse(value.first.id.toString());
        travellerName.text = value.first.employeeName.toString();
        hotelFare.text = value.first.hotelFare?.toInt().toCurrency().toString() ?? "";
        travellerGender.text = value.first.jenkel.toString() == "L" ? "Male" : "Female";
        jobBandID = int.parse(value.first.idJobBand.toString());
      });

      // travellerID = requestTripVariable.requestTripRequestorID;
      // travellerName.text = requestTripVariable.requestTripRequestorName.toString();
      // travellerGender.text = requestTripVariable.requestTripRequestorGender.toString() == "L" ? "Male" : "Female";;
      // hotelFare.text = requestTripVariable.requestTripRequestorHotelFare.toString();
      // jobBandID = requestTripVariable.requestTripRequestorJobBandID;

      // var dataCity = await repository.getCityList();
      // cityModel = dataCity;
      // cityList.addAll(dataCity.data?.toSet().toList() ?? []);

      await antavaya.getCountry().then((value) => countryList.addAll(value.data?.data?.toSet().toList() ?? []));
      selectedCountry = countryList.where((e) => e.isoCountryCode == "ID").first;
      await antavaya.getCity(selectedCountry!.isoCountryCode.toString()).then((value) => cityList.addAll(value.data?.data?.toSet().toList() ?? []));

      var hotelType = await repository.getHotelTypeList();
      hotelTypeModel = hotelType;
      hotelTypeList.addAll(hotelType.data?.toSet().toList() ?? []);

      var share = await requestTrip.getGuestBytripList(purposeID);
      shareList.addAll(share.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);
      if (shareList.isNotEmpty) {
        sharingName.text = shareList.first.nameGuest ?? "";
        var guestData = await requestTrip.getGuestBytripList(purposeID);
        print("has guest ${guestData.success.toString()}");
        hasGuest = guestData.success.toString() == 'true' ? true : false;
      }

      var rtData = await requestTrip.getRequestTripByid(purposeID);
      rtModel = rtData;
      if(rtModel?.data?.first.dateArrival != null){
        lastDate = DateTime.parse(rtModel?.data?.first.dateArrival.toString() ?? "");
        if(lastDate.isBefore(DateTime.now())){
          lastDate = DateTime.now().add(const Duration(days: 30));
        }
      }
    } catch (e, i) {
      e.printError();
      i.printError();
    }

    await requestTrip.getGuestBytripList(purposeID).then((value) => travellerList.addAll(value.data?.toSet().toList() ?? []));

    isLoading = false;

    update();
    if (isEdit == true) {
      fetchData();
    }
  }

  Future<void> check() async {
    if (isEdit == true) {
      updateData();
    } else {
      saveData();
    }

    update();
  }

  Future<void> saveData() async {
    try {
      await requestTrip
          .saveAccommodation(
            purposeID.toString(),
            accommodationType.toString(),
            saveFormat.format(dateCheckin!).toString(),
            saveFormat.format(dateCheckout!).toString(),
            '1',
            createGL ? '1' : '0',
            '',
            isSharing ? sharingName.text : '',
            remarks.text,
            '',
            '',
            travellerName.text,
            selectedCountry!.isoCountryCode.toString(),
            selectedCountry!.countryName.toString(),
            selectedCity!.cityKey.toString(),
            selectedCity!.cityName.toString(),
            roomController.text,
            guestController.text,
            '',
            travellerGender.text == "Male" ? 'L' : 'P',
            hotelFare.text.digitOnly(),
            selectedTravellerList.map((e) => jsonEncode(e.toJson())).toList()

      )
          .then((value) => formEdit == true
              ? Get.off(const FormRequestTripScreen(), arguments: {'id': purposeID, 'codeDocument': codeDocument})
              : Get.off(
                  const AccommodationScreen(),
                  arguments: {
                    'purposeID': purposeID,
                    'codeDocument': codeDocument,
                    'formEdit': formEdit,
                  },
                ));
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
  }

  Future<void> updateData() async {
    try {
      await requestTrip
          .updateAccommodation(
        id!,
        purposeID.toString(),
        accommodationType.toString(),
        saveFormat.format(dateCheckin!).toString(),
        saveFormat.format(dateCheckout!).toString(),
        '1',
        createGL ? '1' : '0',
        '',
        isSharing ? sharingName.text : '',
        remarks.text,
        '',
        '',
        travellerName.text,
        selectedCountry!.isoCountryCode.toString(),
        selectedCountry!.countryName.toString(),
        selectedCity!.cityKey.toString(),
        selectedCity!.cityName.toString(),
        roomController.text,
        guestController.text,
        '',
        travellerGender.text == "Male" ? 'L' : 'P',
        hotelFare.text.digitOnly(),
        "",
        "",
        "",
        "",
        null,
        null,
        null,
        selectedTravellerList.map((e) => jsonEncode(e.toJson())).toList()
      )
          .then((value) {
        // print(jsonEncode(value));
        if (formEdit == true) {
          if (isBooking == true) {
            if (accommodationType == '1') {
              Get.to(
                const CheckHotelsScreen(),
                arguments: {
                  'purposeID': purposeID,
                  'codeDocument': codeDocument,
                  'formEdit': formEdit,
                  'isEdit': isEdit,
                  'id': id,
                  'city': selectedCity,
                  'country': selectedCountry,
                  'checkinDate': checkinDate.text,
                  'checkoutDate': checkoutDate.text,
                  'data': value,
                  'accommodationType': accommodationType,
                },
              );
            } else {
              Get.to(
                const CheckAccommodationScreen(),
                arguments: {
                  'purposeID': purposeID,
                  'codeDocument': codeDocument,
                  'formEdit': formEdit,
                  'isEdit': isEdit,
                  'id': id,
                  'city': selectedCity,
                  'country': selectedCountry,
                  'checkinDate': checkinDate.text,
                  'checkoutDate': checkoutDate.text,
                  'data': value,
                  'accommodationType': accommodationType,
                  'useGL': createGL ? '1' : '0',
                  'sharingName': isSharing ? sharingName.text : '',
                  'remarks': remarks.text,
                },
              );
            }
          } else {
            Get.off(const FormRequestTripScreen(), arguments: {'id': purposeID, 'codeDocument': codeDocument});
          }
        } else {
          Get.off(const AccommodationScreen(), arguments: {
            'purposeID': purposeID,
            'codeDocument': codeDocument,
            'formEdit': formEdit,
          });
        }
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
          message: 'Failed To Save',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<List<guest.Data>> getGuestByKeyword(String keyword)async{

    List<guest.Data> list = [];
    final tempTravellers = travellerList.where((element) => element.nameGuest!.contains(keyword));

    final temp = selectedTravellerList.map((e) => e.id).toList();
    final travelers = tempTravellers.where((element) => !temp.contains(element.id));
    list.addAll(travelers);

    return list;
  }

  void deleteTravellerItem(guest.Data item) {
    selectedTravellerList.removeWhere((element) => item.id == element.id);
    update();
  }
}
