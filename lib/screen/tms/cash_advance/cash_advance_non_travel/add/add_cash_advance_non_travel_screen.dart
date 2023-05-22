import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_add_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/add_cash_advance_non_travel_controller.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/item_cash_advance_non_travel/add/add_item_cash_advance_non_travel_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddCashAdvanceNonTravelScreen extends StatefulWidget {
  const AddCashAdvanceNonTravelScreen({Key? key}) : super(key: key);

  @override
  State<AddCashAdvanceNonTravelScreen> createState() =>
      _AddCashAdvanceNonTravelScreenState();
}

class _AddCashAdvanceNonTravelScreenState
    extends State<AddCashAdvanceNonTravelScreen> {
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCashAdvanceNonTravelController>(
        init: AddCashAdvanceNonTravelController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              leading: const CustomBackButton(),
              backgroundColor: whiteColor,
              title: Text("cash_advance_non_travel".tr, style: appTitle),
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
                                      onPressed: () async{
                                        final editedItem = await Get.to(()=>AddItemCashAdvanceNonTravelScreen(item: element));
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
                                  const AddItemCashAdvanceNonTravelScreen());
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
                                Get.back();
                              },
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size(100, 40),
                              ),
                              child: Text("Cancel".tr),
                            ),
                            ElevatedButton(
                              onPressed: _isButtonEnabled
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
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
