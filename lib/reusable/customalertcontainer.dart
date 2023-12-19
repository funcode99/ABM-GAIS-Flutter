import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';

class CustomAlertContainer extends StatelessWidget{
  final Widget content;
  final Color backgroundColor;
  final EdgeInsets? padding;

  const CustomAlertContainer(
      {super.key, required this.content, this.backgroundColor = greenColor,  this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: backgroundColor
      ),
      child: content,
    );
  }
  
}