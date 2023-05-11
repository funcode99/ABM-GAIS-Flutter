
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

enum RejectEnum { rejectWithNote, fullReject }
enum RejectFormEnum { onlyRejectWithNote, onlyFullReject, both }

class RejectDialog extends StatefulWidget {
  const RejectDialog({super.key, this.rejectFormEnum = RejectFormEnum.both});

  final RejectFormEnum rejectFormEnum;
  @override
  State<RejectDialog> createState() =>
      _RejectDialogState();
}

class _RejectDialogState
    extends State<RejectDialog> {
  RejectEnum _selectedRejectEnum = RejectEnum.rejectWithNote;
  final _formKey = GlobalKey<FormState>();

  bool _isButtonEnabled = false;
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    Future.delayed(Duration.zero, (){
      if(widget.rejectFormEnum == RejectFormEnum.onlyFullReject){
        setState(() {
          _selectedRejectEnum = RejectEnum.fullReject;
        });
      }else{
        setState(() {
          _selectedRejectEnum = RejectEnum.rejectWithNote;
        });
      }
    });
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
              widget.rejectFormEnum != RejectFormEnum.onlyFullReject ? Row(
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
              ) : const SizedBox(),
              const SizedBox(
                height: 16,
              ),
              widget.rejectFormEnum != RejectFormEnum.onlyRejectWithNote ? Row(
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
              ) : const SizedBox(),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                isRequired: true,
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
                        Get.back();
                      } : null,
                      child: Text("Reject".tr),
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
