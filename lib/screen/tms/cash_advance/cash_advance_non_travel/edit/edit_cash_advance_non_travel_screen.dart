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
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/item_cash_advance_non_travel/add/add_item_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/item_cash_advance_non_travel/detail/detail_item_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/edit/edit_cash_advance_non_travel_controller.dart';
import 'package:gais/screen/tms/cash_advance/widget/item_cash_advance_non_travel.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class EditCashAdvanceNonTravelScreen extends StatefulWidget {
  const EditCashAdvanceNonTravelScreen({Key? key}) : super(key: key);

  @override
  State<EditCashAdvanceNonTravelScreen> createState() =>
      _EditCashAdvanceNonTravelScreenState();
}

class _EditCashAdvanceNonTravelScreenState
    extends State<EditCashAdvanceNonTravelScreen> {
  bool _isButtonEnabled = true;
  bool _isOnEdit = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCashAdvanceNonTravelController>(
        init: EditCashAdvanceNonTravelController(),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        width: double.infinity,
                        child: Text(
                          "TCA-ABM/1232/23.04",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _isOnEdit = true;
                              });
                            },
                            child: Text("Edit".tr),
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(75, 30),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          _isOnEdit
                              ? ElevatedButton(
                                  onPressed: _isButtonEnabled
                                      ? () {
                                          setState(() {
                                            _isOnEdit = !_isOnEdit;
                                          });
                                        }
                                      : null,
                                  child: Text("Save".tr),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(75, 30),
                                      backgroundColor: successColor),
                                )
                              : ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Submit".tr),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(75, 30),
                                      backgroundColor: successColor),
                                ),
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
                            const SizedBox(
                              height: 16,
                            ),
                            CustomTextFormField(
                                isRequired: true,
                                readOnly: true,
                                controller: controller.requestorController,
                                label: "Requestor".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                isRequired: true,
                                readOnly: !_isOnEdit,
                                controller: controller.eventController,
                                label: "Event".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                isRequired: true,
                                readOnly: true,
                                controller: controller.dateController,
                                onTap: _isOnEdit
                                    ? () async {
                                        DateTime? dateTime =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate:
                                              DateTime(DateTime.now().year),
                                          lastDate:
                                              DateTime(DateTime.now().year + 1),
                                        );
                                        controller.dateController.text =
                                            controller.dateFormat
                                                .format(dateTime!);
                                      }
                                    : null,
                                label: "Date".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                controller: controller.totalController,
                                label: "Total".tr),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                                _isOnEdit
                                    ? CustomIconButton(
                                        title: "Add".tr,
                                        iconData: IconlyBold.plus,
                                        backgroundColor: successColor,
                                        onPressed: () async {
                                          final addedItem = await Get.to(
                                              const AddItemCashAdvanceNonTravelScreen());
                                          if (addedItem != null) {
                                            controller.listItem.add(addedItem);
                                            controller.update();
                                          }
                                        },
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                            const Divider(
                              height: 20,
                              color: greyColor,
                            ),
                            ...controller.listItem
                                .mapIndexed((index, element) =>
                                    ItemCashAdvanceNonTravel(
                                      number: "${index + 1}",
                                      title: element.item,
                                      subtitle: element.costCenter,
                                      nominal: element.nominal,
                                      onTap: !_isOnEdit
                                          ? () {
                                              Get.dialog(Dialog(
                                                child:
                                                    DetailItemCashAdvanceNonTravelScreen(
                                                        item: element),
                                              ));
                                            }
                                          : null,
                                      action: _isOnEdit
                                          ? [
                                              CustomIconButton(
                                                title: "Edit".tr,
                                                iconData: IconlyBold.edit,
                                                backgroundColor: successColor,
                                                onPressed: () {
                                                  Get.to(
                                                      const AddItemCashAdvanceNonTravelScreen());
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
                                                  Get.dialog(
                                                      DeleteConfirmationDialog(
                                                    onDeletePressed: () {
                                                      print("deleted");
                                                      Get.back();
                                                    },
                                                  ));
                                                },
                                              )
                                            ]
                                          : [],
                                    ))
                                .toList(),
                            const SizedBox(
                              height: 32,
                            )
                          ],
                        ),
                      ),
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
