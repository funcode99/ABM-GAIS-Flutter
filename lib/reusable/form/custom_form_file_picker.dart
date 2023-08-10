import 'dart:io';

import 'package:file_picker/file_picker.dart' as FilePickerPlugin;
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/util/device_info/device_info_util.dart';
import 'package:gais/util/ext/file_ext.dart';
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
    FilePickerPlugin.FilePickerResult? result = await FilePickerPlugin.FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf', 'doc', 'docx', 'png', 'jpg', 'jpeg'],
      type: FilePickerPlugin.FileType.custom,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      setState((){
        _selectedFile = file;
      });
      controller.text = _selectedFile!.filename();
      widget.onFileSelected(file);
    } else {
      // User canceled the picker
    }
  }

  _checkPermission()async{
    int? androidOS = await DeviceInfoUtil.androidOS() ?? 0;
    if(androidOS < 13){
      var status = await Permission.storage.status;
      if (status.isGranted) {
        _selectFile();
      }else{
        var request = await Permission.storage.request();
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
                    "Permission Read External Storage dibutuhkan untuk memilih file.",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: const Text("Batal"),
                      onPressed:  () {
                        Navigator.of(context).pop();
                        if(mounted){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Pilih file gagal karena permission tidak dipenuhi")));
                        }
                      },
                    ),
                    TextButton(
                      child: const Text("Buka Pengaturan"),
                      onPressed:  (){
                        openAppSettings();
                      },
                    ),
                  ],
                )
            );
          }else{
            if(mounted){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Pilih file gagal karena permission tidak dipenuhi")));
            }
          }
        }
      }
    }else{
      _selectFile();
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

    return Material(
      child: InkWell(
        onTap: (){
          _checkPermission();
        },
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(10)),
              color: greyColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.file_upload, color: greyColor,),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  _selectedFile == null ? 'Pilih File' : _selectedFile!.filename(),
                  style: const TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
