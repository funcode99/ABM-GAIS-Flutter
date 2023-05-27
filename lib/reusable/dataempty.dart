import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:get/get.dart';

class DataEmpty extends StatelessWidget {
  const DataEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        width: Get.width,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/data_notfound.png"),
            SizedBox(height: 20),
            Text("Data Empty", style: appTitle)
          ],
        ),
      ),
    );
  }
}
