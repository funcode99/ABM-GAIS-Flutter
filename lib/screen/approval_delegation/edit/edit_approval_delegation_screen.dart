import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/approval_delegation/approval_delegation_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval_delegation/edit/edit_approval_delegation_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class EditApprovalDelegationScreen extends StatelessWidget {
  const EditApprovalDelegationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApprovalDelegationModel? selectedItem;
    if (Get.arguments != null) {
      if(Get.arguments is Map){
        selectedItem = Get.arguments["item"];
      }
    }

    final EditApprovalDelegationController controller =
    Get.put(EditApprovalDelegationController())
      ..selectedItem(selectedItem);


    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Approval Delegation".tr, style: appTitle),
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
                      readOnly: true,
                      controller: controller.delegatorController,
                      label: "Delegator".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    return CustomDropDownFormField(
                      items: controller.listDelegateTo
                          .map((e) => DropdownMenuItem(
                        value: e.id.toString(),
                        child: Text("${e.employeeName}"),
                      ))
                          .toList(),
                      onChanged: (item) {
                        controller
                            .onChangeSelectedDelegateTo(item.toString());
                      },
                      label: "Delegate To".tr,
                      value: controller.selectedDelegateTo.value != null
                          ? controller.selectedDelegateTo.value?.id.toString()
                          : "",
                    );
                  }),
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
                            initialDate: controller.startDate.value != null ? controller.startDate.value! : DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now()
                                .add(const Duration(days: 365)))
                            .then((date) {
                          if(date!=null){
                            if(controller.endDate.value != null){
                              if(date.isAfter(controller.endDate.value!)){
                                controller.endDate.value = null;
                                controller.activeToDateController.text = "";
                              }
                            }
                            controller.startDate.value = date;
                            controller.activeFromDateController.text = controller
                                .dateFormat.format(date);
                            controller.update();
                          }
                        });
                      },
                      controller: controller.activeFromDateController,
                      label: "Active From".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      suffixIcon: const Icon(IconlyLight.calendar),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (controller.startDate.value == null) {
                          Get.showSnackbar(CustomGetSnackBar(
                              message: "Please choose active from date first",
                              backgroundColor: Colors.red));
                        } else {
                          showDatePicker(
                              context: context,
                              initialDate: controller.endDate.value != null ? controller.endDate.value! : controller.startDate.value!,
                              firstDate: controller.startDate.value!,
                              lastDate: controller.startDate.value!.add(
                                  const Duration(days: 365)))
                              .then((date) {
                                if(date!=null){
                                  controller.endDate.value = date;
                                  controller.activeToDateController.text =
                                      controller.dateFormat.format(date);
                                }
                          });
                        }
                      },
                      controller: controller.activeToDateController,
                      label: "Active To".tr),
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
                      Obx(() =>
                          ElevatedButton(
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
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
