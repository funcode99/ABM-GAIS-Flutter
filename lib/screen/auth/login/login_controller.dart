import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/token.dart' as oauthToken;
import 'package:aad_oauth/model/config.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gais/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:gais/data/model/login_model.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/gais.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/home/home_screen.dart';
import 'package:gais/util/auth/microsoft_auth_util.dart';
import 'package:gais/util/firebase/firebase_util.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class LoginController extends BaseController {
  bool isError = false;
  bool isErrorEmailLogin = false;
  bool isErrorPasswordLogin = false;
  bool isObscurePasswordLogin = true;
  bool isRemember = false;
  bool isLoading = true;

  Widget showIcon = const Icon(
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
    isLoading = true;
    update();
    String? token = await storage.readToken();
    String? role = await storage.readRole();
    debugPrint("token : $token");
    debugPrint("role : $role");
    if (token != null) {
      Get.offAll(const HomeScreen());
    }
    isLoading = false;
    update();
  }

  void setLocalStorage(LoginModel loginModel){

  }
  Future<void> doLogin({bool loginMicrosoft = false, String? accessToken, String? refreshToken, String? email}) async {
    String username = usernameLoginController.text;
    String password = passwordLoginController.text;

    if(loginMicrosoft){
      username = "mssso";
      password = "mssso";
    }

    isLoading = true;
    update();
    try {
      await repository
          .postLogin(username, password, refreshToken: refreshToken, accessToken: accessToken, email: email)
          .then((value) {
            storage.saveToken(value.token?.data?.accessToken ?? "token null");
            storage.saveId(value.users?.id.toString() ?? "");
            storage.saveRole(
              value.users?.idRole.toString() ?? "",
              value.users?.isEmployee.toString() ?? "",
              value.users?.idApprovalAuth.toString() ?? "",
            );
            storage.writeString(StorageCore.roleName, value.users?.roleName ?? "");
            storage.writeString(StorageCore.codeRole, value.users?.codeRole ?? "");
            storage.writeString(StorageCore.companyID, value.users?.idCompany.toString() ?? "");
            storage.writeString(StorageCore.companyName, value.users?.companyName.toString() ?? "");
            storage.writeString(StorageCore.snEmployee, value.users?.snEmployee.toString() ?? "");
            storage.writeString(StorageCore.employeeName, value.users?.employeeName.toString() ?? "");
            storage.writeString(StorageCore.userID, value.users?.idEmployee.toString() ?? "");
            storage.writeString(StorageCore.siteID, value.users?.idSite.toString() ?? "");
            storage.writeString(StorageCore.siteName, value.users?.siteName.toString() ?? "");
            storage.writeString(StorageCore.isEmployee, value.users?.isEmployee.toString() ?? "");
            saveEmployeeInfo();

            //register firebase token
            registerFCMToken();
          })
          .then(
            (_) => Get.showSnackbar(
              const GetSnackBar(
                message: 'Welcome',
                isDismissible: true,
                margin  : EdgeInsets.only(bottom: 55  ),
                duration: Duration(seconds: 3),
                backgroundColor: Colors.green,
                snackPosition: SnackPosition.BOTTOM,
                snackStyle: SnackStyle.FLOATING,
                animationDuration: Duration(milliseconds: 500),
              ),
            ),
          )
          .then((value) => Get.offAll(() => const HomeScreen()));
      isLoading = false;
      update();
    } catch (e, i) {
      isLoading = false;
      update();
      e.printError();
      i.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Username or Password is not valid',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
    debugPrint("role : ${await storage.readRole()}");
    if (await storage.readRole() == "5") {
      // await repository.getEmployeeInfo();
      // saveEmployeeInfo();
    }
    debugPrint("site : ${await const FlutterSecureStorage().read(key: 'site')}");
  }

  Future<void> saveEmployeeInfo() async {
    try {
      await repository.getEmployeeInfo().then((value) {
        debugPrint(value.data?.first.tlkRate?.first.tlk.toString());
        storage.saveUser(
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
          value.data?.first.companyName.toString() ?? "",
          value.data?.first.companyCode.toString() ?? "",
          value.data?.first.idSite.toString() ?? "",
          value.data?.first.siteName.toString() ?? "",
          value.data?.first.siteCode.toString() ?? "",
          value.data?.first.idJobBand.toString() ?? "",
          value.data?.first.bandJobName.toString() ?? "",
          value.data?.first.foto.toString() ?? "",
          value.data?.first.fotoPath.toString() ?? "",
          value.data?.first.flightClass?.first.idFlightClass.toString() ?? "",
          value.data?.first.flightClass?.first.flightClass.toString() ?? "",
          value.data?.first.hotelFare.toString() ?? "",
          value.data?.first.mealsRate.toString() ?? "",
          value.data?.first.idCostCenter.toString() ?? "",
          value.data?.first.tlkRate?.first.tlk.toString() ?? "",
        );
      });
    } catch (e,i) {
      e.printError();
      i.printError();
    }
  }

  Future<void> registerFCMToken()async{
    String? token = await FirebaseUtil.getFCMToken();

    if(token != null){
      return repository.registerFCM(token);
    }

    return Future.value();
  }

  Future<void> loginMicrosoft()async{
    final oauth = MicrosoftAuthUtil().getConfig();

    final result = await oauth.login(refreshIfAvailable: true);
    result.fold(
      (l){
        Get.showSnackbar(CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
        print("ERROR $l");
      },
      (oauthToken.Token r) async{
        print('Logged in successfully');
        final accessToken = r.accessToken;
        final refreshToken = r.refreshToken;

        //get email
        final email = await repository.getEmail(accessToken);
        if(email!=null){
          doLogin(loginMicrosoft: true, accessToken: accessToken, refreshToken: refreshToken, email: email);
        }
      },
    );


  }
}
