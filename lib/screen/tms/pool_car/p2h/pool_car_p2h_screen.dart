import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/pool_car/pool_car_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_add_item.dart';
import 'package:gais/reusable/radio/custom_radio_group.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/add_cash_advance_non_travel_controller.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/item_cash_advance_non_travel/add/add_item_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/tms/pool_car/p2h/pool_car_p2h_controller.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/input_formatter/min_value_text_input_formatter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class PoolCarP2HScreen extends StatelessWidget {
  const PoolCarP2HScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PoolCarModel selectedItem = Get.arguments["item"];

    final PoolCarP2HController controller =
    Get.put(PoolCarP2HController())
      ..selectedItem(selectedItem);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Formulir P2H".tr, style: appTitle),
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
                    height: 16,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      readOnly: true,
                      controller: controller.plateController,
                      label: "No Plat Kendaraan".tr),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      readOnly: true,
                      controller: controller.driverNameController,
                      label: "Driver".tr),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      controller: controller.odometerController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(8),
                        MinValueTextInputFormatter(0)
                      ],
                      inputType: TextInputType.number,
                      label: "Odometer"),
                  const SizedBox(
                    height: 12,
                  ),


                  Obx(() {
                    if (controller.listCheckItem.isEmpty) {
                      return const SizedBox();
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: controller.listCheckItem.mapIndexed(
                              (index, element) {
                            if (element.isHeader != null) {
                              if (element.isHeader! == 1) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "${element.headerName}",
                                      style: formlabelTextStyle,
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: "*",
                                            style: TextStyle(
                                                color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            } else if (element.fillable == 1) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${element.detailName}",
                                      style: listTitleTextStyle.copyWith(
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    CustomRadioGroup<int>(
                                      listLabel: element.choices!.map((e) =>
                                      e.text!).toList(),
                                      listValue: element.choices!.map((e) =>
                                      e.value!).toList(),
                                      onChanged: (value) {
                                        controller.updateChecklistValue(
                                            index, value);
                                      },
                                      selectedValue: element.value!,
                                    )
                                  ],
                                ),
                              );
                            }
                            return const SizedBox();
                          }
                      ).toList(),
                    );
                  }),


                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      multiLine: true,
                      controller: controller.noteController,
                      helperText: "Masukan catatan untuk kondisi pengecekan yang memerlukan tindakan perbaikan",
                      label: "Catatan"),
                  const SizedBox(
                    height: 12,
                  ),

                  const SizedBox(
                    height: 64,
                  ),

                  Obx(() {
                    if(controller.showButton.value){
                      return Row(
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
                            onPressed: controller.enableButton.value
                                ? () {
                              controller.saveData();
                            }
                                : null,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: successColor),
                            child: Text("Save".tr),
                          ),
                        ],
                      );
                    }

                    return SizedBox();
                  }),

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
