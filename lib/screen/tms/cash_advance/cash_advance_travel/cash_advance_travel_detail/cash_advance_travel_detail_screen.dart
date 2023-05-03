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
import 'package:gais/screen/tms/cash_advance/widget/cash_advance_item_list.dart';
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
              title: Text("cash_advance_travel".tr, style: appTitle),
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


                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.totalController,
                                label: "Total".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Details Item",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Divider(
                              height: 20,
                              color: greyColor,
                            ),

                            CashAdvanceListItem(
                              number: "1",
                              title: "TCA-ABM/1232/23.01",
                              subtitle: "John Smith - 1",
                              total: "250.000",
                              content: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Item".tr,
                                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                              fontSize: 14,
                                              color: Colors.black,
                                              height: 1.5
                                          ),
                                        ),
                                        Text(
                                          "Bensin",
                                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                              fontSize: 14,
                                              color: greyColor,
                                              height: 1.5
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Frequency".tr,
                                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                              fontSize: 14,
                                              color: Colors.black,
                                              height: 1.5
                                          ),
                                        ),
                                        Text(
                                          "1",
                                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                              fontSize: 14,
                                              color: greyColor,
                                              height: 1.5
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Currency".tr,
                                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                              fontSize: 14,
                                              color: Colors.black,
                                              height: 1.5
                                          ),
                                        ),
                                        Text(
                                          "Rupiah",
                                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                              fontSize: 14,
                                              color: greyColor,
                                              height: 1.5
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Nominal".tr,
                                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                              fontSize: 14,
                                              color: Colors.black,
                                              height: 1.5
                                          ),
                                        ),
                                        Text(
                                          "250.000",
                                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                              fontSize: 14,
                                              color: greyColor,
                                              height: 1.5
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              action: const [

                              ],
                              status: "Pending".tr,
                            ),
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
