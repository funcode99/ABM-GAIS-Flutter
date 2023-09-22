import 'package:gais/base/base_controller.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/screen/auth/login/login_screen.dart';
import 'package:gais/util/auth/microsoft_auth_util.dart';
import 'package:gais/util/firebase/firebase_util.dart';
import 'package:get/get.dart';

class ProfilController extends BaseController {
  final userName = "".obs;
  final userSN = "".obs;
  final image = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchList();
  }

  void doLogout() async {
    try {
      await repository.logout();
      //logout microsoft
      final oauth = MicrosoftAuthUtil().getConfig();
      oauth.logout();
    } catch (e, i) {
      print("LOGOUT ERROR $e");
    }finally{
      //delete FCM TOKEN
      FirebaseUtil.deleteFCMToken();

      storage.deleteToken();
      Get.offAll(const LoginScreen());
    }
  }

  Future<void> fetchList() async {
    String imagePath = await storage.readString(StorageCore.filePath);
    image.value = imagePath;

    storage.readEmployeeInfo().then((value) {
      userName.value = value.first.employeeName ?? "";
      userSN.value = value.first.snEmployee ?? "";
      userSN.value = value.first.snEmployee ?? "";

    });
  }
}
