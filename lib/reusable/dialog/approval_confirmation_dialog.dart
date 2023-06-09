import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

enum ApproveEnum { onBehalf, fullApprove }

class ApprovalConfirmationDialog extends StatefulWidget {
  const ApprovalConfirmationDialog({super.key});

  @override
  State<ApprovalConfirmationDialog> createState() =>
      _ApprovalConfirmationDialogState();
}

class _ApprovalConfirmationDialogState
    extends State<ApprovalConfirmationDialog> {
  ApproveEnum _selectedApproveEnum = ApproveEnum.onBehalf;

  @override
  Widget build(BuildContext context) {
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
                    style: Theme.of(context)
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
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: blackColor),
                      color: _selectedApproveEnum == ApproveEnum.onBehalf
                          ? infoColor
                          : Colors.transparent),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedApproveEnum = ApproveEnum.onBehalf;
                      });
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
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 2)),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    hint: Text("Name".tr),
                    value: "1",
                    isExpanded: true,
                    // underline: SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: "1",
                        child: Text("Name One"),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text("Name Two"),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: blackColor),
                      color: _selectedApproveEnum == ApproveEnum.fullApprove
                          ? infoColor
                          : Colors.transparent),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedApproveEnum = ApproveEnum.fullApprove;
                      });
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
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              label: "Notes".tr,
              controller: TextEditingController(),
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
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: infoColor),
                    child: Text("Approve".tr),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

