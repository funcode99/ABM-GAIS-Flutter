import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
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
  bool? isBooking = Get.arguments['booking'];
  bool? isEdit = Get.arguments['isEdit'];

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

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat saveDateFormat = DateFormat("yyyy-MM-dd");
  DateTime lastDate = DateTime.now().add(const Duration(days: 30));
  DateTime? dateDeparture;
  DateTime? dateReturn;
  GetRequestTripByidModel? rtModel;

  List<station.Data> stationList = [];
  List<guest.Data> travellerList = [];

  bool showTravellerError = false;
  late TextEditingController autocompleteController = TextEditingController();
  List<guest.Data> travellerListFiltered = [];
  List<guest.Data> selectedTravellerList = [];

  Color borderColor = greyColor;

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
      var rtData = await requestTrip.getRequestTripByid(purposeID);
      rtModel = rtData;
      if(rtModel?.data?.first.dateArrival != null){
        lastDate = DateTime.parse(rtModel?.data?.first.dateArrival.toString() ?? "");
        if(lastDate.isBefore(DateTime.now())){
          lastDate = DateTime.now().add(Duration(days: 30));
        }
      }

      // travellerList.add(guest.Data(
      //   idEmployee: rtModel?.data?.first.idEmployee,
      //   nameGuest: rtModel?.data?.first.employeeName,
      // ));
      await requestTrip.getGuestBytripList(purposeID).then((value) => travellerList.addAll(value.data?.toSet().toList() ?? []));

      await antavaya.getTrainStation().then((value) => stationList.addAll(value.data?.toSet().toList() ?? []));
      update();
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    if (trainID != null) {
      await requestTrip.getTrainTripByID(trainID!).then((value) {
        traveller.text = value.data?.first.travelerName ?? '';
        originStation = stationList.where((element) => element.stationName == value.data?.first.nameStation).first;
        destinationStation = stationList.where((element) => element.stationName == value.data?.first.nameStationTo).first;
        dateDeparture = DateTime.parse(value.data!.first.departDate.toString());
        departureDate.text = dateFormat.format(DateTime.parse(value.data!.first.departDate.toString()));


        passengerAdult.text = value.data?.first.adult.toString() ?? '1';
        passengerChild.text = value.data?.first.child.toString() ?? '0';

        String? travellersObjectString = value.data?.first.travelersObject;
        if(travellersObjectString != null){
          final mapTravellers = jsonDecode(travellersObjectString);
          List<Map<String, dynamic>> templist = List<Map<String, dynamic>>.from(mapTravellers);
          selectedTravellerList.addAll(templist.map((element) => guest.Data.fromJson(element)).toList());
        }

      });
    }else{
      traveller.text = requestTripVariable.requestTripRequestorName ?? "";
    }
    isLoading = false;
    update();
  }

  Future<void> save() async {
    if (trainID != null) {
      updateData();
    } else {
      saveData();
    }
    // Get.to(TrainScheduleScreen(), arguments: {
    //   'purposeID': purposeID,
    //   'codeDocument': codeDocument,
    //   'origin': originStation,
    //   'destination': destinationStation,
    //   'formEdit': formEdit,
    //   'departDate': dateDeparture,
    //   'returnDate': dateReturn,
    //   'adult': '1',
    //   'child': '0',
    // });
  }

  Future<void> saveData() async {
    try {
      await requestTrip
          .saveTrainTrip(
            purposeID,
            traveller.text,
            "",
            "",
            originStation!.stationCode.toString(),
            originStation!.stationName.toString(),
            destinationStation!.stationCode.toString(),
            destinationStation!.stationName.toString(),
            saveDateFormat.format(dateDeparture!),
            passengerAdult.text,
            passengerChild.text,
            "",
            selectedTravellerList.map((e) => jsonEncode(e.toJson())).toList()
          )
          .then(
            (value) => formEdit == true
                ? Get.off(const FormRequestTripScreen(), arguments: {'id': purposeID, 'codeDocument': codeDocument})
                : Get.off(const TrainScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument, 'formEdit': formEdit}),
          );
    } catch (e) {
      e.printError();
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
          .updateTrainTrip(
        trainID!,
        purposeID,
        traveller.text,
        "",
        "1",
        originStation!.stationCode.toString(),
        originStation!.stationName.toString(),
        destinationStation!.stationCode.toString(),
        destinationStation!.stationName.toString(),
        saveDateFormat.format(dateDeparture!),
        passengerAdult.text,
        passengerChild.text,
        "",
        selectedTravellerList.map((e) => jsonEncode(e.toJson())).toList()
      )
          .then((value) {
        if (formEdit == true) {
          if (isBooking == true) {
            Get.off(const TrainScheduleScreen(), arguments: {
              'purposeID': purposeID,
              'codeDocument': codeDocument,
              'origin': originStation,
              'destination': destinationStation,
              'departDate': dateDeparture,
              'returnDate': dateReturn,
              'adult': "1",
              'child': "0",
              'formEdit': formEdit,
              'isEdit': isEdit,
              'id': trainID,
              'trainData': value,
            });
          } else {
            Get.off(const FormRequestTripScreen(), arguments: {'id': purposeID, 'codeDocument': codeDocument});
          }
        } else {
          Get.off(const TrainScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument, 'formEdit': formEdit});
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
