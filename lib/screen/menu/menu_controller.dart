import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';

class MenuGaisController extends BaseController {
  bool approvalAuth = false;
  bool receptionis = false;

  @override
  void onInit() {
    super.onInit();
    cekRole();
  }

  Future<void> cekRole() async {
    approvalAuth = await storage.readRole() == "1" || await storage.readRole() == "2" || await storage.readRole() == "3" ? true : false;
    receptionis = await storage.readRole() == "4" ? true : false;
    update();
  }
}
