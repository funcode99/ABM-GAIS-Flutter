import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/management_item_atk/edit/edit_management_item_atk_controller.dart';
import 'package:gais/util/input_formatter/min_value_text_input_formatter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class EditManagementItemATKScreen extends StatelessWidget {
  const EditManagementItemATKScreen({super.key, required this.item});

  final ManagementItemATKModel item;
  @override
  Widget build(BuildContext context) {
    final EditManagementItemATKController controller =
    Get.put(EditManagementItemATKController())..managementItemATK(item);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Management Item ATK".tr, style: appTitle),
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
                  CustomTextFormField(
                      isRequired: true,
                      readOnly: true,
                      controller: controller.companyController,
                      label: "Company".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      readOnly: true,
                      controller: controller.siteController,
                      label: "Site".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
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
                      label: "Warehouse ".tr,
                      value: controller.selectedWarehouse.value.id.toString(),
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      readOnly: true,
                      controller: controller.idController,
                      label: "ID Item".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      controller: controller.itemController,
                      label: "Item Name".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    return CustomDropDownFormField(
                      isRequired: true,
                      items: controller.listBrand
                          .map((item) =>
                          DropdownMenuItem(
                            value: item.id.toString(),
                            child: Text("${item.brandName}"),
                          ))
                          .toList(),
                      onChanged: (item) {
                        controller.onChangeSelectedBrand(item.toString());
                      },
                      label: "Brand".tr,
                      value: controller.selectedBrand.value.id.toString(),
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    return CustomDropDownFormField(
                      isRequired: true,
                      items: controller.listUOM
                          .map((item) =>
                          DropdownMenuItem(
                            value: item.id.toString(),
                            child: Text("${item.uomName}"),
                          ))
                          .toList(),
                      onChanged: (item) {
                        controller.onChangeSelectedUOM(item.toString());
                      },
                      label: "UOM".tr,
                      value: controller.selectedUOM.value.id.toString(),
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      inputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                        MinValueTextInputFormatter(0)
                      ],
                      controller: controller.alertQuantityController,
                      label: "Alert Quantity".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      multiLine: true,
                      controller: controller.remarksController,
                      label: "Description".tr),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => ElevatedButton(
                        onPressed: controller.enableButton.value
                            ? () {
                          controller.updateData();
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
