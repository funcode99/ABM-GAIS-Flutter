import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:gais/screen/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class LoginController extends BaseController {
  bool isError = false;
  bool isErrorEmailLogin = false;
  bool isErrorPasswordLogin = false;
  bool isObscurePasswordLogin = true;
  bool isRemember = false;

  Widget showIcon = Icon(
    IconlyBold.show,
    color: Colors.black,
  );

  final formKey = GlobalKey<FormState>();
  final usernameLoginController = TextEditingController();
  final passwordLoginController = TextEditingController();

  @override
  void onInit() {
    cekToken();
    usernameLoginController.text;
    passwordLoginController.text;
    super.onInit();
  }

  @override
  void dispose() {
    usernameLoginController.dispose();
    passwordLoginController.dispose();
    super.dispose();
  }

  Future cekToken() async {
    print("token : ${await FlutterSecureStorage().read(key: "token")}");
    print("role : ${await FlutterSecureStorage().read(key: "role")}");
    if (await storage.readToken()!=null) {
      Get.offAll(HomeScreen());
    }
  }

  Future<void> doLogin() async {
    try {
      await repository
          .postLogin(usernameLoginController.text, passwordLoginController.text)
          .then((value) => storage.saveToken(value.data?.accessToken ?? ""))
          .then((value) => storage.saveRole("admin"))
          .then(
            (_) => Get.showSnackbar(
              const GetSnackBar(
                message: 'Login Berhasil',
                isDismissible: true,
                duration: Duration(seconds: 3),
                backgroundColor: Colors.green,
              ),
            ),
          )
          .then((value) => Get.offAll(() => const HomeScreen()));
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Login Gagal',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
