import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/reusable/customalertcontainer.dart';

class CustomStatusContainer extends StatelessWidget{

  final String status;
  final Color backgroundColor;

  const CustomStatusContainer({super.key, required this.status, this.backgroundColor = greenColor});

  @override
  Widget build(BuildContext context) {
    return CustomAlertContainer(
      content: Text(
        status,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 12),
      ),
      backgroundColor: backgroundColor,
    );
  }

}