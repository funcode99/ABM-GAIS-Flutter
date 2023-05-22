import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:gais/data/model/login_model.dart';
import 'package:gais/data/storage_core.dart';
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

  LoginModel? loginModel;

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
    print("token : ${await storage.readToken()}");
    print("role : ${await storage.readRole()}");
    if (await storage.readToken() != null) {
      Get.offAll(HomeScreen());
    }
  }

  Future<void> doLogin() async {
    try {
      await repository
          .postLogin(usernameLoginController.text, passwordLoginController.text)
          .then((value) {
            storage.saveToken(value.token?.data?.accessToken ?? "token null");
            storage.saveId(value.users?.id.toString() ?? "");
            storage.saveRole(
              value.users?.idRole.toString() ?? "",
              value.users?.isEmployee.toString() ?? "",
              value.users?.idApprovalAuth.toString() ?? "",
            );
          })
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
          .then((value) async {
            Get.offAll(() => const HomeScreen());
            String? role = await storage.readRole();
            print("role : $role-");
            if (role == "1") {
              // await repository.getEmployeeInfo();
              saveEmployeeInfo();
            }
            print("site : ${await FlutterSecureStorage().read(key: 'site')}");
          });
    } catch (e) {
      print(e);
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

  Future<void> saveEmployeeInfo() async {
    try {
      await repository.getEmployeeInfo().then(
            (value) => storage.saveUser(
              value.data?.first.id.toString() ?? "",
              value.data?.first.employeeName ?? "",
              value.data?.first.phoneNumber ?? "",
              value.data?.first.snEmployee ?? "",
              value.data?.first.email ?? "",
              value.data?.first.nik ?? "",
              value.data?.first.dob ?? "",
              value.data?.first.startDate ?? "",
              value.data?.first.endDate ?? "",
              value.data?.first.jenkel ?? "",
              value.data?.first.idDepartment.toString() ?? "",
              value.data?.first.idCompany.toString() ?? "",
              value.data?.first.idSite.toString() ?? "",
              value.data?.first.siteName.toString() ?? "",
              value.data?.first.employeeName.toString() ?? "",
              value.data?.first.companyName.toString() ?? "",
              value.data?.first.siteName.toString() ?? "",
            ),
          );
    } catch (e) {
      print(e);
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'gagal load data employee',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
