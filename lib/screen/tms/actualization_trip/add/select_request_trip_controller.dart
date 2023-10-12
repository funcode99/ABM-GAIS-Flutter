import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/request_trip/request_trip_model.dart';
import 'package:gais/data/repository/actualization_trip/new_actualization_trip_repository.dart';
import 'package:get/get.dart';

class SelectRequestTripController extends BaseController {
  final listRequestTrip = <RequestTripModel>[].obs;
  final listIDSelectedRequestTrip = <dynamic>[].obs;

  final NewActualizationTripRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
    listRequestTrip.clear();
    final result = await _repository.getRequestTrip();

    result.fold((l) => null, (r) {
      listRequestTrip.value = r;
    });
  }

  void addSelectedRequestTrip(dynamic id){
    listIDSelectedRequestTrip.add(id);
  }

  void removeSelectedRequestTrip(dynamic id){
    listIDSelectedRequestTrip.removeWhere((element) => element == id);
  }


}
