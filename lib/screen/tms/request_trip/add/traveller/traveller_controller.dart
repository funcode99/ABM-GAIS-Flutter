import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';

class AirlinesController extends BaseController {
  int purposeID = Get.arguments['purposeID'] ?? 0;
  int? travellerID;
  String? travellerName;
  String? travellerSN;
  String? travellerGender;

  @override
  void onInit() {
    super.onInit();
    Future.wait([
      getTravellerInfo(),
    ]);
  }

  Future<void> getTravellerInfo() async {
    await storage.readEmployeeInfo().then((value) {
      print(value);
      travellerID = int.parse(value[0]);
      travellerName = value[1];
      travellerSN = value[3];
      travellerGender = value[9];
    });

    update();
  }
}
