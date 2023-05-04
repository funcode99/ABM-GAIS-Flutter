import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/cash_advance_travel_detail/cash_advance_travel_detail_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/cash_advance_travel_list/cash_advance_travel_list_controller.dart';
import 'package:gais/screen/tms/cash_advance/widget/cash_advance_item_list.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CashAdvanceTravelListScreen extends StatefulWidget {
  const CashAdvanceTravelListScreen({Key? key}) : super(key: key);

  @override
  State<CashAdvanceTravelListScreen> createState() => _CashAdvanceTravelListScreenState();
}

class _CashAdvanceTravelListScreenState extends State<CashAdvanceTravelListScreen> {
  List<Widget> _getData(){
    List<Widget> list = [];
    for(int i = 1; i < 10; i++){
      list.add(
        CashAdvanceListItem(
            number: "$i",
            title: "TCA-ABM/1232/23.0$i",
            subtitle: "John Smith - $i",
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                title: "View".tr,
                iconData: IconlyBold.show,
                onPressed: () {
                  Get.to(const CashAdvanceTravelDetailScreen());
                },
              )
            ],
            status: "Submitted".tr,
          )
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CashAdvanceTravelListController>(
        init: CashAdvanceTravelListController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              backgroundColor: whiteColor,
              title: Text("cash_advance_travel".tr, style: appTitle),
              centerTitle: true,
              flexibleSpace: const TopBar(),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                CustomSearchBar(
                  onChanged: (string) {
                    print("test $string");
                  },
                ),
                Text("Date Range".tr, style: listTitleTextStyle),
                const SizedBox(
                  height: 6,
                ),
                TextField(
                  readOnly: true,
                  controller: controller.dateRange,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      suffixIcon: Icon(Icons.calendar_month)),
                  onTap: () {
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
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomPagination(
                  onPageChanged: (int ) {  },
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
