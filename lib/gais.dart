import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/screen/auth/login/login_screen.dart';
import 'package:gais/util/lang/app_translation.dart';
import 'package:get/get.dart';

class gais extends StatelessWidget {
  const gais({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String env = FlavorConfig.instance.name ?? "prod";
    if (env == "DEV" || env == "STG") {
      return const FlavorBanner(
        location: BannerLocation.topEnd,
        child: App(),
      );
    }

    return const App();
  }
}

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslation(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("en", "US"),
      debugShowCheckedModeBanner: false,
      title: 'GAIS ABM',
      theme: ThemeData(
        // useMaterial3: true,
          fontFamily: 'plus jakarta sans',
          backgroundColor: baseColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: whiteColor,
            elevation: 0,
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: whiteColor,
            labelStyle: hintTextStyle.copyWith(color: blackColor),
            hintStyle: hintTextStyle,
            contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
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
                color: Colors.black,
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
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                minimumSize: const Size(100, 40),
                side: const BorderSide(color: infoColor),
                foregroundColor: infoColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16
                )
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(const Size(100, 40)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return 0;
                    }
                    return 0; // Defer to the widget's default.
                  },
                ),
                textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16))),

          )
      ),
      home: const LoginScreen(),
    );
  }

}