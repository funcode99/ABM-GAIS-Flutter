import 'package:flutter/material.dart';
import 'package:gais/screen/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:gais/const/color.dart';
import 'package:gais/screen/auth/login/login_screen.dart';

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
        backgroundColor: baseColor,
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
      home: const HomeScreen(),
    );
  }
}
