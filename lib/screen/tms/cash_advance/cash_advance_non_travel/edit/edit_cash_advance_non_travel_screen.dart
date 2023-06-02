import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_add_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/item_cash_advance_non_travel/add/add_item_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/item_cash_advance_non_travel/detail/detail_item_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/edit/edit_cash_advance_non_travel_controller.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class EditCashAdvanceNonTravelScreen extends StatelessWidget {
  const EditCashAdvanceNonTravelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CashAdvanceModel selectedItem = Get.arguments["item"];

    final EditCashAdvanceNonTravelController controller =
    Get.put(EditCashAdvanceNonTravelController())
      ..selectedItem(selectedItem);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(
          result: true,
        ),
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
              controller.updateEnableButton();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(() {
                        return CustomStatusContainer(
                          backgroundColor: greenColor,
                          status: "${controller.selectedItem.value.status}",
                        );
                      })
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Obx(() {
                    return Text(
                      controller.selectedItem.value.noCa ?? "-",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    );
                  }),
                ),
                Obx(() {
                  if (controller.selectedItem.value.codeStatusDoc.toString() ==
                      "0") {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            controller.updateOnEdit();
                          },
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(75, 30),
                          ),
                          child: controller.onEdit.value
                              ? Text("Cancel".tr)
                              : Text("Edit".tr),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        controller.onEdit.value
                            ? ElevatedButton(
                          onPressed: controller.enableButton.value
                              ? () {
                            controller.updateHeader(hideButtonAfterEdit: true);
                          }
                              : null,
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(75, 30),
                              backgroundColor: successColor),
                          child: Text("Save".tr),
                        )
                            : ElevatedButton(
                          onPressed: () {
                            controller.submitHeader();
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(75, 30),
                              backgroundColor: successColor),
                          child: Text("Submit".tr),
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                }),
                const Divider(
                  height: 20,
                  color: greyColor,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                      Obx(() {
                        return CustomTextFormField(
                            isRequired: true,
                            readOnly: !controller.onEdit.value,
                            controller: controller.eventController,
                            label: "Event".tr);
                      }),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(() {
                        return CustomTextFormField(
                            isRequired: true,
                            readOnly: true,
                            controller: controller.dateController,
                            onTap: controller.onEdit.value
                                ? () async {
                              DateTime? dateTime = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(DateTime
                                    .now()
                                    .year),
                                lastDate:
                                DateTime(DateTime
                                    .now()
                                    .year + 1),
                              );
                              controller.dateController.text =
                                  controller.dateFormat.format(dateTime!);
                            }
                                : null,
                            label: "Date".tr);
                      }),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(() {
                        if (controller.onEdit.value) {
                          return CustomDropDownFormField(
                            isRequired: true,
                            items: controller.listCurrency
                                .map((e) =>
                                DropdownMenuItem(
                                  value: e.id.toString(),
                                  child: Text(
                                      "${e.currencyName} (${e.currencyCode})"),
                                ))
                                .toList(),
                            onChanged: (item) {
                              controller.onChangeSelectedCurrency(
                                  item.toString());
                            },
                            label: "Currency".tr,
                            value: controller.selectedCurrency.value.id
                                .toString(),
                          );
                        }
                        return CustomTextFormField(
                            readOnly: true,
                            isRequired: true,
                            controller: controller.currencyController,
                            label: "Currency".tr);
                      }),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(() {
                        return CustomTextFormField(
                            readOnly: true,
                            controller: controller.totalController,
                            label: "Total".tr);
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Details Item",
                            style: listTitleTextStyle,
                          ),
                          Obx(() {
                            return controller.onEdit.value
                                ? CustomIconButton(
                              title: "Add".tr,
                              iconData: IconlyBold.plus,
                              backgroundColor: infoColor,
                              onPressed: () async {
                                final addedItem = await Get.to(
                                    const AddItemCashAdvanceNonTravelScreen());
                                if (addedItem != null) {
                                  //add item
                                  controller.addDetail(addedItem);
                                }
                              },
                            )
                                : const SizedBox();
                          }),
                        ],
                      ),
                      const Divider(
                        height: 20,
                        color: greyColor,
                      ),
                      Obx(() {
                        return controller.listDetail.isEmpty
                            ? const SizedBox()
                            : ListView(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          children: [
                            ...controller.listDetail.mapIndexed((index,
                                item) =>
                                CommonAddItem(
                                  number: "${index + 1}",
                                  title: "${item.itemName}",
                                  subtitle: item.costCenterName ?? "",
                                  nominal:
                                  "${controller.selectedItem.value
                                      .currencyCode ?? ""} ${item.nominal
                                      ?.toInt().toCurrency()}",
                                  onTap: !controller.onEdit.value
                                      ? () {
                                    Get.dialog(Dialog(
                                      child:
                                      DetailItemCashAdvanceNonTravelScreen(
                                          item: item),
                                    ));
                                  }
                                      : null,
                                  action: controller.onEdit.value
                                      ? [
                                    CustomIconButton(
                                      title: "Edit".tr,
                                      iconData: IconlyBold.edit,
                                      backgroundColor: successColor,
                                      onPressed: () async {
                                        final updatedItem =
                                        await Get.to(() =>
                                            AddItemCashAdvanceNonTravelScreen(
                                                item: item));
                                        if (updatedItem != null) {
                                          //add item
                                          controller
                                              .updateDetail(updatedItem);
                                        }
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
                                                controller
                                                    .deleteDetail(item);
                                                Get.back();
                                              },
                                            ));
                                      },
                                    )
                                  ]
                                      : [],
                                ))
                          ],
                        );
                      }),
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
  }
}
