import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/device_info/device_info_util.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as ImagePickerPlugin;
import 'package:permission_handler/permission_handler.dart';

class ImageUtil{
  final ImagePickerPlugin.ImagePicker _picker = ImagePickerPlugin.ImagePicker();
  File? result;

  Future<File?> selectImageFromGallery()async{

    PermissionStatus status;
    status = await Permission.photos.status;

    if(Platform.isAndroid){
      int? androidOS = await DeviceInfoUtil.androidOS() ?? 0;
      if (androidOS < 33) {
        status = await Permission.storage.status;
      }
    }

    if (status.isGranted) {
      return _selectFromGallery();
    } else {
      PermissionStatus request;
      request = await Permission.photos.request();
      if(Platform.isAndroid){
        int? androidOS = await DeviceInfoUtil.androidOS() ?? 0;
        if (androidOS < 33) {
          request = await Permission.storage.request();
        }
      }

      if (request.isGranted) {
        return _selectFromGallery();
      } else {
        if (request.isPermanentlyDenied) {
          Get.dialog(
            AlertDialog(
              title: const Text("Permission error!"),
              content: const Text(
                "Permission Storage needeed for choosing File.",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    Get.back();
                    Get.showSnackbar(CustomGetSnackBar(
                        message:
                        "Permission not granted, failed to choose file",
                        backgroundColor: Colors.red));
                  },
                ),
                TextButton(
                  child: const Text("Open Settings"),
                  onPressed: () {
                    openAppSettings();
                  },
                ),
              ],
            ),
            barrierDismissible: false,

          );
        } else {
          Get.showSnackbar(CustomGetSnackBar(
              message: "Permission not granted, failed to choose file",
              backgroundColor: Colors.red));
        }
      }
    }

    return Future.value(null);
  }

  Future<File?> _selectFromGallery() async {
    final ImagePickerPlugin.XFile? image = await _picker.pickImage(source: ImagePickerPlugin.ImageSource.gallery);
    if(image != null){
      return Future.value(File(image.path));
    }

    return Future.value(null);
  }

  Future<File?> selectImageFromCamera()async{
    var status = await Permission.camera.status;
    if (status.isGranted) {
      return _selectFromCamera();
    } else {
      var request = await Permission.camera.request();
      if (request.isGranted) {
        return _selectFromCamera();
      } else {
        if (request.isPermanentlyDenied) {
          Get.dialog(
              AlertDialog(
                title: const Text("Permission error!"),
                content: const Text(
                  "Permission Camera needed for choosing Image",
                  style: TextStyle(color: Colors.black),
                ),
                actions: [
                  TextButton(
                    child: const Text("Cancel"),
                    onPressed: () {
                      Get.back();
                      Get.showSnackbar(CustomGetSnackBar(
                          message:
                          "Permission not granted, failed to choose Image",
                          backgroundColor: Colors.red));
                    },
                  ),
                  TextButton(
                    child: const Text("Open Settings"),
                    onPressed: () {
                      openAppSettings();
                    },
                  ),
                ],
              ),
              barrierDismissible: false
          );
        } else {
          Get.showSnackbar(CustomGetSnackBar(
              message: "Permission not granted, failed to choose file",
              backgroundColor: Colors.red));
        }
      }
    }

    return Future.value(null);

  }
  Future<File?> _selectFromCamera() async {
    final ImagePickerPlugin.XFile? image = await _picker.pickImage(source: ImagePickerPlugin.ImageSource.camera);
    if(image != null){
      return Future.value(File(image.path));
    }

    return Future.value(null);
  }

}