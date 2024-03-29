import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/reusable/dialog/approval_confirmation_controller.dart';
import 'package:gais/reusable/form/custom_form_file_picker.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ApprovalConfirmationDialog extends StatelessWidget {
  const ApprovalConfirmationDialog(
      {super.key, this.idCompany, this.idSite, this.idEmployee, this.idApprovalAuth, this.approveFormEnum = ApproveFormEnum
          .both});

  final int? idCompany;
  final int? idSite;
  final int? idEmployee;
  final int? idApprovalAuth;
  final ApproveFormEnum approveFormEnum;

  @override
  Widget build(BuildContext context) {
    final ApprovalConfirmationController controller = Get.put(
        ApprovalConfirmationController())
      ..idApprovalAuth(idApprovalAuth)
      ..idCompany(idCompany)
      ..idSite(idSite)
      ..idEmployee(idEmployee)
      ..selectedFormEnum(approveFormEnum);

    return Dialog(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Approval Confirmation".tr,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(IconlyBold.close_square),
                  color: Colors.red,
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Are you sure want to approve this document?".tr,
              style: Theme
                  .of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(() {
              if (controller.selectedFormEnum.value !=
                  ApproveFormEnum.onlyFullApprove) {
                if (controller.enableOnBehalf.value) {
                  return Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: blackColor),
                            color: controller.selectedEnum.value ==
                                ApproveEnum.onBehalf ? infoColor : Colors
                                .transparent),
                        child: GestureDetector(
                          onTap: () {
                            controller.selectedEnum.value =
                                ApproveEnum.onBehalf;
                            controller.updateButton();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Text("Approve on Behalf of: ".tr),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2)),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          hint: Text("Name".tr),
                          value: controller.selectedEmployee.value?.id
                              .toString(),
                          isExpanded: true,
                          // underline: SizedBox(),
                          items: controller.listEmployee
                              .map((e) =>
                              DropdownMenuItem(
                                value: e.id.toString(),
                                child: Text("${e.employeeName}"),
                              ))
                              .toList(),
                          onChanged: (value) {
                            controller.onChangeSelectedEmployee(
                                value.toString());
                          },
                        ),
                      )
                    ],
                  );
                }
              }
              return const SizedBox();
            }),
            const SizedBox(
              height: 16,
            ),
            Obx(() {
              if (controller.selectedFormEnum.value !=
                ApproveFormEnum.onlyApproveOnBehalf) {
                return Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: blackColor),
                          color: controller.selectedEnum.value ==
                              ApproveEnum.fullApprove ? infoColor : Colors
                              .transparent),
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedEnum.value = ApproveEnum.fullApprove;
                          controller.selectedFile = null;
                          controller.updateButton();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text("Fully approve".tr),
                    ),
                    const SizedBox(
                      width: 12,
                    )
                  ],
                );
              }
              return SizedBox();
            }),
            SizedBox(
              height: controller.selectedEnum.value == ApproveEnum.onBehalf
                  ? 16
                  : 0,
            ),
            Obx(() {
              if (controller.selectedEnum.value == ApproveEnum.onBehalf &&
                  controller.showAttachment.value) {
                return CustomFormFilePicker(
                  label: "Attachment".tr,
                  isRequired: true,
                  onFileSelected: (file) {
                    controller.selectedFile = file;
                    controller.updateButton();
                  },
                );
              }
              return SizedBox();
            }),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              label: "Notes".tr,
              controller: controller.noteController,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Cancel".tr))),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: controller.enableButton.value ? () {
                        Get.back(result: controller.approve());
                      } : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: infoColor),
                      child: Text("Approve".tr),
                    );
                  }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
