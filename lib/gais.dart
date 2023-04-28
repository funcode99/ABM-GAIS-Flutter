import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/screen/auth/login/login_screen.dart';
import 'package:get/get.dart';

class gais extends StatelessWidget {
  const gais({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GAIS ABM',
      theme: ThemeData(
        // useMaterial3: true,
        fontFamily: 'plus jakarta sans',
        // backgroundColor: whiteColor,
        appBarTheme: AppBarTheme(
          backgroundColor: whiteColor,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: whiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: neutralColor,
              width: 1,
              // style: BorderStyle.solid,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: neutralColor,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
