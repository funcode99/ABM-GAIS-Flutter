import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/dialog/filterdialog.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/request_atk/list/request_atk_list_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class RequestATKListScreen extends StatefulWidget {
  const RequestATKListScreen({Key? key}) : super(key: key);

  @override
  State<RequestATKListScreen> createState() => _RequestATKListScreenState();
}

class _RequestATKListScreenState extends State<RequestATKListScreen> {
  List<Widget> _getData() {
    List<Widget> list = [];
    for (int i = 1; i < 10; i++) {
      list.add(CommonListItem(
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
                    "Requestor".tr,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 14, color: Colors.black, height: 1.5),
                  ),
                  Text(
                    "Kia B",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 14, color: greyColor, height: 1.5),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Item".tr,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 14, color: Colors.black, height: 1.5),
                  ),
                  Text(
                    "Pensil",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 14, color: greyColor, height: 1.5),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Qty".tr,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 14, color: Colors.black, height: 1.5),
                  ),
                  Text(
                    "2",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 14, color: greyColor, height: 1.5),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "UOM".tr,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 14, color: Colors.black, height: 1.5),
                  ),
                  Text(
                    "Pcs",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 14, color: greyColor, height: 1.5),
                  ),
                ],
              ),
            ],
          ),
        ),
        action: [
          CustomIconButton(
            backgroundColor: redColor,
            title: "Delete".tr,
            iconData: IconlyBold.delete,
            onPressed: () {
              Get.dialog(DeleteConfirmationDialog(
                onDeletePressed: (){
                  Get.back();
                },
              ));
            },
          )
        ],
        status: "Completed".tr,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestATKListController>(
        init: RequestATKListController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              leading: const CustomBackButton(),
              backgroundColor: whiteColor,
              title: Text("ATK Request".tr, style: appTitle),
              centerTitle: true,
              flexibleSpace: const TopBar(),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                CustomSearchBar(
                  onChanged: (string) {},
                  onPressedFilter: () {
                    Get.dialog(FilterDialog(
                      onApplyFilter: () {
                        controller.applyFilter();
                        Get.back();
                      },
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        CustomDropDownFormField(
                          items: [
                            DropdownMenuItem(
                              value: "",
                              child: Text("Item Name".tr),
                            ),
                            const DropdownMenuItem(
                              value: "Bensin",
                              child: Text("Bensin"),
                            ),
                            const DropdownMenuItem(
                              value: "Transport",
                              child: Text("Transport"),
                            ),
                          ],
                          onChanged: (value) {
                            controller.tempSelectedValue = value!;
                          },
                          label: "Item Name".tr,
                          value: controller.selectedValue,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                            readOnly: true,
                            controller: controller.dateRange,
                            suffixIcon: const Icon(Icons.calendar_month),
                            onTap: () {
                              showCustomDateRangePicker(
                                context,
                                dismissible: true,
                                minimumDate: DateTime.now()
                                    .subtract(const Duration(days: 365)),
                                maximumDate: DateTime.now()
                                    .add(const Duration(days: 365)),
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
                    ));
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
