import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/approval_model.dart';
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
import 'package:gais/screen/approval/request_atk/confirm/confirm_approval_request_atk_controller.dart';
import 'package:gais/util/enum/approval_action_enum.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ConfirmApprovalRequestATKScreen extends StatelessWidget {
  const ConfirmApprovalRequestATKScreen(
      {Key? key, this.approvalActionEnum = ApprovalActionEnum.none})
      : super(key: key);

  final ApprovalActionEnum approvalActionEnum;

  @override
  Widget build(BuildContext context) {
    ApprovalRequestATKModel? selectedItem;
    if (Get.arguments != null) {
      selectedItem = Get.arguments["item"];
    }

    final ConfirmApprovalRequestATKController controller =
        Get.put(ConfirmApprovalRequestATKController())
          ..selectedItem(selectedItem);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("ATK Confirmation".tr, style: appTitle),
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
                                                        "Quantity".tr,
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
                                                .listSelected("${item.id}")
                                                .isNotEmpty)
                                              Column(
                                                children: controller
                                                    .listSelected("${item.id}")
                                                    .mapIndexed<Widget>(
                                                        (int index, e) {
                                                  final int maxValue = e.stockAvailable;
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
                                                                "Available Stock : ${e.stockAvailable}"),
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ),
                                                        CustomNumberPicker(
                                                            minValue: 0,
                                                            maxValue: controller.mapMaxValue["${item.id}"]["${e.idWarehouse}"],
                                                            onChanged: (val) {
                                                              controller.addQuantity(val, "${item.id}", e);
                                                            },
                                                            currentValue: e.qtyApproved ?? 0,
                                                        ),
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              controller.deleteWarehouse("${item.id}", e);
                                                            },
                                                            child: const Icon(
                                                                Icons.delete, color: redColor,))

                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            if (controller
                                                .listNotSelected("${item.id}")
                                                .isNotEmpty)
                                              SizedBox(
                                                width: 80,
                                                child: CustomIconButton(
                                                  title: "Add".tr,
                                                  iconData: Icons.add,
                                                  backgroundColor: successColor,
                                                  onPressed: () async {
                                                    WarehouseDetailModel?
                                                        result =
                                                        await Get.dialog(
                                                            SelectWarehouse(
                                                      list: controller
                                                          .listNotSelected(
                                                              "${item.id}"),
                                                    ));
                                                    if (result != null) {
                                                      controller.addWarehouse(
                                                          "${item.id}", result);
                                                    }
                                                  },
                                                ),
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
                          child: Text("Confirm".tr),
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

class SelectWarehouse extends StatefulWidget {
  const SelectWarehouse({super.key, required this.list});

  final List<WarehouseDetailModel> list;

  @override
  State<SelectWarehouse> createState() => _SelectWarehouseState();
}

class _SelectWarehouseState extends State<SelectWarehouse> {
  dynamic selected;

  @override
  void initState() {
    super.initState();
    setState(() {
      selected = widget.list.first.idWarehouse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Select Warehouse".tr,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(IconlyBold.close_square),
                  color: Colors.red,
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            CustomDropDownFormField(
              items: widget.list
                  .map((e) => DropdownMenuItem(
                        value: e.idWarehouse.toString(),
                        child: Text(
                            "${e.warehouseName} - (stock : ${e.stockAvailable})"),
                      ))
                  .toList(),
              label: "Select Warehouse",
              isRequired: true,
              value: widget.list.first.idWarehouse.toString(),
              onChanged: (value) {
                setState(() {
                  selected = value;
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Cancel".tr))),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back(
                          result: widget.list
                              .where((element) =>
                                  element.idWarehouse.toString() ==
                                  selected.toString())
                              .first);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: infoColor),
                    child: Text("Select".tr),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
