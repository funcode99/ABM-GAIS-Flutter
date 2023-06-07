import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingMeetingRoomListController extends BaseController {
  final TextEditingController dateRange = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateTime? startDate;
  DateTime? endDate;
  String tempSelectedValue = "";
  String selectedValue = "";

  List<BookingMeetingRoomModel> listItem = <BookingMeetingRoomModel>[].obs;

  void applyFilter() {
    selectedValue = tempSelectedValue;
  }

  @override
  void onInit() {
    super.onInit();
    dateRange.text = "10/03/2023 - 17/03/2023";

    for (int i = 1; i <= 10; i++) {
      listItem.add(BookingMeetingRoomModel(
        idRoom: "$i",
        title: "Meet n Greet",
        startDate: "12/12/23",
        endDate: "15/12/23",
        startTime: "09:00",
        endTime: "1:00",
        roomName: "Room Bali 123",
        floor: 4,
        capacity: 100,
        participants: ["John Doe", "Slamet Riyadi"],
        link: "https://meet.google.com",
        remarks: "",
        status: "Booked",
        noBookingRoom: "BMR-ABM/1232/30.$i",
      ));
    }
  }
}
