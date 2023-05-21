import 'package:flutter/material.dart';
import 'package:get/get.dart';

GetSnackBar CustomGetSnackBar({required String message, Duration? duration, Color? backgroundColor}){
  return GetSnackBar(
    message: message,
    isDismissible: true,
    duration: duration ?? const Duration(milliseconds: 1500),
    backgroundColor: backgroundColor ?? Colors.green,
  );
}

