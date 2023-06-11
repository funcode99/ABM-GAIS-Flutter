import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/master/room/room_model.dart';
import 'package:gais/screen/fss/booking_meeting_room/detail/detail_booking_meeting_room_screen.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddBookingMeetingRoomController extends BaseController
    with MasterDataMixin {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController meetingRoomController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController participantController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  TextfieldTagsController textfieldTagsController = TextfieldTagsController();
  final formKey = GlobalKey<FormState>();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();

  final startTime = Rxn<DateTime>();
  final endTime = Rxn<DateTime>();

  final enableButton = false.obs;

  final listRoom = <RoomModel>[].obs;
  final selectedRoom = Rxn<RoomModel>();

  final List<String> emails = [
    "Kaitlyn Beck",
    "Eduardo Pearson",
    "Kiara Hendricks",
    "Dash Lawson",
    "Phoebe Miranda",
    "Rory Dejesus",
    "Julissa Macdonald",
    "Hugh Bond",
    "Alena Stein",
    "Creed Garner",
    "Jacqueline Harrington",
    "Omari Stafford",
    "Bridget Ortega",
    "Kobe Owens",
    "Amaya Lim",
    "Cal Hammond",
    "Holly Rosas",
    "Remi Gillespie",
    "Alianna Vazquez",
    "Jesse Sherman",
    "Addilyn Daniel",
    "Grady Abbott",
    "Melany Reynolds",
    "Vincent Erickson",
    "Sabrina Orozco",
    "Keanu Mann",
    "Paislee Madden",
    "Everest Cuevas",
    "Adele Bryant",
    "Jonah Branch",
    "Luisa Cisneros",
    "Alden Barber",
    "Cassidy Rasmussen",
    "Will Rosario",
    "Louisa Blake",
    "Zyaire Norman",
    "Malani Barry",
  ];

  @override
  void onInit() {
    super.onInit();
    final temp = <RoomModel>[];
    temp.add(
      RoomModel(
          id: "",
          capacity: 0,
          floor: 0,
          roomName: "Meeting Room"
      )
    );
    for (int i = 0; i<10; i++){
      temp.add(
        RoomModel(
          id: i,
          capacity: (i + 1) * 10,
          floor: i + 1,
          roomName: "Room Number $i"
        )
      );
    }
    listRoom.addAll(temp);
    onChangeSelectedRoom("");
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onChangeSelectedRoom(String id) {
    final selected = listRoom.firstWhere(
            (item) => item.id.toString() == id.toString(),
        orElse: () => listRoom.first);

    selectedRoom(selected);

    if(selected.id != ""){
      floorController.text = selected.floor.toString();
      capacityController.text = selected.capacity.toString();
    }else{
      floorController.text = "";
      capacityController.text = "";
    }
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

  void saveData(){
    BookingMeetingRoomModel meetingRoomModel = BookingMeetingRoomModel(
        title: titleController.text,
        startDate: startDate.toString(),
        endDate: endDate.toString(),
        startTime: startTime.toString(),
        endTime: endTime.toString(),
        idRoom: selectedRoom.value?.id.toString(),
        roomName: selectedRoom.value?.roomName.toString(),
        participants: textfieldTagsController.getTags!,
        link: linkController.text,
        remarks: remarksController.text,
        createdAt: "2023-06-12",
        employeeName: "John Doe",
      codeStatusDoc: "0",
      noBookingRoom: "NOMOR BOOKING ROOM",
      status: "Draft"
    );

    Get.off(() => const DetailBookingMeetingRoomScreen(), arguments: {
      "item" : meetingRoomModel
    });

  }
}
