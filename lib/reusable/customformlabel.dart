import 'package:flutter/material.dart';
import 'package:gais/const/textstyle.dart';

class CustomFormLabel extends StatelessWidget{
  const CustomFormLabel({super.key, required this.label, this.showRequired = false});

  final String label;
  final bool showRequired;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: formlabelTextStyle,
        children: <TextSpan>[
          TextSpan(
              text: showRequired ? "*" : "",
              style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

}