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
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/data_notfound.png",),
            SizedBox(height: 20),
            Text("Data not Found" , style: appTitle)
          ],
        ),
      ),
    );
  }
}
