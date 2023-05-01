import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/approval/detail/approval_cash_advance_travel_detail_controller.dart';
import 'package:gais/screen/tms/cash_advance/enum/approval_action_enum.dart';
import 'package:gais/screen/tms/cash_advance/widget/approval_confirmation_dialog.dart';
import 'package:gais/screen/tms/cash_advance/widget/reject_dialog.dart';
import 'package:get/get.dart';

class ApprovalCashAdvanceTravelDetailScreen extends StatefulWidget {
  const ApprovalCashAdvanceTravelDetailScreen({Key? key, this.approvalActionEnum = ApprovalActionEnum.none}) : super(key: key);

  final ApprovalActionEnum approvalActionEnum;

  @override
  State<ApprovalCashAdvanceTravelDetailScreen> createState() =>
      _ApprovalCashAdvanceTravelDetailScreenState();
}

class _ApprovalCashAdvanceTravelDetailScreenState
    extends State<ApprovalCashAdvanceTravelDetailScreen> {

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
    return GetBuilder<ApprovalCashAdvanceTravelDetailController>(
        init: ApprovalCashAdvanceTravelDetailController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              leading: const CustomBackButton(),
              backgroundColor: whiteColor,
              title: Text("approval_cash_advance_travel".tr, style: appTitle),
              centerTitle: true,
              flexibleSpace: const TopBar(),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Card(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        width: double.infinity,
                        child: Text(
                          "TCA-ABM/1232/23.04",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                          ),
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
                            CustomTextFormField(
                                readOnly: true,
                                isRequired: true,
                                controller: controller.createdDateController,
                                label: "Created Date".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                isRequired: true,
                                controller: controller.requestorController,
                                label: "Requestor".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                isRequired: false,
                                controller: controller.referenceController,
                                label: "Reference".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "1"
                            ),
                            const Divider(
                              height: 20,
                              color: greyColor,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.itemController,
                                label: "Item".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.frequencyController,
                                label: "Frequency".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.currencyController,
                                label: "Currency".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.amountController,
                                label: "Amount".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.totalController,
                                label: "Total".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.remarksController,
                                label: "Remarks".tr)
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      )
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
