import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/management_item_atk/list/management_item_atk_list_screen.dart';
import 'package:gais/screen/fss/stock_in/add/item_stock_in/add/add_item_stock_in_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddItemStockInATKScreen extends StatelessWidget{
  const AddItemStockInATKScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddItemStockInATKController controller = Get.put(AddItemStockInATKController());

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
              padding: const EdgeInsets.symmetric(
                  horizontal: 32, vertical: 16),
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
                    height: 8,
                  ),
                  CustomDropDownFormField(
                    isRequired: true,
                    items: controller.listWarehouse
                        .map((e) => DropdownMenuItem(
                      value: e.id,
                      child: Text("${e.warehouseName}"),
                    ))
                        .toList(),
                    onChanged: (item) {
                      controller.onChangeSelectedWarehouse(item.toString());
                    },
                    label: "Warehouse ".tr,
                    value: controller.selectedWarehouse.id,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      controller: controller.itemController,
                      label: "Item".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDropDownFormField(
                    isRequired: true,
                    items: controller.listBrand
                        .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                        .toList(),
                    onChanged: (item) {
                      controller.onChangeSelectedBrand(item!);
                    },
                    label: "Brand".tr,
                    value: controller.selectedBrang,
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  CustomDropDownFormField(
                    isRequired: true,
                    items: controller.listUOM
                        .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                        .toList(),
                    onChanged: (item) {
                      controller.onChangeSelectedUOM(item!);
                    },
                    label: "UOM".tr,
                    value: controller.selectedUOM,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  CustomTextFormField(
                      isRequired: true,
                      inputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: controller.quantityController,
                      label: "Quantity".tr),
                  const SizedBox(
                    height: 8,
                  ),

                  CustomTextFormField(
                      multiLine: true,
                      controller: controller.remarksController,
                      label: "Remarks".tr),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                              () => ElevatedButton(
                            onPressed: controller.enableButton.value
                                ? () {
                              Get.back(
                                  result: controller.getAddedItem());
                            }
                                : null,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: successColor),
                            child: Text("Save".tr),
                          )
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
  }
}
