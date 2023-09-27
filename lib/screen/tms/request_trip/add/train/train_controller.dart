import 'package:gais/base/base_controller.dart';
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/taxi_voucher_screen.dart';
import 'package:get/get.dart';

class TrainController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];

  List trainList = [];

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getList() async {}

  Future<void> delete(String id) async {}

  void next() {
    if (formEdit == true) {
      Get.back();
    } else {
      Get.to(const TaxiVoucherScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument});
    }
  }
}
