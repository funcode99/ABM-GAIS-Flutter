
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/reusable/customtextformfield.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

enum RejectEnum { rejectWithNote, fullReject }

class RejectDialog extends StatefulWidget {
  const RejectDialog({super.key});

  @override
  State<RejectDialog> createState() =>
      _RejectDialogState();
}

class _RejectDialogState
    extends State<RejectDialog> {
  RejectEnum _selectedRejectEnum = RejectEnum.rejectWithNote;

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
                    "Reject Reason".tr,
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
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: blackColor),
                      color: _selectedRejectEnum == RejectEnum.rejectWithNote
                          ? infoColor
                          : Colors.transparent),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedRejectEnum = RejectEnum.rejectWithNote;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text("Reject With Notes ".tr),
                ),
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
                      color: _selectedRejectEnum == RejectEnum.fullReject
                          ? infoColor
                          : Colors.transparent),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedRejectEnum = RejectEnum.fullReject;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text("Fully Rejected".tr),
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
              isRequired: true,
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
                    child: Text("Approve".tr),
                    style: ElevatedButton.styleFrom(backgroundColor: infoColor),
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
