import 'dart:io';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/device_info/device_info_util.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as ImagePickerPlugin;

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({Key? key, this.onImageSelected, this.initialValue})
      : super(key: key);

  final ValueChanged<File?>? onImageSelected;
  final String? initialValue;

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  final ImagePickerPlugin.ImagePicker _picker = ImagePickerPlugin.ImagePicker();
  File? _selectedImage;

  _selectFromGallery() async {
    final ImagePickerPlugin.XFile? image =
        await _picker.pickImage(source: ImagePickerPlugin.ImageSource.gallery);
    _returnImageResult(image);
  }

  _selectFromCamera() async {
    final ImagePickerPlugin.XFile? image =
        await _picker.pickImage(source: ImagePickerPlugin.ImageSource.camera);
    _returnImageResult(image);
  }

  _returnImageResult(ImagePickerPlugin.XFile? image) {
    File? result;
    if (image != null) {
      result = File(image.path);

      setState(() {
        _selectedImage = result;
      });
      Navigator.pop(context);
    }
    widget.onImageSelected!(result);
  }

  _checkStoragePermission() async {
    int? androidOS = await DeviceInfoUtil.androidOS() ?? 0;
    PermissionStatus status;
    if (androidOS < 13) {
      status = await Permission.storage.status;
    } else {
      status = await Permission.photos.status;
    }
    if (status.isGranted) {
      _selectFromGallery();
    } else {
      PermissionStatus request;
      if (androidOS < 13) {
        request = await Permission.storage.request();
      } else {
        request = await Permission.photos.request();
      }
      if (request.isGranted) {
        _selectFromGallery();
      } else {
        if (request.isPermanentlyDenied) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                    title: const Text("Permission error!"),
                    content: const Text(
                      "Permission Storage needeed for choosing File.",
                      style: TextStyle(color: Colors.black),
                    ),
                    actions: [
                      TextButton(
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (mounted) {
                            Get.showSnackbar(CustomGetSnackBar(
                                message:
                                    "Permission not granted, failed to choose file",
                                backgroundColor: Colors.red));
                          }
                        },
                      ),
                      TextButton(
                        child: const Text("Open Settings"),
                        onPressed: () {
                          openAppSettings();
                        },
                      ),
                    ],
                  ));
        } else {
          if (mounted) {
            Get.showSnackbar(CustomGetSnackBar(
                message: "Permission not granted, failed to choose file",
                backgroundColor: Colors.red));
          }
        }
      }
    }
  }

  _checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      _selectFromCamera();
    } else {
      var request = await Permission.storage.request();
      if (request.isGranted) {
        _selectFromCamera();
      } else {
        if (request.isPermanentlyDenied) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                    title: const Text("Permission error!"),
                    content: const Text(
                      "Permission Camera needed for choosing File",
                      style: TextStyle(color: Colors.black),
                    ),
                    actions: [
                      TextButton(
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (mounted) {
                            Get.showSnackbar(CustomGetSnackBar(
                                message:
                                    "Permission not granted, failed to choose file",
                                backgroundColor: Colors.red));
                          }
                        },
                      ),
                      TextButton(
                        child: const Text("Open Settings"),
                        onPressed: () {
                          openAppSettings();
                        },
                      ),
                    ],
                  ));
        } else {
          if (mounted) {
            Get.showSnackbar(CustomGetSnackBar(
                message: "Permission not granted, failed to choose file",
                backgroundColor: Colors.red));
          }
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      File file = File(widget.initialValue!);
      if (file != null) {
        setState(() {
          _selectedImage = file;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () async {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text(
                            'Choose from gallery',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          leading: const Icon(Icons.image),
                          onTap: () async {
                            _checkStoragePermission();
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Choose from camera',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          leading: const Icon(Icons.camera_alt),
                          onTap: () async {
                            _checkCameraPermission();
                          },
                        )
                      ],
                    ),
                  ));
        },
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(10)),
              color: infoColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.image,
                color: Colors.white,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(
                  _selectedImage != null ? 'Change Image' : 'Take Image',
                  style: listSubTitleTextStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              _selectedImage != null
                  ? Image.file(
                      _selectedImage!,
                      height: 50,
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
