import 'package:flutter/material.dart';
import 'package:gais/const/textstyle.dart';
import 'package:get/get.dart';

class EmptyListError extends StatelessWidget{
  const EmptyListError({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Empty List".tr,
          style: titleTextStyle,
        )
      ],
    );
  }

}