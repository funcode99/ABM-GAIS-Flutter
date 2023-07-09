import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/pool_car/management_poolcar/add/add_management_poolcar_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddManagementPoolCarScreen extends StatelessWidget {
  const AddManagementPoolCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddManagementPoolCarController>(
        init: AddManagementPoolCarController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Management Pool Car", style: appTitle),
              leading: CustomBackButton(),
            ),
            body: Container(
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              height: Get.height,
              width: Get.width,
              decoration:
                  BoxDecoration(color: whiteColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 42,
                      width: 42,
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                      child: const Icon(IconlyBold.info_square, color: whiteColor),
                    ),
                    Text("Car Info", style: appTitle),
                    SizedBox(height: 20),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          CustomDropDownFormField(
                            items: controller.companyList
                                .map((e) => DropdownMenuItem(
                                      child: Text(e.companyName.toString()),
                                      value: e.id.toString(),
                                    ))
                                .toList(),
                            label: "Company",
                            value: controller.isEdit ? controller.selectedCompany.text : null,
                            hintText: controller.isLoading ? "Loading" : "Company",
                            isRequired: true,
                            onChanged: (value) {
                              controller.companyID = value?.toInt();
                              controller.fetchSiteList(value!.toInt());
                              controller.update();
                            },
                          ),
                          SizedBox(height: 8),
                          CustomDropDownFormField(
                            items: controller.siteList
                                .map((e) => DropdownMenuItem(
                                      child: Text(e.siteName.toString()),
                                      value: e.id.toString(),
                                    ))
                                .toList(),
                            label: "Site",
                            value: controller.isEdit ? controller.selectedSite.text : null,
                            hintText: controller.isLoadSite || controller.isLoading ? "Loading" : "Site",
                            isRequired: true,
                            onChanged: (value) {
                              controller.siteID = value?.toInt();
                              controller.update();
                            },
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.nameCar,
                            label: "Car Name",
                            isRequired: true,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.plate,
                            label: "Plate",
                            isRequired: true,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.odometer,
                            label: "Odometer (In KM)",
                            isRequired: true,
                          ),
                          SizedBox(height: 8),
                          CustomDropDownFormField(
                            items: controller.carTypeList
                                .map((e) => DropdownMenuItem(
                                      child: Text(e.typeCar.toString()),
                                      value: e.id.toString(),
                                    ))
                                .toList(),
                            label: "Car Type",
                            value: controller.isEdit ? controller.selectedCarType.text : null,
                            hintText: controller.isLoading ? "Loading..." : "Cartype",
                            isRequired: true,
                            onChanged: (value) {
                              controller.carTypeID = value?.toInt();
                              controller.update();
                            },
                          ),
                          SizedBox(height: 8),
                          CustomDropDownFormField(
                            items: [
                              DropdownMenuItem(
                                child: Text("Manual"),
                                value: "Manual",
                              ),
                              DropdownMenuItem(
                                child: Text("Automatic"),
                                value: "Automatic",
                              ),
                            ],
                            label: "Transmision",
                            value: controller.isEdit ? controller.selectedTransmision.text : null,
                            isRequired: true,
                            onChanged: (value) {
                              controller.selectedTransmision.text = value.toString();
                              controller.update();
                            },
                          ),
                          SizedBox(height: 8),
                          CustomDropDownFormField(
                            items: [
                              DropdownMenuItem(
                                child: Text('Active'),
                                value: "1",
                              ),
                              DropdownMenuItem(
                                child: Text('In Maintenance'),
                                value: "0",
                              ),
                            ],
                            label: "Status",
                            value: controller.isEdit ? controller.selectedStatus.text : null,
                            isRequired: true,
                            onChanged: (value) {
                              controller.selectedStatus.text = value.toString();
                              controller.update();
                            },
                          ),
                          SizedBox(height: 8),
                          CustomDropDownFormField(
                            items: controller.driverList
                                .map((e) => DropdownMenuItem(
                                      child: Text(e.name.toString()),
                                      value: e.id.toString(),
                                    ))
                                .toList(),
                            label: "Driver",
                            value: controller.isEdit ? controller.selectedDriver.text : null,
                            onChanged: (value) {
                              controller.driverID = value!.toInt();
                              controller.update();
                            },
                          ),
                          SizedBox(height: 8),
                          CustomFilledButton(
                            color: successColor,
                            width: Get.width / 2.5,
                            title: "Save",
                            onPressed: () {
                              if (controller.formKey.currentState?.validate() == true) {
                                controller.isEdit! ? controller.updateData() : controller.saveData();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}
