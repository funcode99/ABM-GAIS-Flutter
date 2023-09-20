import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/room/room_model.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/repository/booking_meeting_room/dashboard_meeting_room_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/ext/date_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardMeetingRoomController extends BaseController with MasterDataMixin {
  final listYears = [].obs;
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

  final DateFormat dayDateFormat = DateFormat("EE");
  final DateFormat hourMinuteSecondFormat = DateFormat("HH:mm:ss");
  final DateFormat requestDateFormat = DateFormat("yyyy-MM-dd");

  late TextEditingController autocompleteController = TextEditingController();

  final selectedMonth = DateTime.now().month.obs;
  final selectedYear = DateTime.now().year.obs;

  final selectedDate = Rxn<DateTime>();
  final listDate = <DateTime>[].obs;
  final firstDate = Rxn<DateTime>();

  final listCompany = <CompanyModel>[].obs;
  final selectedCompany = Rxn<CompanyModel>();
  final enableSelectCompany = false.obs;

  final listSite = <SiteModel>[].obs;
  final selectedSite = Rxn<SiteModel>();
  final enableSelectSite = false.obs;

  final listShowedRoom = <RoomModel>[].obs;
  final listSelectedRoom = <RoomModel>[].obs;
  final listNotSelectedRoom = <RoomModel>[].obs;
  final listRoom = <RoomModel>[].obs;
  final selectedRoom = Rxn<RoomModel>();

  final companyName = "".obs;
  final siteName = "".obs;

  DateTime? startDate;
  DateTime? endDate;
  DateFormat formatFilter = DateFormat("yyyy-MM-dd");
  final DashboardMeetingRoomRepository _repository = Get.find();

  final listHeader = <BookingMeetingRoomModel>[].obs;
  final listMappedBooking = <BookingMeetingRoomModel>[].obs;
  final listMappedRoom = <String>[].obs;

  final listAvailableBooking = <BookingMeetingRoomModel>[].obs;
  final listSelectedBooking = <BookingMeetingRoomModel>[].obs;

  final listMap = {}.obs;

  final List<DateTime> _listHours = [
    DateTime.now().copyDateWith(hour: 0, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 0, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 1, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 1, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 2, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 2, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 3, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 3, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 4, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 4, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 5, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 5, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 6, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 6, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 7, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 7, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 8, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 8, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 9, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 9, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 10, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 10, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 11, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 11, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 12, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 12, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 13, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 13, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 14, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 14, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 15, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 15, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 16, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 16, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 17, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 17, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 18, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 18, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 19, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 19, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 20, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 20, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 21, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 21, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 22, minute: 00, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 22, minute: 30, second: 0, millisecond: 0),
    DateTime.now().copyDateWith(hour: 23, minute: 00, second: 0, millisecond: 0),
  ];

  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    listYears.value = Iterable<int>.generate((DateTime.now().year) + 10).skip(2020).toList().reversed.toList();
    generateListOfDates(DateTime.now());
    // getHeader();

    selectedSite.listen((p0) {
      getHeader();
    });

    /*selectedRoom.listen((p0) {
      getHeader();
    });*/

    listMap.listen((p0) {
      setListMappedBooking();
      setListAvailableBooking();
      setListMappedRoom();
    });

    listShowedRoom.listen((p0) {
      populateMapping();
    });

    listHeader.listen((p0) {
      populateMapping();
    });

    selectedDate.listen((p0) {
      getHeader();
      if(p0 != null){
        if(!listYears.contains(p0.year)){
          listYears.add(p0.year);
          listYears.sort((a, b) => b.compareTo(a));
          selectedYear.value = p0.year;
        }
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    selectedMonth.value = DateTime.now().month;
    selectedYear.value = DateTime.now().year;
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

    // onChangeSelectedRoom("");
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
    isLoading(true);

    String date = requestDateFormat.format(selectedDate.value!);
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
        isLoading(false);

    },
      (r) {
        listHeader.clear();
        listHeader.addAll(r);

        populateMapping();
        isLoading(false);
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
          "id_site" : element.idSite,
          "id_company" : element.idCompany,
          "id_meeting_room" : element.id,
          "listBooking" : listHeader.where((e) => e.idMeetingRoom == element.id).toList(),
          "listMappedBooking" : [],
          "listAvailableBooking" : [],
        });
      }
    }

    tempMap.forEach((key, value) {
      List<BookingMeetingRoomModel> tempList = List<BookingMeetingRoomModel>.from(value["listBooking"]);
      List<BookingMeetingRoomModel> tempBookingMeetingRoomList = [];

      List<DateTime> listHours = List<DateTime>.from(_listHours);
      String roomName = value['room_name'];
      dynamic siteId = value['id_site'];
      dynamic companyId = value['id_company'];
      dynamic meetingRoomId = value['id_meeting_room'];
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
          element.isScheduled = true;

          tempBookingMeetingRoomList.add(element);

          //remove from empty schedule
          DateTime newStartTime = DateTime.now().copyDateWith(hour: startHour, minute: startMinute, second: 0);
          DateTime newEndTime = DateTime.now().copyDateWith(hour: endHour, minute: endMinute, second: 0);

          listHours.removeWhere((element){
            return element.isTimeAfter(newStartTime) && element.isTimeBefore(newEndTime, isInclusive: false);
          });
        }
      }


      //prepare data for empty schedule
      List<BookingMeetingRoomModel> tempAvailableBookingList = [];
      listHours.forEach((element) {
        BookingMeetingRoomModel newEmptySchedule = BookingMeetingRoomModel(
          minute: element.minute,
          hour: element.hour,
          durationInMinute: 30,
          title: roomName,
          position: position,
          idSite: siteId,
          idCompany: companyId,
          idMeetingRoom: meetingRoomId,
          isOnlineMeeting: false,
          isScheduled: false,
          startTime: hourMinuteSecondFormat.format(element),
          endTime: hourMinuteSecondFormat.format(element.add(const Duration(minutes: 30)))
        );
        tempAvailableBookingList.add(newEmptySchedule);
      });


      tempMap[key]["listMappedBooking"] = tempBookingMeetingRoomList;
      tempMap[key]["listAvailableBooking"] = tempAvailableBookingList;
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

  void setListAvailableBooking(){
    List<BookingMeetingRoomModel> result = [];
    listAvailableBooking.clear();
    listMap.forEach((key, value) {
      result.addAll(List<BookingMeetingRoomModel>.from(value["listAvailableBooking"]));
    });
    listAvailableBooking.addAll(result);
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
      // onChangeSelectedRoom("");
      _filterMeetingRoom(selected.id.toString());
    }
  }

  void onChangeSelectedRoom(String id) {
    listSelectedRoom.clear();
    listNotSelectedRoom.clear();
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
    listNotSelectedRoom.clear();
    listSelectedRoom.clear();
    if(idSite.isNotEmpty){
      final filtered = await getListMeetingRoomBySiteId(idSite.toInt());
      listRoom.addAll(filtered);
      listShowedRoom.addAll(filtered);
      listNotSelectedRoom.addAll(filtered);
    }
  }

  void generateNextWeek(){
    if(firstDate.value != null){
      generateListOfDates(firstDate.value!.add(const Duration(days: 7)));
    }
  }

  void generatePrevWeek(){
    if(firstDate.value != null){
      generateListOfDates(firstDate.value!.subtract(const Duration(days: 7)));
    }
  }

  void generateListOfDates(DateTime benchmarkDate, {bool firstDateSelected = false}){
    listDate.clear();
    DateTime today = DateTime.now().copyDateWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
    int currentDay = benchmarkDate.weekday;

    firstDate.value = benchmarkDate.subtract(Duration(days: currentDay - 1));
    for(int i = 0; i<7 ; i++){
      listDate.add(firstDate.value!.add(Duration(days: i)).copyDateWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0));
    }

    if(firstDateSelected){
      selectedDate.value = DateTime(benchmarkDate.year, benchmarkDate.month, 1);
    }else{
      if(today.millisecondsSinceEpoch >= listDate.first.millisecondsSinceEpoch && today.millisecondsSinceEpoch <= listDate.last.millisecondsSinceEpoch){
        selectedDate.value = today;
      }else{
        selectedDate.value = listDate.first;
      }
    }

    listDate.refresh();
  }

  void addMeetingRoom(RoomModel roomModel){
    listSelectedRoom.add(listRoom.firstWhere((element) => element.id.toString() == roomModel.id.toString()));

    listNotSelectedRoom.removeWhere((element) => element.id.toString() == roomModel.id.toString());

    listShowedRoom.clear();
    if(listSelectedRoom.isEmpty){
      listShowedRoom.value = List<RoomModel>.from(listRoom);
    }else{
      listShowedRoom.value = List<RoomModel>.from(listSelectedRoom);
    }
  }

  void deleteMeetingRoom(dynamic id) {
    listNotSelectedRoom.add(listSelectedRoom.firstWhere((element) => element.id.toString() == id.toString()));
    listSelectedRoom.removeWhere((element) => element.id.toString() == id.toString());

    listNotSelectedRoom.sort((a, b) => a.id.compareTo(b.id));

    listShowedRoom.clear();
    if(listSelectedRoom.isEmpty){
      listShowedRoom.value = List<RoomModel>.from(listRoom);
    }else{
      listShowedRoom.value = List<RoomModel>.from(listSelectedRoom);
    }
  }

  Future<List<RoomModel>> getRoomByKeyword(String keyword) async{
    List<RoomModel> tempFacility = listNotSelectedRoom.where((element) => element.nameMeetingRoom!.toLowerCase().contains(keyword.toLowerCase())).toList();

    return Future.value(tempFacility);
  }

  void addToSelectedBooking(BookingMeetingRoomModel item){
    listSelectedBooking.add(item);
    listSelectedBooking.sort((a,b) => a.startTime!.toDate(originFormat: "HH:mm:ss")!.isAfter(b.startTime!.toDate(originFormat: "HH:mm:ss")!) ? 1 : -1);
  }

  void removeFromSelectedBooking(BookingMeetingRoomModel item){
    listSelectedBooking.removeWhere((element) => item == element);
  }

  BookingMeetingRoomModel getItem(){
    BookingMeetingRoomModel result = BookingMeetingRoomModel();
    if(listSelectedBooking.length > 1){
      BookingMeetingRoomModel temp = listSelectedBooking[0];
      BookingMeetingRoomModel last = listSelectedBooking[listSelectedBooking.length - 1];

      temp.endTime = last.endTime;
    }else{
      result = listSelectedBooking[0];
    }

    return result;
  }
}