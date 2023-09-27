import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/antavaya/get_train_station_model.dart' as station;
import 'package:gais/data/model/request_trip/get_guest_bytrip_model.dart' as guest;
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:gais/screen/tms/request_trip/add/train/schedule/train_schedule_screen.dart';
import 'package:gais/screen/tms/request_trip/add/train/train_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTrainController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];
  String? trainID = Get.arguments['id'];

  final formKey = GlobalKey<FormState>();
  final traveller = TextEditingController();
  station.Data? originStation;
  station.Data? destinationStation;
  final departureDate = TextEditingController();
  final returnDate = TextEditingController();
  final passengerAdult = TextEditingController();
  final passengerInfant = TextEditingController();
  final passengerChild = TextEditingController();
  bool roundTrip = false;
  bool isLoading = false;

  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  DateFormat saveDateFormat = DateFormat("yyyy/MM/dd");
  DateTime lastDate = DateTime.now().add(const Duration(days: 30));
  DateTime? dateDeparture;
  DateTime? dateReturn;
  GetRequestTripByidModel? rtModel;

  List<station.Data> stationList = [];
  List<guest.Data> travellerList = [];

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchList()]);
  }

  Future<void> fetchList() async {
    stationList = [];
    travellerList = [];
    isLoading = true;
    print('purposeID : $purposeID');
    try {
      var rtData = await repository.getRequestTripByid(purposeID);
      rtModel = rtData;
      lastDate = DateTime.parse(rtModel?.data?.first.dateArrival.toString() ?? "");

      travellerList.add(guest.Data(
        idEmployee: rtModel?.data?.first.idEmployee,
        nameGuest: rtModel?.data?.first.employeeName,
      ));
      await repository.getGuestBytripList(purposeID).then((value) => travellerList.addAll(value.data?.toSet().toList() ?? []));

      await antavaya.getTrainStation().then((value) => stationList.addAll(value.data?.toSet().toList() ?? []));
      update();
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    isLoading = false;
    update();
  }

  Future<void> save() async {
    Get.to(TrainScheduleScreen(), arguments: {
      'purposeID': purposeID,
      'codeDocument': codeDocument,
      'origin': originStation,
      'destination': destinationStation,
      'formEdit': formEdit,
      'departDate': dateDeparture,
      'returnDate': dateReturn,
      'adult': '1',
      'child': '0',
    });
  }

  void back() {
    formEdit == true
        ? Get.off(const FormRequestTripScreen(), arguments: {
            'id': purposeID,
            'codeDocument': codeDocument,
          })
        : Get.off(const TrainScreen(), arguments: {
            'purposeID': purposeID,
            'codeDocument': codeDocument,
          });
  }
}
