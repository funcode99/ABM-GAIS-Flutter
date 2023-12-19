import 'dart:io';

import 'package:file_picker/file_picker.dart' as FilePickerPlugin;
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/device_info/device_info_util.dart';
import 'package:gais/util/ext/file_ext.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomFormFilePicker extends StatefulWidget{
  const CustomFormFilePicker({Key? key, this.isRequired = false, this.validator, required this.onFileSelected, required this.label, this.hintText, this.helperText}) : super(key: key);
  final ValueChanged<File> onFileSelected;
  final String label;
  final String? hintText;
  final String? helperText;
  final bool isRequired;
  final FormFieldValidator<String>? validator;

  @override
  State<CustomFormFilePicker> createState() => _CustomFormFilePickerState();
}

class _CustomFormFilePickerState extends State<CustomFormFilePicker> {
  final TextEditingController controller = TextEditingController();

  File? _selectedFile;

  _selectFile()async{
    FilePickerPlugin.FilePickerResult? result;
    if(Platform.isIOS){
      await showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text(
                    'Choose Image',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  leading: const Icon(Icons.image),
                  onTap: () async {
                    Get.back();
                    result = await FilePickerPlugin.FilePicker.platform.pickFiles(
                      type: FilePickerPlugin.FileType.image,
                    );

                    _processFile(result);
                  },
                ),
                ListTile(
                  title: const Text(
                    'Choose File',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  leading: const Icon(Icons.file_copy),
                  onTap: () async {
                    Get.back();
                    result = await FilePickerPlugin.FilePicker.platform.pickFiles(
                      allowedExtensions: ['pdf', 'doc', 'docx'],
                      type: FilePickerPlugin.FileType.custom,
                    );
                    _processFile(result);
                  },
                )
              ],
            ),
          ));
    }else{
      result = await FilePickerPlugin.FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf', 'doc', 'docx', 'png', 'jpg', 'jpeg'],
        type: FilePickerPlugin.FileType.custom,
      );
      _processFile(result);
    }
  }

  _processFile(FilePickerPlugin.FilePickerResult? result){
    if (result != null) {
      File file = File(result.files.single.path!);
      setState((){
        _selectedFile = file;
      });
      controller.text = _selectedFile!.filename();
      widget.onFileSelected(file);
    } else {
      // User canceled the picker
      Get.showSnackbar(CustomGetSnackBar(message: "Select file cancelled", backgroundColor: Colors.red));
    }
  }

  _checkPermission()async{
    PermissionStatus status;
    status = await Permission.storage.status;

    if (status.isGranted) {
      _selectFile();
    }else{
      PermissionStatus request;
      request = await Permission.storage.request();

      if(Platform.isAndroid){

        int? androidOS = await DeviceInfoUtil.androidOS() ?? 0;

        if (androidOS >= 33) {
          request = await Permission.manageExternalStorage.request();
        }
      }

      if(request.isGranted){
        _selectFile();
      }else{
        if(request.isPermanentlyDenied){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                title: const Text("Permission error!"),
                content: const Text(
                  "Read External Storage permission is required to select files.",
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text("Cancel"),
                    onPressed:  () {
                      Navigator.of(context).pop();
                      if(mounted){
                        Get.showSnackbar(CustomGetSnackBar(message: "Select file failed because permissions were not granted", backgroundColor: Colors.red));
                      }
                    },
                  ),
                  TextButton(
                    child: const Text("Open Settings"),
                    onPressed:  (){
                      openAppSettings();
                    },
                  ),
                ],
              )
          );
        }else{
          if(mounted){
            Get.showSnackbar(CustomGetSnackBar(message: "Select file failed because permissions were not granted", backgroundColor: Colors.red));
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.label,
            style: formlabelTextStyle,
            children: <TextSpan>[
              TextSpan(
                  text: widget.isRequired ? "*" : "",
                  style: const TextStyle(color: Colors.red)),
            ],
          ),
        ),
        SizedBox(
          height: widget.helperText != null ? 16 : 8,
        ),
        widget.helperText != null ?
        Text(
            widget.helperText ?? ""
        ) : const SizedBox(),
        SizedBox(
          height: widget.helperText != null ? 16 : 0,
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            onTap: (){
              _checkPermission();
            },
            minLines: 1,
            maxLines : 3,
            readOnly: true,
            enabled: true,
            controller: controller,
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontSize: 16,
              color: Colors.black,
              // fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
                fillColor: whiteColor,
                suffixIcon: const Icon(Icons.upload),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                hintText: widget.hintText ?? widget.label,
                hintStyle: hintTextStyle),
          ),
        ),
      ],
    );
  }
}
