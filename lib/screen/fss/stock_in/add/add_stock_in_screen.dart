import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_add_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/stock_in/add/add_stock_in_controller.dart';
import 'package:gais/screen/fss/stock_in/add/item_stock_in/add/add_item_stock_in_screen.dart';
import 'package:gais/screen/fss/stock_in/detail/detail_stock_in_screen.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddStockInATKScreen extends StatelessWidget {
  const AddStockInATKScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddStockInATKController controller =
        Get.put(AddStockInATKController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Stock In ATK".tr, style: appTitle),
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
              controller.updateButton();
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      controller: controller.companyController,
                      label: "Company".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      controller: controller.siteController,
                      label: "Site".tr),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Details Item".tr,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const Divider(
                    height: 20,
                    color: greyColor,
                  ),
                  Obx(
                      () => Column(
                      children: [
                        ...controller.listItem
                            .mapIndexed((index, element) => CommonAddItem(
                          number: "${index + 1}",
                          title: element.itemName,
                          subtitle: element.brand,
                          content: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Quantity".tr,
                                      style: listTitleTextStyle,
                                    ),
                                    Text(
                                      "${element.quantity}",
                                      style: listSubTitleTextStyle,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "UOM".tr,
                                      style: listTitleTextStyle,
                                    ),
                                    Text(
                                      element.uom,
                                      style: listSubTitleTextStyle,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Warehouse".tr,
                                      style: listTitleTextStyle,
                                    ),
                                    Text(
                                      element.warehouse,
                                      style: listSubTitleTextStyle,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          action: [
                            CustomIconButton(
                              title: "Edit".tr,
                              iconData: IconlyBold.edit,
                              backgroundColor: successColor,
                              onPressed: () {
                                Get.to(const AddItemStockInATKScreen());
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
                          ], nominal: '',
                        ))
                            .toList()
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final addedItem = await Get.to(
                            const AddItemStockInATKScreen());
                        if (addedItem != null) {
                          controller.addItem(addedItem);
                        }
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: infoColor),
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
                      Obx(
                        () => ElevatedButton(
                          onPressed: controller.enableButton.value
                              ? () {
                                  Get.off(const DetailStockInScreen());
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: infoColor),
                          child: Text("Book".tr),
                        ),
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
    );
  }
}
