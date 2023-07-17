import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/add/add_cash_advance_travel_controller.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/add/item_cash_advance_travel/add/add_item_cash_advance_travel_screen.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/cash_advance_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
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
              leading: CustomBackButton(
                onPressed: () => controller.formEdit == true
                    ? Get.off(FormRequestTripScreen(), arguments: {
                        'id': controller.purposeID,
                        'codeDocument': controller.codeDocument,
                      })
                    : Get.off(
                        CashAdvanceScreen(),
                        arguments: {'purposeID': controller.purposeID, 'codeDocument': controller.codeDocument},
                      ),
              ),
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
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                      child: SvgPicture.asset(ImageConstant.emptyWalletTime, height: 25),
                    ),
                    Text("Cash Advance Travel", style: appTitle),
                    Form(
                      key: controller.formKey,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            CustomTextFormField(isRequired: true, readOnly: true, controller: controller.travellerName, label: "Traveller".tr),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              isRequired: true,
                              controller: controller.notes,
                              label: "Notes".tr,
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "Currency",
                              hintText: "Currency",
                              isRequired: true,
                              value: controller.currentCurrency,
                              items: controller.currencyList
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e.currencyName.toString()),
                                        value: e.id.toString(),
                                        onTap: () {
                                          controller.currencyCode = "${e.currencyCode.toString()}";
                                        },
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedCurrency = value?.toInt();
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            CustomTextFormField(
                              readOnly: true,
                              controller: controller.totalController,
                              label: "Total".tr,
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              "Details Item",
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
                            ),
                            const Divider(
                              height: 20,
                              color: greyColor,
                            ),
                            ...controller.listDetail
                                .mapIndexed((index, e) => CustomTripCard(
                                      listNumber: index + 1,
                                      title: controller.itemCA.where((item) => item["id"] == e.idItemCa?.toInt()).first["item"].toString(),
                                      info: "${controller.currencyCode} ${int.parse(e.total.toString()).toCurrency()}",
                                      isEdit: true,
                                      editButton: GestureDetector(
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(color: successColor, borderRadius: BorderRadius.circular(6)),
                                          child: Icon(IconlyBold.edit, color: whiteColor),
                                        ),
                                        onTap: () async {
                                          final editedItem = await Get.to(
                                            () => AddItemCashAdvanceTravelScreen(item: e),
                                            arguments: {
                                              'purposeID': controller.purposeID,
                                              'codeDocument': controller.codeDocument,
                                            },
                                          );
                                          controller.editItem(editedItem);
                                        },
                                      ),
                                      isDelete: true,
                                      deleteButton: GestureDetector(
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(color: errorColor, borderRadius: BorderRadius.circular(6)),
                                          child: Icon(IconlyBold.delete, color: whiteColor),
                                        ),
                                        onTap: () {
                                          // Get.dialog(DeleteConfirmationDialog(
                                          //   onDeletePressed: () {
                                          controller.removeItem(e);
                                          // },
                                          // ));
                                        },
                                      ),
                                      content: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text("Frequency", style: listTitleTextStyle),
                                                Text(e.frequency.toString(), style: listSubTitleTextStyle),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text("Nominal", style: listTitleTextStyle),
                                                Text("${controller.currencyCode} ${int.parse(e.nominal.toString()).toCurrency()}",
                                                    style: listSubTitleTextStyle),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                            CustomFilledButton(
                              color: infoColor,
                              title: "Add Item",
                              icon: Icons.add,
                              onPressed: () async {
                                final addedItem = await Get.to(
                                  // const AddCashAdvanceScreen(),
                                  AddItemCashAdvanceTravelScreen(),
                                  arguments: {
                                    'purposeID': controller.purposeID,
                                    'codeDocument': controller.codeDocument,
                                  },
                                );
                                if (addedItem != null) {
                                  controller.addItem(addedItem);
                                }
                              },
                            ),
                            const SizedBox(
                              height: 64,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomFilledButton(
                                  color: Colors.transparent,
                                  title: "Cancel",
                                  width: 100,
                                  fontColor: infoColor,
                                  borderColor: infoColor,
                                  onPressed: () {
                                    controller.formEdit == true
                                        ? Get.off(FormRequestTripScreen(), arguments: {
                                            'id': controller.purposeID,
                                            'codeDocument': controller.codeDocument,
                                          })
                                        : Get.off(
                                            CashAdvanceScreen(),
                                            arguments: {'purposeID': controller.purposeID, 'codeDocument': controller.codeDocument},
                                          );
                                  },
                                ),
                                CustomFilledButton(
                                    color: infoColor,
                                    title: "Save",
                                    width: 100,
                                    onPressed: () {
                                      if (controller.formKey.currentState?.validate() == true) controller.saveData();
                                    }),
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
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
