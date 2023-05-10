import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';

class MenuGaisController extends BaseController {
  bool approvalAuth = false;

  @override
  void onInit() {
    super.onInit();
    cekRole();
  }

  Future<void> cekRole() async {
    approvalAuth = await storage.readRole() != "1" ? true : false;
    update();
    print("approval : $approvalAuth");
  }
}
