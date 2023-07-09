import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/master/room/room_model.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/repository/booking_meeting_room/booking_meeting_room_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/fss/booking_meeting_room/detail/detail_booking_meeting_room_screen.dart';
import 'package:gais/util/ext/string_ext.dart';
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
  final TextEditingController siteController = TextEditingController();
  final TextEditingController companyController = TextEditingController();

  late TextEditingController autocompleteController;

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

  final listCompany = <CompanyModel>[].obs;
  final selectedCompany = Rxn<CompanyModel>();

  final listSite = <SiteModel>[].obs;
  final selectedSite = Rxn<SiteModel>();

  final listEmployee = <EmployeeModel>[].obs;
  final selectedEmployee = Rxn<EmployeeModel>();
  final listSelectedEmployee = <EmployeeModel>[].obs;


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

  final listSelectedEmails = <String>[].obs;
  final showParticipantError = false.obs;

  final BookingMeetingRoomRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  initData() async {
    String companyName = await storage.readString(StorageCore.companyName);
    String siteName = await storage.readString(StorageCore.siteName);
    String idSite = await storage.readString(StorageCore.siteID);
    companyController.text = companyName;
    siteController.text = siteName;

    listCompany.add(CompanyModel(id: "", companyName: "Company"));
    final companies = await getListCompany();
    listCompany.addAll(companies);

    listSite.add(SiteModel(id: "", siteName: "Site"));
    final sites = await getListSite();
    listSite.addAll(sites);

    final rooms = await getListRoomBySite(idSite.toInt());
    listRoom.addAll(rooms);
    onChangeSelectedRoom("");

    final employees = await getListEmployee();
    listEmployee.addAll(employees);
  }

  void onChangeSelectedRoom(String id) {
    final selected = listRoom.firstWhere(
        (item) => item.id.toString() == id.toString(),
        orElse: () => listRoom.first);

    selectedRoom(selected);

    if (selected.id != "") {
      floorController.text = selected.floor.toString();
      capacityController.text = selected.capacity.toString();
    } else {
      floorController.text = "";
      capacityController.text = "";
    }
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

  void saveData() async {
    String idCompany = await storage.readString(StorageCore.companyID);
    String idSite = await storage.readString(StorageCore.siteID);

    BookingMeetingRoomModel meetingRoomModel = BookingMeetingRoomModel(
        idCompany: idCompany.toInt(),
        idSite: idSite.toInt(),
        floor: floorController.text.toInt() ?? 0,
        capacity: capacityController.text.toInt() ?? 0,
        title: titleController.text,
        startDate: startDate.toString(),
        endDate: endDate.toString(),
        startTime: startTime.toString(),
        endTime: endTime.toString(),
        idMeetingRoom: selectedRoom.value?.id,
        session: null,
        participant: listSelectedEmployee.map((element) => element.id!).toList().toString(),
        link: linkController.text,
        remarks: remarksController.text);


    final result = await _repository.saveData(meetingRoomModel);

    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (meetingRoomModel) {
      /*Get.off(() => const DetailBookingMeetingRoomScreen(),
          arguments: {"item": meetingRoomModel});*/
          Get.back(result: true);
    });
  }

  void deleteParticipantItem(EmployeeModel item) {
    listSelectedEmployee.removeWhere((element) => item.id == element.id);
  }
}
