import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/approval_request_atk/approval_request_atk_model.dart';
import 'package:gais/data/model/master/warehouse/warehouse_detail_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/picker/custom_number_picker.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/request_atk/delivery/delivery_approval_request_atk_controller.dart';
import 'package:gais/util/enum/approval_action_enum.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class DeliveryApprovalRequestATKScreen extends StatelessWidget {
  const DeliveryApprovalRequestATKScreen(
      {Key? key, this.approvalActionEnum = ApprovalActionEnum.none})
      : super(key: key);

  final ApprovalActionEnum approvalActionEnum;

  @override
  Widget build(BuildContext context) {
    ApprovalRequestATKModel? selectedItem;
    if (Get.arguments != null) {
      selectedItem = Get.arguments["item"];
    }

    final DeliveryApprovalRequestATKController controller =
        Get.put(DeliveryApprovalRequestATKController())
          ..selectedItem(selectedItem);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("ATK Delivery".tr, style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Obx(() {
                      return controller.listDetail.isEmpty
                          ? const SizedBox()
                          : ListView(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              children: [
                                ...controller.listDetail.mapIndexed((index,
                                        item) =>
                                    CommonListItem(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 26, 16, 4),
                                      number: "${index + 1}",
                                      title: item.itemName,
                                      subtitle: "",
                                      action: [],
                                      content: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Qty Req".tr,
                                                        style:
                                                            listTitleTextStyle,
                                                      ),
                                                      Text(
                                                        "${item.qty}",
                                                        style: listSubTitleTextStyle
                                                            .copyWith(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Qty App".tr,
                                                        style:
                                                        listTitleTextStyle,
                                                      ),
                                                      Text(
                                                        "${item.qtyApproved}",
                                                        style: listSubTitleTextStyle
                                                            .copyWith(
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "UOM".tr,
                                                        style:
                                                            listTitleTextStyle,
                                                      ),
                                                      Text(
                                                        item.uomName ?? "-",
                                                        style: listSubTitleTextStyle
                                                            .copyWith(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 32,
                                            ),
                                            if (controller
                                                .listDetailWarehouse("${item.id}")
                                                .isNotEmpty)
                                              Column(
                                                children: controller
                                                    .listDetailWarehouse("${item.id}")
                                                    .mapIndexed<Widget>(
                                                        (int index, e) {
                                                  return Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(vertical: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Expanded(
                                                          child: ListTile(
                                                            title: Text(
                                                                "${e.warehouseName}"),
                                                            subtitle: Text(
                                                                "Qty approved ${e.maxValue}"),
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ),
                                                        CustomNumberPicker(
                                                            minValue: 0,
                                                            maxValue: e.maxValue,
                                                            onChanged: (val) {
                                                              controller.addQuantity(val, "${item.id}", e);
                                                            },
                                                            currentValue: e.qtyApproved ?? 0,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ))
                              ],
                            );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      label: "Notes".tr,
                      controller: controller.noteController,
                      multiLine: true,
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
                          onPressed: () {
                            controller.confirm();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: infoColor),
                          child: Text("Deliver".tr),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}
