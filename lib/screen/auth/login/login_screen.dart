import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/auth/forgotpassword/forgot_password_screen.dart';
import 'package:gais/screen/auth/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: TopBar(
              title: Image.asset("assets/img/abm.png"),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset("assets/img/login.png"),
                        Form(
                          key: controller.formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Login",
                                  style: titleTextStyle,
                                ),
                                const SizedBox(height: 25),
                                RichText(
                                  text: TextSpan(
                                    text: 'Username ',
                                    style: formlabelTextStyle,
                                    children: const <TextSpan>[
                                      TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                ),
                                TextFormField(
                                  controller: controller.usernameLoginController,
                                  decoration: InputDecoration(hintText: "Input Username", hintStyle: hintTextStyle),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Username tidak boleh kosong";
                                    }
                                  },
                                ),
                                const SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    text: 'Password ',
                                    style: formlabelTextStyle,
                                    children: const <TextSpan>[
                                      TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                ),
                                TextFormField(
                                  controller: controller.passwordLoginController,
                                  obscureText: controller.isObscurePasswordLogin,
                                  decoration: InputDecoration(
                                      hintText: "Input Password",
                                      hintStyle: hintTextStyle,
                                      suffixIcon: IconButton(
                                        icon: controller.showIcon,
                                        onPressed: () {
                                          controller.isObscurePasswordLogin
                                              ? controller.isObscurePasswordLogin = false
                                              : controller.isObscurePasswordLogin = true;
                                          controller.isObscurePasswordLogin != false
                                              ? controller.showIcon = const Icon(
                                                  IconlyBold.show,
                                                  color: Colors.black,
                                                )
                                              : controller.showIcon = const Icon(
                                                  IconlyBold.hide,
                                                  color: Colors.black,
                                                );
                                          controller.update();
                                        },
                                      )),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Username tidak boleh kosong";
                                    }
                                  },
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () => Get.to(const ForgotPasswordScreen()),
                                    child: Text("Forgot Password?",
                                        style: listTitleTextStyle.copyWith(color: infoColor, decoration: TextDecoration.underline)),
                                  ),
                                ),
                                CustomFilledButton(
                                  color: infoColor,
                                  title: 'Login',
                                  onPressed: () async {
                                    if (controller.formKey.currentState?.validate() == true) controller.doLogin();
                                  },
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text("OR", style: listTitleTextStyle),
                                ),
                                CustomFilledButton(
                                  color: infoColor, title: "Login via Falcon",
                                  onPressed: ()async{
                                    controller.loginMicrosoft();
                                  },
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                controller.isLoading==true
                    ? Container(
                        decoration: BoxDecoration(color: greyColor.withOpacity(0.5)),
                        child: const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        });
  }
}
