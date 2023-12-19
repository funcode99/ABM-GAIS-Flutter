
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CancelDialog extends StatefulWidget {
  const CancelDialog({super.key, required this.title});
  final String title;

  @override
  State<CancelDialog> createState() =>
      _CancelDialogState();
}

class _CancelDialogState extends State<CancelDialog> {
  final _formKey = GlobalKey<FormState>();

  bool _isButtonEnabled = false;
  final _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () {
            setState(() {
              _isButtonEnabled =
                  _formKey.currentState!.validate();
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Cancel ${widget.title}",
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
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: listSubTitleTextStyle.copyWith(
                    color: greyColor
                  ),
                  children: [
                    const TextSpan(
                      text: "Are you sure want to ",
                    ),
                    TextSpan(
                      text: "cancel ",
                      style: listSubTitleTextStyle.copyWith(
                          color: Colors.red,
                        fontWeight: FontWeight.w500
                      )
                    ),
                    TextSpan(
                      text: "this ${widget.title}?",
                    ),
                  ]
                )
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                isRequired: true,
                multiLine: true,
                label: "Notes".tr,
                controller: _noteController,
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
                      onPressed: _isButtonEnabled ? () {
                        Get.back(
                            result: ApprovalModel(
                                notes: _noteController.text
                            )
                        );
                      } : null,
                      child: Text("Save".tr),
                      style: ElevatedButton.styleFrom(backgroundColor: infoColor),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
