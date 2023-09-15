import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/room/room_model.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:gais/data/model/week_model.dart';
import 'package:gais/data/repository/booking_meeting_room/dashboard_meeting_room_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/ext/date_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class NewDashboardMeetingRoomController extends BaseController with MasterDataMixin {
  List listYears = [];
  final listDates = <WeekModel>[].obs;
  List listMonths = [
    {"id": 1, "value": "January"},
    {"id": 2, "value": "February"},
    {"id": 3, "value": "March"},
    {"id": 4, "value": "April"},
    {"id": 5, "value": "May"},
    {"id": 6, "value": "June"},
    {"id": 7, "value": "July"},
    {"id": 8, "value": "August"},
    {"id": 9, "value": "September"},
    {"id": 10, "value": "October"},
    {"id": 11, "value": "November"},
    {"id": 12, "value": "December"}
  ];

  List listDays = [""];

  DateTime? initialDate;
  DateTime? nextDate;
  DateTime? currentDate;
  int? selectedDate = DateTime.now().day;
  int? selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  bool loadCompany = false;
  bool loadSite = false;
  bool loadFloor = false;
  bool loadRoom = false;

  final listCompany = <CompanyModel>[].obs;
  final selectedCompany = Rxn<CompanyModel>();
  final enableSelectCompany = false.obs;

  final listSite = <SiteModel>[].obs;
  final selectedSite = Rxn<SiteModel>();
  final enableSelectSite = false.obs;

  final listShowedRoom = <RoomModel>[].obs;
  final listRoom = <RoomModel>[].obs;
  final selectedRoom = Rxn<RoomModel>();

  final companyName = "".obs;
  final siteName = "".obs;

  List listOfDates(DateTime now) {
    listDates.clear();
    int currentDay = now.weekday;
    initialDate = now.subtract(Duration(days: currentDay - 1));
    nextDate = initialDate?.add(const Duration(days: 5));
    currentDate = initialDate;
    listDates.value = List<WeekModel>.generate(
        nextDate!.difference(initialDate!).inDays,
            (i) => WeekModel(
          day: DateFormat("EE").format(initialDate!.add(Duration(days: i))),
          date: int.parse(DateFormat("dd").format(initialDate!.add(Duration(days: i)))),
        )
      // "${DateFormat("EE").format(initialDate!.add(Duration(days: i)))}\n${DateFormat("dd").format(initialDate!.add(Duration(days: i)))}",
    );

    return listDates;
  }


  DateTime? startDate;
  DateTime? endDate;
  DateFormat formatFilter = DateFormat("yyyy-MM-dd");
  final DashboardMeetingRoomRepository _repository = Get.find();

  final listHeader = <BookingMeetingRoomModel>[].obs;
  final listMappedBooking = <BookingMeetingRoomModel>[].obs;
  final listMappedRoom = <String>[].obs;

  final listMap = {}.obs;

  final List<DateTime> _listHours = [
    DateTime.now().copyDateWith(hour: 7, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 8, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 8, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 9, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 9, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 10, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 10, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 11, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 11, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 12, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 12, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 13, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 13, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 14, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 14, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 15, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 15, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 16, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 16, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 17, minute: 00, second: 0),
  ];

  @override
  void onInit() {
    super.onInit();
    listYears = Iterable<int>.generate((DateTime.now().year) + 1).skip(2020).toList().reversed.toList();
    listOfDates(DateTime.now());
    getHeader();

    /*selectedCompany.listen((p0) {
      getHeader();
    });*/

    selectedSite.listen((p0) {
      getHeader();
    });

    /*selectedRoom.listen((p0) {
      getHeader();
    });*/
    listMap.listen((p0) {
      setListMappedBooking();
      setListMappedRoom();
    });

    listShowedRoom.listen((p0) {
      populateMapping();
    });

    listHeader.listen((p0) {
      populateMapping();
    });

  }

  @override
  void dispose() {
    super.dispose();
    selectedDate = DateTime.now().day;
    selectedMonth = DateTime.now().month;
    selectedYear = DateTime.now().year;
  }


  @override
  void onReady() {
    super.onReady();
    initData();
  }

  initData() async {
    String companyName = await storage.readString(StorageCore.companyName);
    String idCompany = await storage.readString(StorageCore.companyID);
    String siteName = await storage.readString(StorageCore.siteName);
    String idSite = await storage.readString(StorageCore.siteID);
    String codeRole = await storage.readString(StorageCore.codeRole);

    listRoom.add(RoomModel(id: "", nameMeetingRoom: "Meeting Room"));

    //TODO remove superadmin
    if(codeRole == RoleEnum.administrator.value){
    // if(codeRole == RoleEnum.administrator.value || codeRole == RoleEnum.superAdmin.value){
      enableSelectCompany(true);

      listCompany.add(CompanyModel(id: "", companyName: "Company"));
      final companies = await getListCompany();
      listCompany.addAll(companies);
      onChangeSelectedCompany(idCompany);
    }else{
      selectedCompany.value = CompanyModel(
          id: idCompany
      );
      listCompany.add(CompanyModel(id: idCompany, companyName: companyName));
      onChangeSelectedCompany(idCompany);
      this.companyName.value = companyName;
    }

    if(codeRole == RoleEnum.administrator.value || codeRole == RoleEnum.superAdmin.value){
      enableSelectSite(true);

      listSite.add(SiteModel(id: "", siteName: "Site"));

      onChangeSelectedSite(listSite.first.id);
    }else{
      selectedSite.value = SiteModel(
          id: idSite
      );
      listSite.add(SiteModel(id: idSite, siteName: siteName));
      onChangeSelectedSite(idSite);
      this.siteName.value = siteName;
    }

    onChangeSelectedRoom("");
  }

  void getMeetingRoom() async{
    if(selectedSite.value != null){
      if(selectedSite.value!.id != null){
        listShowedRoom.clear();
        listRoom.removeWhere((element) => element.id != "");
        final list = await getListMeetingRoomBySiteId(selectedSite.value!.id);
        listRoom.addAll(list);
        listShowedRoom.addAll(list);
      }
    }
  }

  void getHeader() async {
    String date = "$selectedYear-$selectedMonth-$selectedDate";
    final result = await _repository.getData(
        data: {
          "start_date" : date,
          "end_date" : date,
          "id_company" : selectedCompany.value?.id,
          "id_site" : selectedSite.value?.id,
          "id_meeting_room[]" : selectedRoom.value?.id,
        }
    );

    result.fold((l) {
        Get.showSnackbar(CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
        listHeader.clear();
      },
      (r) {
        listHeader.clear();
        listHeader.addAll(r);

        populateMapping();
      });
  }

  void populateMapping(){
    Map<String, dynamic> tempMap = {};
    int position = 0;
    listMap.clear();

    for (RoomModel element in listShowedRoom) {
      if(element.id != ""){
        tempMap.putIfAbsent("${element.id}", () => {
          "room_name" : element.nameMeetingRoom,
          "listBooking" : listHeader.where((e) => e.idMeetingRoom == element.id).toList(),
          "listMappedBooking" : [],
        });
      }
    }

    tempMap.forEach((key, value) {
      List<BookingMeetingRoomModel> tempList = List<BookingMeetingRoomModel>.from(value["listBooking"]);
      List<BookingMeetingRoomModel> tempBookingMeetingRoomList = [];

      for (BookingMeetingRoomModel element in tempList) {
        DateTime? startTime = element.startTime?.toDate(originFormat: "HH:mm:ss");
        DateTime? endTime = element.endTime?.toDate(originFormat: "HH:mm:ss");
        if(startTime != null && endTime != null){
          int startHour = startTime.hour;
          int startMinute = startTime.minute;
          int endHour = endTime.hour;
          int endMinute = endTime.minute;

          if(startMinute >= 0 && startMinute < 30){
            startMinute = 0;
          }else if(startMinute >= 30 && startMinute <= 59){
            startMinute = 30;
          }

          if(endMinute >= 0 && endMinute < 30){
            endMinute = 0;
          }else if(endMinute >= 30 && endMinute <= 59){
            endMinute = 30;
          }

          int duration = ((endHour * 60) + endMinute) - ((startHour * 60) + startMinute);
          element.hour = startHour;
          element.minute = startMinute;
          element.durationInMinute = duration;
          element.position = position;

          tempBookingMeetingRoomList.add(element);
        }
      }

      tempMap[key]["listMappedBooking"] = tempBookingMeetingRoomList;
      position++;

    });
    listMap.value = Map<String, dynamic>.from(tempMap);
  }

  void setListMappedBooking(){
    List<BookingMeetingRoomModel> result = [];
    listMappedBooking.clear();
    listMap.forEach((key, value) {
      result.addAll(List<BookingMeetingRoomModel>.from(value["listMappedBooking"]));
    });

    listMappedBooking.addAll(result);
  }

  void setListMappedRoom(){
    List<String> result = [];
    listMappedRoom.clear();
    listMap.forEach((key, value) {
      result.add(value["room_name"]);
    });
    listMappedRoom.addAll(result);
  }

  Color getColor(dynamic codeStatusDoc){
    Color color = const Color(0XFF97B3C6);
    switch(codeStatusDoc.toString()){
      case "0" : //BookingMeetingRoomEnum.draft.value
        color = const Color(0XFFf7a516);
        break;
      case "10" : //BookingMeetingRoomEnum.done.value
        color = const Color(0xff87C556);
        break;
      case "9" : //BookingMeetingRoomEnum.cancel.value
        color = const Color(0xffF04438);
        break;
      case "1" : //BookingMeetingRoomEnum.booked.value
      default:
        color = const Color(0XFF97B3C6);
        break;
    }
    return color;
  }

  void onChangeSelectedCompany(String id) {
    if(listCompany.isNotEmpty){
      final selected = listCompany.firstWhere(
              (item) => item.id.toString() == id.toString(),
          orElse: () => listCompany.first);
      selectedCompany(selected);

      //clear site and filter sites
      onChangeSelectedSite("");
      _filterSite(selected.id.toString());
    }
  }

  void onChangeSelectedSite(String id) {
    if(listSite.isNotEmpty){
      final selected = listSite.firstWhere(
              (item) => item.id.toString() == id.toString(),
          orElse: () => listSite.first);
      selectedSite(selected);

      //clear warehouse and filter room
      onChangeSelectedRoom("");
      _filterMeetingRoom(selected.id.toString());
    }
  }

  void onChangeSelectedRoom(String id) {
    if(listRoom.isNotEmpty){
      final selected = listRoom.firstWhere(
              (item) => item.id.toString() == id.toString(),
          orElse: () => listRoom.first);

      selectedRoom(selected);
      listShowedRoom.clear();
      if(id.isNotEmpty){
        listShowedRoom.add(selected);
      }else{
        listShowedRoom.addAll(listRoom);
      }
    }
  }

  void _filterSite(String idCompany)async{
    listSite.removeWhere((element) => element.id != "");
    if(idCompany.isNotEmpty){
      final filtered = await getListSiteByCompanyId(idCompany.toInt());
      listSite.addAll(filtered);
      if(selectedSite.value?.id != null){
        if(selectedSite.value!.id.toString().isEmpty){
          String idSite = await storage.readString(StorageCore.siteID);
          onChangeSelectedSite(idSite);
        }
      }
    }
  }

  void _filterMeetingRoom(String idSite)async{
    listRoom.removeWhere((element) => element.id != "");
    listShowedRoom.clear();
    if(idSite.isNotEmpty){
      final filtered = await getListMeetingRoomBySiteId(idSite.toInt());
      listRoom.addAll(filtered);
      listShowedRoom.addAll(filtered);
    }
  }
}