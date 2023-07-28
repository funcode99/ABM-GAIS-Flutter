import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
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
import 'package:gais/reusable/list/approval_log_list.dart';
import 'package:gais/reusable/list_item/common_add_item.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/item_cash_advance_non_travel/add/add_item_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/item_cash_advance_non_travel/detail/detail_item_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/edit/edit_cash_advance_non_travel_controller.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/enum/tab_enum.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Card(
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: () {
              controller.updateEnableButton();
            },
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
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
                              ?.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        );
                      }),
                    ),
                    Obx(() {
                      if (controller.selectedItem.value.codeStatusDoc
                          .toString() ==
                          CashAdvanceNonTravelEnum.draft.value.toString() ||
                          controller.selectedItem.value.codeStatusDoc
                              .toString() ==
                              CashAdvanceNonTravelEnum.revision.value
                                  .toString()) {
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
                                controller.updateHeader(
                                    hideButtonAfterEdit: true);
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
                                  backgroundColor: orangeColor),
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
                                  DateTime? dateTime =
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:
                                    DateTime(DateTime
                                        .now()
                                        .year),
                                    lastDate:
                                    DateTime(DateTime
                                        .now()
                                        .year + 1),
                                  );
                                  controller.dateController.text =
                                      controller.dateFormat
                                          .format(dateTime!);
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
                                items: controller.listCostCenter
                                    .map((e) =>
                                    DropdownMenuItem(
                                      value: e.id.toString(),
                                      child: Text(
                                          "${e.costCenterName} (${e
                                              .costCenterCode})"),
                                    ))
                                    .toList(),
                                onChanged: (item) {
                                  controller.onChangeSelectedCostCenter(
                                      item.toString());
                                },
                                label: "Cost Center".tr,
                                value: controller.selectedCostCenter.value.id
                                    .toString(),
                              );
                            }
                            return CustomTextFormField(
                                readOnly: true,
                                isRequired: true,
                                controller: controller.costCenterController,
                                label: "Cost Center".tr);
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
                                          "${e.currencyName} (${e
                                              .currencyCode})"),
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
                          CustomTextFormField(
                              readOnly: true,
                              controller: controller.totalController,
                              label: "Total".tr),
                          const SizedBox(
                            height: 16,
                          ),
                          const SizedBox(
                            height: 32,
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 60,
                    maxHeight: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                            spreadRadius: 1,
                            offset: const Offset(0, 4),
                          )
                        ],
                        color: infoColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Obx(() {
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 10, left: 5),
                                width: 100,
                                decoration: BoxDecoration(
                                  color: controller.selectedTab.value ==
                                      TabEnum.detail
                                      ? whiteColor
                                      : neutralColor,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      topLeft: Radius.circular(8)),
                                  gradient: LinearGradient(stops: const [
                                    0.1,
                                    0
                                  ], colors: [
                                    controller.selectedTab.value ==
                                        TabEnum.detail
                                        ? blackColor
                                        : whiteColor,
                                    Colors.white
                                  ]),
                                ),
                                child: const Text("Detail"),
                              );
                            }),
                            onTap: () {
                              controller.selectedTab(TabEnum.detail);
                            },
                          ),
                          Obx(() {
                            if(controller.selectedItem.value.codeStatusDoc != CashAdvanceNonTravelEnum.draft.value){
                              return GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                      top: 10, left: 5),
                                  decoration: BoxDecoration(
                                    color: controller.selectedTab.value ==
                                        TabEnum.approval
                                        ? whiteColor
                                        : neutralColor,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        topLeft: Radius.circular(8)),
                                    gradient: LinearGradient(stops: const [
                                      0.1,
                                      0
                                    ], colors: [
                                      controller.selectedTab.value ==
                                          TabEnum.approval
                                          ? blackColor
                                          : whiteColor,
                                      Colors.white
                                    ]),
                                  ),
                                  child: const Text("Approval Info"),
                                ),
                                onTap: () {
                                  controller.selectedTab(TabEnum.approval);
                                },
                              );
                            }
                            return const SizedBox();
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() {
                      return controller.onEdit.value
                          ? Container(
                        margin:
                        const EdgeInsets.only(right: 8, bottom: 8),
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          width: 100,
                          child: CustomIconButton(
                            title: "Add".tr,
                            iconData: IconlyBold.plus,
                            backgroundColor: infoColor,
                            onPressed: () async {
                              final addedItem = await Get.to(
                                  AddItemCashAdvanceNonTravelScreen(idCostCenter: controller.selectedItem.value.idCostCenter,));
                              if (addedItem != null) {
                                //add item
                                controller.addDetail(addedItem);
                              }
                            },
                          ),
                        ),
                      )
                          : const SizedBox();
                    }),
                    Obx(() {
                      if (controller.selectedTab.value == TabEnum.detail) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Obx(() {
                            return controller.listDetail.isEmpty
                                ? const SizedBox()
                                : ListView(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              children: [
                                ...controller.listDetail.mapIndexed(
                                        (index, item) =>
                                        CommonAddItem(
                                          number: "${index + 1}",
                                          title: "${item.itemName}",
                                          subtitle:
                                          item.costCenterCode ?? "",
                                          nominal:
                                          "${controller.selectedItem.value
                                              .currencyCode ?? ""} ${item
                                              .nominal?.toInt().toCurrency()}",
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
                                              iconData:
                                              IconlyBold.edit,
                                              backgroundColor:
                                              successColor,
                                              onPressed: () async {
                                                final updatedItem =
                                                await Get.to(() =>
                                                    AddItemCashAdvanceNonTravelScreen(
                                                        item:
                                                        item));
                                                if (updatedItem !=
                                                    null) {
                                                  //add item
                                                  controller
                                                      .updateDetail(
                                                      updatedItem);
                                                }
                                              },
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            CustomIconButton(
                                              title: "Delete".tr,
                                              iconData:
                                              IconlyBold.delete,
                                              backgroundColor:
                                              redColor,
                                              onPressed: () {
                                                Get.dialog(
                                                    DeleteConfirmationDialog(
                                                      onDeletePressed:
                                                          () {
                                                        Get.close(1);
                                                        controller
                                                            .deleteDetail(
                                                            item);
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
                        );
                      } else if (controller.selectedTab.value ==
                          TabEnum.approval) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Obx(() {
                            return controller.listLogApproval.isEmpty
                                ? const SizedBox()
                                : ApprovalLogList(
                              list: controller.listLogApproval,
                              waitingApprovalValue:
                              CashAdvanceNonTravelEnum
                                  .waitingApproval.value,
                            );
                          }),
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
                    const SizedBox(
                      height: 32,
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}
