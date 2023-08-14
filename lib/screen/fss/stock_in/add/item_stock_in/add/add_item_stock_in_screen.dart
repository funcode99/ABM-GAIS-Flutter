import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_detail_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/stock_in/add/item_stock_in/add/add_item_stock_in_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/input_formatter/min_value_text_input_formatter.dart';
import 'package:gais/util/validator/custom_validation_builder.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddItemStockInATKScreen extends StatelessWidget {
  const AddItemStockInATKScreen({super.key, this.item});

  final Map<String, dynamic>? item;

  @override
  Widget build(BuildContext context) {
    final AddItemStockInATKController controller =
        Get.put(AddItemStockInATKController())..mapItem(item);

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
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: infoColor, shape: BoxShape.circle),
                      child: const Icon(
                        IconlyBold.info_square,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "ATK Info".tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  /*Obx(() {
                    return CustomDropDownFormField(
                      isRequired: true,
                      items: controller.listWarehouse
                          .map((e) =>
                          DropdownMenuItem(
                            value: e.id.toString(),
                            child: Text("${e.warehouseName}"),
                          ))
                          .toList(),
                      onChanged: (item) {
                        controller.onChangeSelectedWarehouse(item.toString());
                      },
                      label: "ATK Warehouse ".tr,
                      value: controller.selectedWarehouse.value.id.toString(),
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),*/
                  Obx(() {
                    return CustomDropDownFormField(
                      isRequired: true,
                      items: controller.listItem
                          .map((e) => DropdownMenuItem(
                                value: e.id != null ? e.id.toString() : "",
                                child: Text(e.codeItem != null
                                    ? "${e.codeItem} - ${e.itemName}"
                                    : "${e.itemName}"),
                              ))
                          .toList(),
                      onChanged: (item) {
                        controller.onChangeSelectedItemId(item.toString());
                      },
                      label: "Item".tr,
                      value: controller.selectedItem.value?.id != null
                          ? controller.selectedItem.value?.id.toString()
                          : "",
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  /*CustomTextFormField(
                      isRequired: true,
                      readOnly: true,
                      controller: controller.brandController,
                      label: "Brand".tr),
                  const SizedBox(
                    height: 8,
                  ),*/

                  CustomTextFormField(
                      isRequired: true,
                      readOnly: true,
                      controller: controller.uomController,
                      label: "UOM".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  /*CustomTextFormField(
                      isRequired: true,
                      inputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                        MinValueTextInputFormatter(0)
                      ],
                      validator:
                          ValidationBuilder().required().max(999).build(),
                      controller: controller.quantityController,
                      label: "Quantity".tr),
                  const SizedBox(
                    height: 8,
                  ),*/
                  CustomTextFormField(
                      multiLine: true,
                      controller: controller.remarksController,
                      label: "Remarks".tr),
                  const SizedBox(
                    height: 32,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Quantity ATK Warehouse".tr,
                      style: formlabelTextStyle,
                      children: const <TextSpan>[
                        TextSpan(
                            text: "*", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(),
                  Obx(() {
                    return Column(
                      children: controller.listStockInATKDetailModel
                          .mapIndexed((index, item) {
                        return Container(
                          margin:  EdgeInsets.symmetric(vertical: 4),
                          child: CustomTextFormField(
                            multiLine: false,
                            isRequired: false,
                            onChanged: (String value) {
                              controller.listStockInATKDetailModel[index].qty = value.toInt();
                            },
                            inputType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(5),
                              MinValueTextInputFormatter(0)
                            ],
                            label: "${item.warehouseName}",
                            controller: controller.listQuantityController[index],
                          ),
                        );
                      }).toList(),
                    );
                  }),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => ElevatedButton(
                            onPressed: controller.enableButton.value
                                ? () {
                                    Get.back(result: controller.getAddedItem());
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: successColor),
                            child: Text("Save".tr),
                          )),
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
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}
