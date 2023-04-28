import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customalertcontainer.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/cash_advance_travel_detail/cash_advance_travel_detail_controller.dart';
import 'package:get/get.dart';

class CashAdvanceTravelDetailScreen extends StatefulWidget {
  const CashAdvanceTravelDetailScreen({Key? key}) : super(key: key);

  @override
  State<CashAdvanceTravelDetailScreen> createState() =>
      _CashAdvanceTravelDetailScreenState();
}

class _CashAdvanceTravelDetailScreenState
    extends State<CashAdvanceTravelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CashAdvanceTravelDetailController>(
        init: CashAdvanceTravelDetailController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              leading: const CustomBackButton(),
              backgroundColor: whiteColor,
              title: Text("Cash Advance Travel", style: appTitle),
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
                                label: "Created Date"),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                isRequired: true,
                                controller: controller.requestorController,
                                label: "Requestor"),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                isRequired: false,
                                controller: controller.referenceController,
                                label: "Reference"),
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
                                label: "Item"),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.frequencyController,
                                label: "Frequency"),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.currencyController,
                                label: "Currency"),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.amountController,
                                label: "Amount"),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.totalController,
                                label: "Total"),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.remarksController,
                                label: "Remarks")
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

class CashAdvanceListItem extends StatelessWidget {
  const CashAdvanceListItem(
      {super.key,
      required this.number,
      required this.title,
      required this.subtitle,
      required this.status,
      required this.content,
      required this.action});

  final String number;
  final String title;
  final String subtitle;
  final String status;
  final Widget content;
  final List<Widget> action;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 50,
                    minWidth: 50,
                  ),
                  child: CustomAlertContainer(
                    backgroundColor: infoColor,
                    content: Text("No\n$number",
                        style: listTitleTextStyle.copyWith(color: whiteColor),
                        textAlign: TextAlign.center),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: listTitleTextStyle),
                      Text(
                        subtitle,
                        style: listSubTitleTextStyle,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                CustomStatusContainer(
                  backgroundColor: greenColor,
                  status: status,
                )
              ],
            ),
            const Divider(
              height: 20,
              color: greyColor,
            ),
            content,
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAlertContainer(
                  backgroundColor: infoColor,
                  content: Text("120.000",
                      style: listSubTitleTextStyle.copyWith(
                          color: whiteColor, fontSize: 14),
                      textAlign: TextAlign.center),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                ),
                Row(
                  children: action,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
