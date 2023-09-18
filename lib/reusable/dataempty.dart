import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';

class DataEmpty extends StatelessWidget {
  const DataEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/data_notfound.png",),
            const SizedBox(height: 20),
            Text("Data not Found" , style: appTitle)
          ],
        ),
      ),
    );
  }
}
