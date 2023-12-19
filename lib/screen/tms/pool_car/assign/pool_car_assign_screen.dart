import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/pool_car/pool_car_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/pool_car/assign/pool_car_assign_controller.dart';
import 'package:get/get.dart';

class PoolCarAssignScreen extends StatelessWidget {
  const PoolCarAssignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PoolCarModel? selectedItem;

    if (Get.arguments != null) {
      selectedItem = Get.arguments["item"];
    }

    final PoolCarAssignController controller =
    Get.put(PoolCarAssignController())
      ..selectedItem(selectedItem);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Assign Car and Driver".tr, style: appTitle),
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
                    height: 32,
                  ),
                  CustomTextFormField(
                      isRequired: false,
                      readOnly: true,
                      controller: controller.requestorController,
                      label: "Requestor".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: false,
                      readOnly: true,
                      controller: controller.fromDateController,
                      label: "From Date".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: false,
                      readOnly: true,
                      controller: controller.toDateController,
                      label: "To Date".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    return CustomDropDownFormField(
                      isRequired: true,
                      items: controller.listCar
                          .map((e) => DropdownMenuItem(
                        value: e.id.toString(),
                        child: Text("${e.carName} - ${e.plate}"),
                      ))
                          .toList(),
                      onChanged: (item) {
                        controller.onChangeSelectedCar(item.toString());
                      },
                      hintText: "Car",
                      label: "Car".tr,
                      value: controller.selectedCar.value?.id.toString(),
                    );
                  }),

                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    return CustomDropDownFormField(
                      isRequired: true,
                      items: controller.listDriver
                          .map((e) => DropdownMenuItem(
                        value: e.id.toString(),
                        child: Text("${e.name}"),
                      ))
                          .toList(),
                      onChanged: (item) {
                        controller.onChangeSelectedDriver(item.toString());
                      },
                      hintText: "Driver",
                      label: "Driver".tr,
                      value: controller.selectedDriver.value?.id.toString(),
                    );
                  }),

                  const SizedBox(
                    height: 32,
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
                      Obx(() => ElevatedButton(
                        onPressed: controller.enableButton.value
                            ? () {
                            Get.back(result: controller.assign());
                        }
                            : null,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: infoColor),
                        child: Text("Assign".tr),
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
