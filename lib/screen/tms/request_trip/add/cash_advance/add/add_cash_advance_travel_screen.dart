import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_add_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/add/add_cash_advance_travel_controller.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/add/item_cash_advance_travel/add/add_item_cash_advance_travel_screen.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/add/item_cash_advance_travel/add/add_cash_advance_screen.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/cash_advance_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddCashAdvanceTravelScreen extends StatelessWidget {
  const AddCashAdvanceTravelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCashAdvanceTravelController>(
        init: AddCashAdvanceTravelController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              leading: IconButton(
                  onPressed: () => Get.off(
                        CashAdvanceScreen(),
                        arguments: {
                          'purposeID': controller.purposeID,
                          'codeDocument': controller.codeDocument
                        },
                      ),
                  icon: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 30,
                  )),
              title: Text("cash_advance_travel".tr, style: appTitle),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 42,
                      width: 42,
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: infoColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: SvgPicture.asset(ImageConstant.emptyWalletTime,
                          height: 25),
                    ),
                    Text("Cash Advance Travel", style: appTitle),
                    Form(
                      key: controller.formKey,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      // onChanged: () {
                      //   controller.isButtonEnabled =
                      //       controller.formKey.currentState!.validate();
                      //   controller.update();
                      // },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            CustomTextFormField(
                                isRequired: true,
                                readOnly: true,
                                controller: controller.travellerName,
                                label: "Traveller".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                              isRequired: true,
                              controller: controller.notes,
                              label: "Notes".tr,
                              onChanged: (value) {
                                controller.isButtonEnabled =
                                    controller.formKey.currentState!.validate();
                                controller.update();
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.totalController,
                                label: "Total".tr),
                            const SizedBox(
                              height: 32,
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
                            ...controller.listDetail
                                .mapIndexed((index, element) => CommonAddItem(
                                      number: "${index + 1}",
                                      title: "${element.itemName}",
                                      subtitle: "${element.costCenterName}",
                                      nominal:
                                          "${element.nominal?.toInt().toCurrency()}",
                                      action: [
                                        CustomIconButton(
                                          title: "Edit".tr,
                                          iconData: IconlyBold.edit,
                                          backgroundColor: successColor,
                                          onPressed: () async {
                                            final editedItem = await Get.to(() =>
                                                AddItemCashAdvanceTravelScreen(
                                                    item: element));
                                            controller.editItem(editedItem);
                                          },
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        CustomIconButton(
                                          title: "Delete".tr,
                                          iconData: IconlyBold.delete,
                                          backgroundColor: redColor,
                                          onPressed: () {
                                            Get.dialog(DeleteConfirmationDialog(
                                              onDeletePressed: () {
                                                controller.removeItem(element);
                                                Get.back();
                                              },
                                            ));
                                          },
                                        )
                                      ],
                                    ))
                                .toList(),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final addedItem = await Get.to(
                                    const AddCashAdvanceScreen(),
                                    arguments: {
                                      'purposeID': controller.purposeID,
                                      'codeDocument': controller.codeDocument
                                    },
                                  );
                                  if (addedItem != null) {
                                    controller.addItem(addedItem);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: infoColor),
                                child: RichText(
                                  text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                      children: [
                                        const TextSpan(text: "+ "),
                                        TextSpan(text: "Add Item".tr)
                                      ]),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 64,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    Get.off(
                                      CashAdvanceScreen(),
                                      arguments: {
                                        'purposeID': controller.purposeID,
                                        'codeDocument': controller.codeDocument
                                      },
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: const Size(100, 40),
                                  ),
                                  child: Text("Cancel".tr),
                                ),
                                ElevatedButton(
                                  onPressed: controller.isButtonEnabled
                                      ? () {
                                          controller.saveData();
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: infoColor),
                                  child: Text("Save".tr),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
