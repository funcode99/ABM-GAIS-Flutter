import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialog {
  void show(BuildContext context, [bool mounted = true]) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Loading...')
                ],
              ),
            ),
          );
        });

    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    Get.back();
  }

  void close(BuildContext context) async {
    Get.back();
  }
}
