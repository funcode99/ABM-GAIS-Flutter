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
  bool searchNotFound = false;
  String? searchValue = "";
  String? filterValue = "1";
  int currentPage = 1;
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  actual.GetAllActualizationTripModel? actualModel;
  List<actual.Data2> actualList = [];

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchList(1)]);
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
    actualList = [];
    isLoading = true;
    try {
      var actualTrip = await actualizationTrip.getActualTripList(
        "10",
        searchValue.toString(),
        filterValue.toString(),
        page.toString(),
      );
      actualModel = actualTrip;
      actualList.addAll(actualModel?.data?.data?.toSet().toList() ?? []);
      isLoading = false;
      searchNotFound = actualModel?.data?.data?.isEmpty ?? false;
      dataisnull = actualModel?.data?.data?.isEmpty ?? false;
      print("data null $dataisnull");
      print("actual: ${actualModel?.success.toString()}");
      print("actual: ${actualList.first.noAct.toString()}");

    } catch (e, i) {
      dataisnull = true;
      searchNotFound = true;
      isLoading = false;
      i.printError();
      e.printError(info: "=> getError");
    }
    update();
  }
}
