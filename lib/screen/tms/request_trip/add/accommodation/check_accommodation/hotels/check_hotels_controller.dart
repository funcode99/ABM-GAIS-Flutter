import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/antavaya/get_hotels_model.dart' as hotel;
import 'package:gais/data/model/antavaya/get_country_hotel_model.dart' as country;
import 'package:gais/data/model/antavaya/get_city_hotel_model.dart' as city;
import 'package:gais/data/model/request_trip/update_accommodation_model.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckHotelsController extends BaseController {
  bool isEdit = Get.arguments['isEdit'];
  bool? formEdit = Get.arguments['formEdit'];
  String id = Get.arguments['id'] ?? "0";
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  country.Data2? selectedCountry = Get.arguments['country'];
  city.Data2? selectedCity = Get.arguments['city'];
  String checkinDate = Get.arguments['checkinDate'];
  String checkoutDate = Get.arguments['checkoutDate'];
  UpdateAccommodationModel accommodationData = Get.arguments['data'];

  List<hotel.Hotels> hotelList = [];
  List<bool> viewRoom = [];
  hotel.GetHotelsModel? hotelsModel;
  bool isLoading = false;

  DateFormat saveFormat = DateFormat("yyyy-MM-dd");

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchList()]);
  }

  Future<void> fetchList() async {
    hotelList = [];
    viewRoom = [];
    isLoading = true;
    try {
      await antavaya
          .getHotel(
        selectedCountry!.isoCountryCode.toString(),
        selectedCity!.cityKey.toString(),
        checkinDate,
        checkoutDate,
        "1",
        "1",
      )
          .then((value) {
        hotelsModel = value;
        hotelList.addAll(value.data?.hotels?.toSet().toList() ?? []);
      });

      hotelList.forEach((element) {
        viewRoom.add(false);
      });
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    isLoading = false;
    update();
  }

  Future<void> bookButton(String price, String codeHotel, String room) async {
    try {
      await requestTrip
          .updateAccommodation(
        accommodationData.data!.id.toString(),
        purposeID.toString(),
        accommodationData.data!.idTypeAccomodation.toString(),
        accommodationData.data!.checkInDate.toString(),
        accommodationData.data!.checkInDate.toString(),
        '1',
        accommodationData.data!.useGl.toString(),
        '',
        accommodationData.data!.sharingWName.toString(),
        accommodationData.data!.remarks.toString(),
        price,
        codeHotel,
        accommodationData.data!.travelerName.toString(),
        selectedCountry!.isoCountryCode.toString(),
        selectedCountry!.countryName.toString(),
        selectedCity!.cityKey.toString(),
        selectedCity!.cityName.toString(),
        accommodationData.data?.room ?? '',
        accommodationData.data?.guest ?? '',
        '',
        accommodationData.data!.jenkel.toString(),
        accommodationData.data!.hotelFare.toString(),
      )
          .then((value) {
        print(value.success);
        if (formEdit == true) {
          Get.off(const FormRequestTripScreen(), arguments: {'id': purposeID, 'codeDocument': codeDocument});
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
    }
    update();
  }
}
