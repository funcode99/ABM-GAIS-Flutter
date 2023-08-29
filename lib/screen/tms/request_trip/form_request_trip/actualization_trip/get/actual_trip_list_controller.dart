import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/actualization_trip/get_all_actualization_trip_model.dart' as actual;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActualTripListController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController dateRange = TextEditingController();
  final keyword = "".obs;

  bool dataisnull = false;
  bool isLoading = false;
  String? searchValue;
  String? filterValue;
  int currentPage = 1;
  DateFormat dateFormat = DateFormat("MM/dd/yyyy");

  actual.GetAllActualizationTripModel? actualModel;
  List<actual.Data2> actualList = [];

  @override
  void onInit() {
    super.onInit();
  }

  void resetFilter() {
    formKey.currentState?.reset();
    filterValue = "All";
    dateRange.text = "";
    update();
  }

  void clearSearch(String search) {
    keyword(search);
    currentPage = 1;
    fetchList(1);
    update();
  }

  Future<void> fetchList(int page) async {
    try {} catch (e) {
      e.printError();
    }
  }
}
