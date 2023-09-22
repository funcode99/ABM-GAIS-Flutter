import 'package:flutter/material.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/screen/profil/myprofile/line_approval/line_approval_controller.dart';
import 'package:gais/screen/profil/myprofile/line_approval/line_approval_controller.dart';
import 'package:get/get.dart';

class LineApprovalScreen extends StatelessWidget {
  const LineApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LineApprovalController>(
        init: LineApprovalController(),
        builder: (controller) {
          return Container(
            margin: const EdgeInsets.only(top: 10, left: 32,right: 32),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFormField(
                      onTap: (){},
                      readOnly: true,
                      controller: controller.l1Controller,
                      label: "L1".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      onTap: (){},
                      readOnly: true,
                      controller: controller.l2Controller,
                      label: "L2".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      readOnly: true,
                      controller: controller.l3Controller,
                      label: "L3".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      readOnly: true,
                      controller: controller.l4Controller,
                      label: "L4".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      readOnly: true,
                      controller: controller.l5Controller,
                      label: "L5".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      readOnly: true,
                      controller: controller.l6Controller,
                      label: "L6".tr),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          );
        });
  }

}