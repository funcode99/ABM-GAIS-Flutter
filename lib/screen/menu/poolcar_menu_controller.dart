import 'package:gais/base/base_controller.dart';

class PoolcarMenuController extends BaseController {
  bool isAdministrator = false;
  bool isSuperAdmin = false;

  @override
  void onInit() {
    super.onInit();
    cekRole();
  }

  Future<void> cekRole() async {
    isAdministrator = await storage.readRole() == "1"  ? true : false;
    isSuperAdmin = await storage.readRole() == "2" ? true : false;
    update();
  }
}
