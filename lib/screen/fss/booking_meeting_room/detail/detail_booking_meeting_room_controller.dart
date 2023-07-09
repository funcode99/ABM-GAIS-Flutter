import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/booking_meeting_room/participant_model.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:gais/data/model/master/brand/brand_model.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/master/room/room_model.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/model/master/uom/uom_model.dart';
import 'package:gais/data/model/master/warehouse/warehouse_model.dart';
import 'package:gais/data/repository/booking_meeting_room/booking_meeting_room_repository.dart';
import 'package:gais/data/repository/management_item_atk/management_item_atk_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:textfield_tags/textfield_tags.dart';

class DetailBookingMeetingRoomController extends BaseController
    with MasterDataMixin {
  final TextEditingController createdAtController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
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

  final onEdit = false.obs;

  final listRoom = <RoomModel>[].obs;
  final selectedRoom = Rxn<RoomModel>();

  final listCompany = <CompanyModel>[].obs;
  final selectedCompany = Rxn<CompanyModel>();

  final listSite = <SiteModel>[].obs;
  final selectedSite = Rxn<SiteModel>();

  final listEmployee = <EmployeeModel>[].obs;
  final selectedEmployee = Rxn<EmployeeModel>();
  final listSelectedEmployee = <EmployeeModel>[].obs;

  final selectedItem = BookingMeetingRoomModel().obs;

  final BookingMeetingRoomRepository _repository = Get.find();

  final showParticipantError = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
    detailHeader();
  }

  void initData()async{
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

    setValue();
  }

  void setValue() {
    createdByController.text = selectedItem.value.employeeName ?? "-";
    createdAtController.text = selectedItem.value.createdAt?.toDateFormat(
        originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yy") ??
        "-";
    titleController.text = selectedItem.value.title ?? "";
    dateController.text = "${selectedItem.value.startDate?.toDateFormat(targetFormat: "dd/MM/yyyy", originFormat: "yyyy-MM-dd HH:mm:ss")} - ${selectedItem.value.endDate?.toDateFormat(targetFormat: "dd/MM/yyyy", originFormat: "yyyy-MM-dd HH:mm:ss")}";
    timeController.text = "${selectedItem.value.endTime?.toDateFormat(targetFormat: "HH:mm", originFormat: "yyyy-MM-dd HH:mm:ss")} - ${selectedItem.value.endTime?.toDateFormat(targetFormat: "HH:mm", originFormat: "yyyy-MM-dd HH:mm:ss")}";
    linkController.text = selectedItem.value.link ?? "";
    remarksController.text = selectedItem.value.remarks ?? "";
    meetingRoomController.text = selectedItem.value.nameMeetingRoom ?? "";

    listSelectedEmployee.clear();
    for(ParticipantModel item in selectedItem.value.participantArray!){
      listSelectedEmployee.add(EmployeeModel(id: item.idEmployee, employeeName: item.employeeName, email: item.email));
    }

  }

  void detailHeader() async {
    final result = await _repository.detailData(selectedItem.value.id!);

    result.fold((l) {
      print("ERROR DETAIL HEADER ${l.message}");
    }, (r) {
      selectedItem(r);
      setValue();
    });
  }

  /*void submitHeader() async {
    final result = await _repository.submitData(selectedItem.value.id!);
    result.fold(
            (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
            (cashAdvanceModel) {
          detailHeader();
        });
  }*/

  void onChangeSelectedRoom(String id) {
    final selected = listRoom.firstWhere(
            (item) => item.id.toString() == id.toString(),
        orElse: () => listRoom.first);

    selectedRoom(selected);

    if(selected.id != ""){
      floorController.text = selected.floor.toString();
      capacityController.text = selected.capacity.toString();
      meetingRoomController.text = selected.nameMeetingRoom.toString();
    }else{
      floorController.text = "";
      capacityController.text = "";
      meetingRoomController.text = "";
    }
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

  void updateOnEdit() {
    onEdit(!onEdit.value);
  }

  void deleteParticipantItem(EmployeeModel item){
    listSelectedEmployee.removeWhere((element) => item.id == element.id);
  }

}
