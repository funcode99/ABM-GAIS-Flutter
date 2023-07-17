import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/master/status_doc/status_doc_model.dart';
import 'package:gais/data/model/meeting_room_used.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/data/model/supplies_out_model.dart';
import 'package:gais/data/model/trip_purpose_model.dart';
import 'package:gais/data/repository/request_atk/request_atk_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardController extends BaseController with MasterDataMixin{
  final TextEditingController dateRangeController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat formatFilter = DateFormat("yyyy-MM-dd");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();
  final startDateTemp = Rxn<DateTime>();
  final endDateTemp = Rxn<DateTime>();
  final selectedStatus = Rxn<StatusDocModel>();
  final selectedStatusTemp = Rxn<StatusDocModel>();

  final keyword = "".obs;

  final listHeader = <RequestAtkModel>[].obs;
  final listStatus = <StatusDocModel>[].obs;
  final RequestATKRepository _repository = Get.find();
  late PaginationModel? paginationModel;
  final totalPage = 1.obs;
  final currentPage = 1.obs;
  int limit = 10;

  late List listdates = [];
  late List listyears = [];

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

  List<TripPurposeModel> tpData = [
    TripPurposeModel('Company\nBusiness', 15, brownColor),
    TripPurposeModel('Field Break', 2, infoColor),
    TripPurposeModel('Site Visit', 3, successColor),
    TripPurposeModel('Taxi Voucher Only', 1, warningColor),
    TripPurposeModel('Taxi Voucher Only', 1, warningColor),
  ];

  List<MeetRoomUsedModel> mrData = [
    MeetRoomUsedModel("Room 999", 4, Color(0xffFFCC06)),
    MeetRoomUsedModel("Room ABC", 8, Color(0xff6B95D2)),
    MeetRoomUsedModel("Room 123", 10, Color(0xffC4E87D)),
    MeetRoomUsedModel("Room A", 2, Color(0xffE0F1E3)),
  ];

  List<SuppliesOutModel> soData = [
    SuppliesOutModel("Paper Clip", 4, Color(0xff5B9BD5)),
    SuppliesOutModel("Pen", 6, Color(0xff66AD2D)),
    SuppliesOutModel("Pencil", 12, Color(0xffED7D31)),
  ];


  @override
  void onInit() {
    super.onInit();

    listyears =
        Iterable<int>.generate((DateTime.now().year) + 1)
            .skip(1900)
            .toList()
            .reversed
            .toList();
  }

  @override
  void onReady() {
    super.onReady();
  }


}
