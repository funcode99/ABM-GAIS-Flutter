import 'package:gais/base/base_controller.dart';
import 'package:gais/screen/auth/login/login_screen.dart';
import 'package:get/get.dart';

class ProfilController extends BaseController{

  void doLogout() async{
    storage.deleteToken();
    Get.offAll(LoginScreen());
  }
}