import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/master/warehouse/warehouse_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/management_item_atk/add/add_management_item_atk_controller.dart';
import 'package:gais/util/input_formatter/min_value_text_input_formatter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddManagementItemATKScreen extends StatelessWidget {
  const AddManagementItemATKScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddManagementItemATKController controller =
    Get.put(AddManagementItemATKController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: (){
            Get.back(result: true);
          },
        ),
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

                  RichText(
                    text: TextSpan(
                      text: "Warehouse".tr,
                      style: formlabelTextStyle,
                      children: const <TextSpan>[
                        TextSpan(
                            text: "*", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: controller.showWarehouseError.value
                              ? Colors.redAccent
                              : Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Wrap(
                        runSpacing: 8,
                        runAlignment: WrapAlignment.center,
                        children: [
                          ...controller.listSelectedWarehouse
                              .mapIndexed((index, item) => Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.0),
                              ),
                              color: Color(0xFFe4e4e4),
                            ),
                            margin: const EdgeInsets.only(
                                right: 5.0, left: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  child: Text(
                                    item.warehouseName ?? "",
                                    style: listSubTitleTextStyle,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                InkWell(
                                  child: const Icon(
                                    Icons.cancel,
                                    size: 14.0,
                                    color: greyColor,
                                  ),
                                  onTap: () {
                                    controller
                                        .deleteWarehouseItem(item);
                                    controller.update();
                                    controller.updateButton();
                                  },
                                )
                              ],
                            ),
                          ))
                              .toList(),
                          SizedBox(
                            width: double.infinity,
                            child: TypeAheadFormField<WarehouseModel>(
                              textFieldConfiguration: TextFieldConfiguration(
                                controller: controller.autocompleteController,
                                autofocus: false,
                                style: Theme.of(context).textTheme.titleMedium,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Warehouse".tr,
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0, vertical: 4.0),
                                    errorText: null,
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      gapPadding: 0,
                                    ),
                                    errorStyle: const TextStyle(height: 0)),
                              ),
                              suggestionsCallback: (pattern) {
                                final list = controller.getWarehouseByKeyword(pattern);
                                return list;
                              },
                              itemBuilder: (context, suggestion) {
                                return ListTile(
                                  title: Text("${suggestion.warehouseName}"),
                                );
                              },
                              onSuggestionSelected: (suggestion) {
                                controller.listSelectedWarehouse.add(suggestion);
                                controller.updateButton();
                                controller.autocompleteController.text = "";
                              },
                              debounceDuration: const Duration(milliseconds: 500),
                              hideOnLoading: true,
                              hideSuggestionsOnKeyboardHide: false,
                              keepSuggestionsOnLoading: false,
                              minCharsForSuggestions: 0,
                              validator: (value) {
                                print("LENGTH ${controller.listSelectedWarehouse.length}");
                                controller.showWarehouseError(
                                    controller.listSelectedWarehouse
                                        .isEmpty);

                                if(controller.listSelectedWarehouse
                                    .isEmpty){
                                  return "";
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      validator: ValidationBuilder().required().maxLength(9).minLength(9).build(),
                      suffixIcon: IconButton(
                        onPressed: (){
                          controller.generateRandom();
                        },
                        icon: const Icon(Icons.add_box_outlined),
                      ),
                      isRequired: true,
                      readOnly: false,
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
                  /*Obx(() {
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
                  }),*/
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
                                    controller.saveData();
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
