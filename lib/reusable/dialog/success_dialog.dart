import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:get/get.dart';

class SuccessDialog extends StatelessWidget {
  final String message;
  final VoidCallback onClosePressed;

  const SuccessDialog(
      {super.key, required this.message, required this.onClosePressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Icon(
                Icons.check_circle_outline,
                color: successColor,
                size: 32,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: listTitleTextStyle.copyWith(
                  fontSize: 20
                ),
              ),
              const SizedBox(
                height:64,
              ),
              ElevatedButton(
                onPressed: onClosePressed,
                style: ElevatedButton.styleFrom(backgroundColor: infoColor),
                child: Text("Close".tr),
              )
            ],
          ),
        ),
      ),
    );
  }
}
