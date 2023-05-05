import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dialog/filterdialog.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/approval/detail/approval_cash_advance_travel_detail_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/approval/list/approval_cash_advance_travel_list_controller.dart';
import 'package:gais/screen/tms/cash_advance/enum/approval_action_enum.dart';
import 'package:gais/screen/tms/cash_advance/widget/cash_advance_item_list.dart';
import 'package:get/get.dart';

class ApprovalCashAdvanceTravelListScreen extends StatefulWidget {
  const ApprovalCashAdvanceTravelListScreen({Key? key}) : super(key: key);

  @override
  State<ApprovalCashAdvanceTravelListScreen> createState() =>
      _ApprovalCashAdvanceTravelListScreenState();
}

class _ApprovalCashAdvanceTravelListScreenState
    extends State<ApprovalCashAdvanceTravelListScreen> {
  List<Widget> _getData() {
    List<Widget> list = [];
    for (int i = 1; i < 10; i++) {
      list.add(CashAdvanceListItem(
        onTap: () {
          Get.to(const ApprovalCashAdvanceTravelDetailScreen(
            approvalActionEnum: ApprovalActionEnum.none,
          ));
        },
        number: "$i",
        title: "TCA-ABM/1232/23.0$i",
        subtitle: "John Smith - $i",
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

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
                    "Reference".tr,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 14,
                        color: Colors.black,
                        height: 1.5
                    ),
                  ),
                  Text(
                    "TRV-ABM/1232/23.04",
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
        action: [
          CustomIconButton(
            title: "Approve".tr,
            iconData: Icons.check,
            backgroundColor: successColor,
            onPressed: () {
              Get.to(const ApprovalCashAdvanceTravelDetailScreen(
                approvalActionEnum: ApprovalActionEnum.approve,
              ));
            },
          ),
          const SizedBox(
            width: 4,
          ),
          CustomIconButton(
            title: "Reject".tr,
            iconData: Icons.close,
            backgroundColor: redColor,
            onPressed: () {
              Get.to(const ApprovalCashAdvanceTravelDetailScreen(
                approvalActionEnum: ApprovalActionEnum.reject,
              ));
            },
          )
        ],
        status: "Pending".tr,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApprovalCashAdvanceTravelListController>(
        init: ApprovalCashAdvanceTravelListController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              backgroundColor: whiteColor,
              title: Text("approval_cash_advance_travel".tr, style: appTitle),
              centerTitle: true,
              flexibleSpace: const TopBar(),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                CustomSearchBar(
                  onChanged: (string) {
                  },
                  onPressedFilter: (){
                    Get.dialog(
                        FilterDialog(
                          onApplyFilter: () {
                            Get.back();
                          },
                          children: [
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.dateRange,
                                suffixIcon: const Icon(
                                    Icons.calendar_month),
                                onTap: (){
                                  showCustomDateRangePicker(
                                    context,
                                    dismissible: true,
                                    minimumDate: DateTime.now().subtract(const Duration(days: 365)),
                                    maximumDate: DateTime.now().add(const Duration(days: 365)),
                                    endDate: controller.endDate,
                                    startDate: controller.startDate,
                                    backgroundColor: Colors.white,
                                    primaryColor: Colors.green,
                                    onApplyClick: (start, end) {
                                      controller.endDate = end;
                                      controller.startDate = start;
                                      controller.dateRange.text =
                                      "${controller.dateFormat.format(start)} - ${controller.dateFormat.format(end)}";
                                      controller.update();
                                    },
                                    onCancelClick: () {
                                      controller.endDate = null;
                                      controller.startDate = null;
                                      controller.update();
                                    },
                                  );
                                },
                                label: "Date Range".tr),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        )
                    );
                  },
                ),
                CustomPagination(
                  onPageChanged: (int) {},
                  pageTotal: 5,
                  margin: EdgeInsets.zero,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: const SizedBox()),
                ..._getData(),
              ],
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
