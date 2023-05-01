import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/approval/detail/approval_cash_advance_non_travel_detail_controller.dart';
import 'package:gais/screen/tms/cash_advance/widget/approval_confirmation_dialog.dart';
import 'package:gais/screen/tms/cash_advance/widget/reject_dialog.dart';
import 'package:gais/util/input_formatter/thousand_separator_input_formatter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

enum ApprovalActionEnum {approve, reject, none}
class ApprovalCashAdvanceNonTravelDetailScreen extends StatefulWidget {
  const ApprovalCashAdvanceNonTravelDetailScreen({Key? key, this.approvalActionEnum = ApprovalActionEnum.none}) : super(key: key);

  final ApprovalActionEnum approvalActionEnum;
  @override
  State<ApprovalCashAdvanceNonTravelDetailScreen> createState() =>
      _ApprovalCashAdvanceNonTravelDetailScreenState();
}

class _ApprovalCashAdvanceNonTravelDetailScreenState
    extends State<ApprovalCashAdvanceNonTravelDetailScreen> {
  bool _isButtonEnabled = false;

  _openApproveDialog(){
    Get.dialog(const ApprovalConfirmationDialog());
  }

  _openRejectDialog(){
    Get.dialog(const RejectDialog());
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, (){
      if(widget.approvalActionEnum == ApprovalActionEnum.approve){
        _openApproveDialog();
      }else if(widget.approvalActionEnum == ApprovalActionEnum.reject){
       _openRejectDialog();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApprovalCashAdvanceNonTravelDetailController>(
        init: ApprovalCashAdvanceNonTravelDetailController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              leading: const CustomBackButton(),
              backgroundColor: whiteColor,
              title:
                  Text("approval_cash_advance_non_travel".tr, style: appTitle),
              centerTitle: true,
              flexibleSpace: const TopBar(),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Card(
                child: Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: () {
                    setState(() {
                      _isButtonEnabled =
                          controller.formKey.currentState!.validate();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        width: double.infinity,
                        child: Text(
                          "TCA-ABM/1232/23.04",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            title: "Approve".tr,
                            iconData: Icons.check,
                            backgroundColor: successColor,
                            onPressed: () {
                              _openApproveDialog();
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          CustomIconButton(
                            title: "Reject".tr,
                            iconData: Icons.close,
                            backgroundColor: redColor,
                            onPressed: () {
                              _openRejectDialog();
                            },
                          )
                        ],
                      ),
                      const Divider(
                        height: 20,
                        color: greyColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            CustomTextFormField(
                                isRequired: true,
                                controller: controller.requestorController,
                                label: "Requestor".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                isRequired: true,
                                controller: controller.eventController,
                                label: "Event".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                isRequired: true,
                                readOnly: true,
                                controller: controller.dateController,
                                onTap: () async {
                                  DateTime? dateTime = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(DateTime.now().year),
                                    lastDate: DateTime(DateTime.now().year + 1),
                                  );
                                  controller.dateController.text =
                                      controller.dateFormat.format(dateTime!);
                                },
                                label: "Date".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                isRequired: true,
                                controller: controller.costCenterController,
                                label: "Cost Center".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  ThousandsSeparatorInputFormatter()
                                ],
                                inputType: TextInputType.number,
                                isRequired: true,
                                controller: controller.nominalController,
                                label: "Nominal".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                controller: controller.remarksController,
                                label: "Remarks".tr),
                            const SizedBox(
                              height: 32,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
