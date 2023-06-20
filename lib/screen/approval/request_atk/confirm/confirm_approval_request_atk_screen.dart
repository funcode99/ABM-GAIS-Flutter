import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/approval_request_atk/approval_request_atk_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/picker/custom_number_picker.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/request_atk/confirm/confirm_approval_request_atk_controller.dart';
import 'package:gais/util/enum/approval_action_enum.dart';
import 'package:get/get.dart';

class ConfirmApprovalRequestATKScreen extends StatefulWidget {
  const ConfirmApprovalRequestATKScreen(
      {Key? key, this.approvalActionEnum = ApprovalActionEnum.none})
      : super(key: key);

  final ApprovalActionEnum approvalActionEnum;

  @override
  State<ConfirmApprovalRequestATKScreen> createState() =>
      _ConfirmApprovalRequestATKScreenState();
}

class _ConfirmApprovalRequestATKScreenState
    extends State<ConfirmApprovalRequestATKScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                          ...controller.listDetail
                              .mapIndexed((index, item) =>
                              CommonListItem(
                                padding: const EdgeInsets.fromLTRB(
                                    16, 26, 16, 4),
                                number: "${index + 1}",
                                title: item.itemName,
                                subtitle: item.brandName ?? "-",
                                action: [],
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
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
                                                  style: listTitleTextStyle,
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
                                                  style: listTitleTextStyle,
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
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Warehouse".tr,
                                                  style: listTitleTextStyle,
                                                ),
                                                Text(
                                                  item.warehouseName ?? "-",
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
                                      Obx(() {
                                        return CustomNumberPicker(
                                            minValue: 0,
                                            maxValue: item.qty ?? 0,
                                            onChanged: (val) {
                                              controller.listEditedDetail[index].qty = val;
                                              controller.listEditedDetail.refresh();
                                            },
                                            currentValue: controller.listEditedDetail[index].qty ?? 0
                                        );
                                      })
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
                            Get.back(
                                result: ApprovalModel(
                                    notes: controller.noteController.text,
                                    arrayDetail: controller.listEditedDetail.map((element) => element.toJson()).toList()
                                )
                            );
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
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
