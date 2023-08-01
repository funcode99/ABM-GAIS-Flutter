import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
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
              leading: const CustomBackButton(),
            ),
            body: Container(
              margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              height: Get.height,
              width: Get.width,
              decoration:
                  const BoxDecoration(color: whiteColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))),
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
                    const SizedBox(height: 20),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          CustomDropDownFormField(
                            items: controller.companyList
                                .map((e) => DropdownMenuItem(
                                      value: e.id.toString(),
                                      child: Text(e.companyName.toString()),
                                    ))
                                .toList(),
                            label: "Company",
                            value: controller.isEdit ? controller.selectedCompany.text : null,
                            hintText: controller.isLoading ? "Loading" : "Company",
                            isRequired: true,
                            onChanged: (value) {
                              controller.companyID = value;
                              controller.fetchSiteList(value!.toInt());
                              controller.update();
                            },
                          ),
                          const SizedBox(height: 8),
                          CustomDropDownFormField(
                            items: controller.siteList
                                .map((e) => DropdownMenuItem(
                                      value: e.id.toString(),
                                      child: Text(e.siteName.toString()),
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
                          const SizedBox(height: 8),


                          CustomDropDownFormField(
                            items: controller.typeList
                                .map((e) => DropdownMenuItem(
                              value: e.toString(),
                              child: Text(e == 1 ? "Asset" : "Contract"),
                            ))
                                .toList(),
                            label: "Type",
                            value: controller.selectedType,
                            isRequired: true,
                            onChanged: (value) {
                              controller.selectedType = value.toString();
                              controller.update();
                            },
                          ),
                          const SizedBox(height: 8),

                          if(controller.selectedType == "2")
                            CustomTextFormField(
                                isRequired: true,
                                suffixIcon: const Icon(IconlyLight.calendar),
                                onTap: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now().subtract(const Duration(days: 365 * 10)),
                                      lastDate: DateTime.now().add(const Duration(days: 365 * 10)))
                                      .then((date) {
                                    if (date != null) {
                                      controller.startDate.value = date;
                                      controller.startDateController.text = controller.dateFormat.format(date);
                                      if(controller.endDate.value != null){
                                        if(controller.startDate.value!.isAfter(controller.endDate.value!)){
                                          controller.endDate.value = null;
                                          controller.endDateController.text = "";
                                        }
                                      }
                                      controller.update();
                                    }
                                  });
                                },
                                controller: controller.startDateController,
                                label: "Start Date".tr),
                          if(controller.selectedType == "2") const SizedBox(
                            height: 8,
                          ),

                          if(controller.selectedType == "2")
                            CustomTextFormField(
                              isRequired: true,
                              suffixIcon: const Icon(IconlyLight.calendar),
                              onTap: () {
                                if(controller.startDate.value == null){
                                  Get.showSnackbar(
                                    CustomGetSnackBar(
                                        message: "Please start date first",
                                        backgroundColor: redColor),
                                  );
                                }else{
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  showDatePicker(
                                      context: context,
                                      initialDate: controller.startDate.value!,
                                      firstDate: controller.startDate.value!,
                                      lastDate: controller.startDate.value!.add(const Duration(days: 365)))
                                      .then((date) {
                                    if (date != null) {
                                      controller.endDate.value = date;
                                      controller.endDateController.text = controller.dateFormat.format(date);
                                      controller.update();
                                    }
                                  });
                                }

                              },
                              controller: controller.endDateController,
                              label: "End Date".tr),
                          if(controller.selectedType == "2") const SizedBox(
                            height: 8,
                          ),

                          if(controller.selectedType == "1")
                            CustomTextFormField(
                            controller: controller.assetNumberController,
                            label: "Asset No",
                            isRequired: true,
                          ),
                          if(controller.selectedType == "1")
                            const SizedBox(height: 8),

                          if(controller.selectedType == "2")
                            CustomTextFormField(
                            controller: controller.vendorNameController,
                            label: "Vendor Name",
                            isRequired: true,
                          ),
                          if(controller.selectedType == "2")
                            const SizedBox(height: 8),

                          CustomTextFormField(
                            controller: controller.nameCar,
                            label: "Car Name",
                            isRequired: true,
                          ),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.plate,
                            label: "Plate",
                            isRequired: true,
                          ),
                          const SizedBox(height: 8),

                          CustomTextFormField(
                            controller: controller.hullNumberController,
                            label: "Hull No",
                            isRequired: false,
                          ),
                          const SizedBox(height: 8),

                          CustomTextFormField(
                            controller: controller.odometer,
                            label: "Odometer (In KM)",
                            isRequired: true,
                          ),
                          const SizedBox(height: 8),
                          CustomDropDownFormField(
                            items: controller.carTypeList
                                .map((e) => DropdownMenuItem(
                                      value: e.id.toString(),
                                      child: Text(e.typeCar.toString()),
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
                          const SizedBox(height: 8),
                          CustomDropDownFormField(
                            items: const [
                              DropdownMenuItem(
                                value: "Manual",
                                child: Text("Manual"),
                              ),
                              DropdownMenuItem(
                                value: "Automatic",
                                child: Text("Automatic"),
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
                          const SizedBox(height: 8),
                          CustomDropDownFormField(
                            items: const [
                              DropdownMenuItem(
                                value: "1",
                                child: Text('Active'),
                              ),
                              DropdownMenuItem(
                                value: "0",
                                child: Text('In Maintenance'),
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
                          const SizedBox(height: 8),
                          CustomDropDownFormField(
                            items: controller.driverList
                                .map((e) => DropdownMenuItem(
                                      value: e.id.toString(),
                                      child: Text(e.name.toString()),
                                    ))
                                .toList(),
                            label: "Driver",
                            value: controller.isEdit ? controller.selectedDriver.text : null,
                            onChanged: (value) {
                              controller.driverID = value!.toInt();
                              controller.update();
                            },
                          ),
                          const SizedBox(height: 8),


                          CustomTextFormField(
                              isRequired: true,
                              suffixIcon: const Icon(IconlyLight.calendar),
                              onTap: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 365)))
                                    .then((date) {
                                  if (date != null) {
                                    controller.vehicleRegistrationDate.value = date;
                                    controller.vehicleRegistrationDateController.text = controller.dateFormat.format(date);
                                    controller.update();
                                  }
                                });
                              },
                              controller: controller.vehicleRegistrationDateController,
                              label: "Vehicle Registration Date".tr),
                          const SizedBox(
                            height: 8,
                          ),

                          CustomTextFormField(
                              isRequired: true,
                              suffixIcon: const Icon(IconlyLight.calendar),
                              onTap: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 365)))
                                    .then((date) {
                                  if (date != null) {
                                    controller.plateExpiredDate.value = date;
                                    controller.plateExpiredDateController.text = controller.dateFormat.format(date);
                                    controller.update();
                                  }
                                });
                              },
                              controller: controller.plateExpiredDateController,
                              label: "Plate Registration Expired Date".tr),
                          const SizedBox(
                            height: 8,
                          ),


                          CustomTextFormField(
                              isRequired: false,
                              suffixIcon: const Icon(IconlyLight.calendar),
                              onTap: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 365)))
                                    .then((date) {
                                  if (date != null) {
                                    controller.kirRegistrationDate.value = date;
                                    controller.kirRegistrationDateController.text =
                                        controller.dateFormat.format(date);
                                    controller.update();
                                  }
                                });
                              },
                              controller: controller.kirRegistrationDateController,
                              label: "KIR Registration".tr),
                          const SizedBox(
                            height: 8,
                          ),

                          CustomTextFormField(
                              isRequired: false,
                              suffixIcon: const Icon(IconlyLight.calendar),
                              onTap: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 365)))
                                    .then((date) {
                                  if (date != null) {
                                    controller.stickerExpiredDate.value = date;
                                    controller.stickerExpiredDateController.text = controller.dateFormat.format(date);
                                    controller.update();
                                  }
                                });
                              },
                              controller: controller.stickerExpiredDateController,
                              label: "Stickers Expired Date".tr),
                          const SizedBox(
                            height: 8,
                          ),


                          CustomFilledButton(
                            color: successColor,
                            width: Get.width / 2.5,
                            title: "Save",
                            onPressed: () {
                              if (controller.formKey.currentState?.validate() == true) {
                                controller.isEdit? controller.updateData() : controller.saveData();
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
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
