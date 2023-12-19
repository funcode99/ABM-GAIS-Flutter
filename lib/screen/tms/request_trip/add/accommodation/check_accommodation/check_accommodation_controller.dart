import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_city_model.dart';
import 'package:gais/data/model/reference/get_hotel_model.dart' as hotel;
import 'package:gais/data/model/antavaya/get_country_hotel_model.dart' as country;

// import 'package:gais/data/model/antavaya/get_city_hotel_model.dart' as ct;
import 'package:gais/data/model/antavaya/get_city_hotel_model.dart' as ct;
import 'package:gais/data/model/reference/get_hotel_model.dart' as ht;
import 'package:gais/screen/tms/request_trip/add/accommodation/accommodation_screen.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class CheckAccommodationController extends BaseController {
  bool isEdit = Get.arguments['isEdit'];
  bool? formEdit = Get.arguments['formEdit'];
  String id = Get.arguments['id'] ?? "0";
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];

  // ct.Data2? cityID = Get.arguments['city'];
  country.Data2? countryID = Get.arguments['country'];
  String checkinDate = Get.arguments['checkinDate'];
  String checkoutDate = Get.arguments['checkoutDate'];
  String accommodationType = Get.arguments['accommodationType'];
  String useGL = Get.arguments['useGL'];
  String sharingName = Get.arguments['sharingName'];
  String remarks = Get.arguments['remarks'];
  ct.Data2? selectedCity = Get.arguments['city'];

  List<bool> viewRoom = [];
  String? city;
  bool isLoading = false;

  hotel.GetHotelModel? hotelModel;

  List<hotel.Data> hotelList = [];

  // List<ht.Hotels> hotelList = [];
  GetCityModel? cityModel;

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchList()]);
    formEdit.printInfo();
  }

  Future<void> fetchList() async {
    hotelList = [];
    viewRoom = [];
    isLoading = true;
    try {
      // await antavaya.getHotel(countryID!.isoCountryCode.toString(), cityID!.cityKey.toString(), checkinDate, checkoutDate, '1', '1').then((value) {
      //   print(value);
      // });
      var response = await repository.getHotelList();
      hotelModel = response;
      // hotelList.addAll(response.data?.where((e) => e.idCity == cityID && e.idTypeHotel == accommodationType).toSet().toList() ?? []);
      hotelList.addAll(
          response.data?.where((e) => e.cityName == selectedCity!.cityName && e.idTypeHotel == accommodationType.toInt()).toSet().toList() ?? []);
      hotelList.forEach((element) {
        viewRoom.add(false);
      });

      // var cityData = await repository.getCityList();
      // cityModel = cityData;
      // cityModel?.data?.where((city) => city.id == cityID).forEach((e) {
      //   city = e.cityName;
      // });
    } catch (e, i) {
      e.printError();
      i.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Failed To Load Data',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
    isLoading = false;
    update();
  }

  Future<void> selectHotel(
    String idVendor,
    int price,
    String codeHotel,
    String type,
  ) async {
    if (isEdit == true) {
      try {
        // await requestTrip
        //     .updateAccommodation(
        //       id,
        //       purposeID.toString(),
        //       type,
        //       checkinDate,
        //       checkoutDate,
        //       idVendor,
        //       useGL,
        //       cityID.toString(),
        //       sharingName,
        //       remarks,
        //       price.toString(),
        //       codeHotel,
        //     )
        //     .then((value) => Get.off(const AccommodationScreen(), arguments: {
        //           'purposeID': purposeID,
        //           'codeDocument': codeDocument,
        //           'formEdit': formEdit,
        //         }));
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
      try {
        // await requestTrip
        //     .saveAccommodation(
        //       purposeID.toString(),
        //       type,
        //       checkinDate,
        //       checkoutDate,
        //       idVendor,
        //       useGL,
        //       cityID.toString(),
        //       sharingName,
        //       remarks,
        //       price.toString(),
        //       codeHotel,
        //
        //     )
        //     .then((value) => Get.off(
        //           const AccommodationScreen(),
        //           arguments: {
        //             'purposeID': purposeID,
        //             'codeDocument': codeDocument,
        //             'formEdit': formEdit,
        //           },
        //         ));
      } catch (e) {
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
  }
}
