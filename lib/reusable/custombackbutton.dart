import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton<T> extends StatelessWidget {
  const CustomBackButton({Key? key, this.result, this.onPressed}) : super(key: key);

  final T? result;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onPressed ?? Get.back(result: result),
        icon: Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: 30,
        ));
  }
}
