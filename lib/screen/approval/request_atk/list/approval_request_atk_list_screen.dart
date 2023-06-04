import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/request_atk/detail/detail_approval_request_atk_screen.dart';
import 'package:gais/screen/approval/request_atk/list/approval_request_atk_list_controller.dart';
import 'package:gais/screen/tms/cash_advance/enum/approval_action_enum.dart';
import 'package:get/get.dart';

class ApprovalRequestATKListScreen extends StatelessWidget {
  const ApprovalRequestATKListScreen({Key? key}) : super(key: key);

  List<Widget> _getData(){
    List<Widget> list = [];
    for(int i = 1; i < 10; i++){
      list.add(
          CommonListItem(
            onTap: (){
              Get.to(const DetailApprovalRequestATKScreen(approvalActionEnum: ApprovalActionEnum.none,));
            },
            number: "$i",
            title: "OUT-ABM/1859/23.0$i",
            subtitle: "12/05/23",
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Requestor".tr,
                        style: listTitleTextStyle,
                      ),
                      Text(
                        "John Smith",
                        style: listSubTitleTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Warehouse".tr,
                        style: listTitleTextStyle,
                      ),
                      Text(
                        "Warehouse A",
                        style: listSubTitleTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Item Count".tr,
                        style: listTitleTextStyle,
                      ),
                      Text(
                        "100",
                        style: listSubTitleTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            action: [
              CustomIconButton(
                title: "Confirm".tr,
                iconData: Icons.check,
                backgroundColor: successColor,
                onPressed: (){
                  Get.to(const DetailApprovalRequestATKScreen(approvalActionEnum: ApprovalActionEnum.approve,));
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
                  Get.to(const DetailApprovalRequestATKScreen(approvalActionEnum: ApprovalActionEnum.reject,));
                },
              )
            ],
            status: "Booked".tr,
          )
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final ApprovalRequestATKListController controller = Get.put(ApprovalRequestATKListController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text("Approval ATK Request".tr, style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomSearchBar(
              onSubmit: (string) {
              },
              onPressedFilter: (){
                Get.bottomSheet(
                    FilterBottomSheet(
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
              onPageChanged: (int ) {  },
              pageTotal: 5,
              margin: EdgeInsets.zero,
              colorSub: whiteColor,
              colorPrimary: infoColor,
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ..._getData()
                    ],
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
