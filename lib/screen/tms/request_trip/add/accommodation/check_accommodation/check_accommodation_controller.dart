import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_city_model.dart';
import 'package:gais/data/model/reference/get_hotel_model.dart' as hotel;
import 'package:gais/screen/tms/request_trip/add/accommodation/accommodation_screen.dart';
import 'package:get/get.dart';

class CheckAccommodationController extends BaseController {
  bool isEdit = Get.arguments['isEdit'];
  bool? formEdit = Get.arguments['formEdit'];
  String id = Get.arguments['id'] ?? "0";
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  int cityID = Get.arguments['city'];
  String checkinDate = Get.arguments['checkIn'];
  String checkoutDate = Get.arguments['checkOut'];
  int accommodationType = Get.arguments['accommodationType'];
  String useGL = Get.arguments['useGL'];
  String sharingName = Get.arguments['sharingName'];
  String remarks = Get.arguments['remarks'];

  List<bool> viewRoom = [];
  String? city;

  hotel.GetHotelModel? hotelModel;
  List<hotel.Data> hotelList = [];
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
    try {
      var response = await repository.getHotelList();
      hotelModel = response;
      hotelList
          .addAll(response.data?.where((e) => e.idCity == cityID && e.idTypeHotel == accommodationType).toSet().toList() ?? []);
      hotelList.forEach((element) {
        viewRoom.add(false);
      });

      var cityData = await repository.getCityList();
      cityModel = cityData;
      cityModel?.data?.where((city) => city.id == cityID).forEach((e) {
        city = e.cityName;
      });

      update();
    } catch (e) {
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
  }

  Future<void> selectHotel(
    String idVendor,
    int price,
    String codeHotel,
    String type,
  ) async {
    if (isEdit == true) {
      try {
        await repository
            .updateAccommodation(
              id,
              purposeID.toString(),
              type,
              checkinDate,
              checkoutDate,
              idVendor,
              useGL,
              cityID.toString(),
              sharingName,
              remarks,
              price.toString(),
              codeHotel,
            )
            .then((value) => Get.off(const AccommodationScreen(), arguments: {
                  'purposeID': purposeID,
                  'codeDocument': codeDocument,
                  'formEdit': formEdit,
                }));
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
        await repository
            .saveAccommodation(
              purposeID.toString(),
              type,
              checkinDate,
              checkoutDate,
              idVendor,
              useGL,
              cityID.toString(),
              sharingName,
              remarks,
              price.toString(),
              codeHotel,
            )
            .then((value) => Get.off(
                  const AccommodationScreen(),
                  arguments: {
                    'purposeID': purposeID,
                    'codeDocument': codeDocument,
                    'formEdit': formEdit,
                  },
                ));
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
