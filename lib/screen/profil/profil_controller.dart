import 'package:gais/base/base_controller.dart';
import 'package:gais/screen/auth/login/login_screen.dart';
import 'package:get/get.dart';

class ProfilController extends BaseController {
  String? userName;
  String? userSN;

  @override
  void onInit() {
    super.onInit();
    fetchList();
  }

  void doLogout() async {
    storage.deleteToken();
    Get.offAll(LoginScreen());
  }

  Future<void> fetchList() async {
    storage.readEmployeeInfo().then((value) {
      userName = value.first.employeeName;
      userSN = value.first.snEmployee;

      update();
    });
  }
}
