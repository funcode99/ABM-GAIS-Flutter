import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/screen/profil/myprofile/line_approval/line_approval_controller.dart';
import 'package:get/get.dart';

class LineApprovalScreen extends StatelessWidget {
  const LineApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LineApprovalController controller =
    Get.put(LineApprovalController());

    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(top: 10, left: 32, right: 32),
        child: SingleChildScrollView(
          child: controller.listData.isEmpty ? const DataEmpty() : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: controller.listData.mapIndexed((index, element) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${element["level"]}",
                    style: formlabelTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54, width: 1)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${element["jabatan"] ?? ""}"),
                        const SizedBox(
                          height: 8,
                        ),
                        ...List<String>.from(element["nama"]).mapIndexed((index2, name){
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text(name),
                          );
                        }
                        ).toList()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      );
    });
  }

}