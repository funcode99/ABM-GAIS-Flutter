import 'package:flutter/material.dart';

class CustomFormLabel extends StatelessWidget{
  const CustomFormLabel({super.key, required this.label, this.showRequired = false});

  final String label;
  final bool showRequired;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: Theme
            .of(context)
            .textTheme
            .bodyText1
            ?.copyWith(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
        children: <TextSpan>[
          TextSpan(
              text: showRequired ? "*" : "",
              style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

}