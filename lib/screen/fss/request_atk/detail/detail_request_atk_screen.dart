import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/request_atk/detail/detail_request_atk_controller.dart';
import 'package:get/get.dart';

class RequestATKDetailScreen extends StatelessWidget {
  const RequestATKDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestATKDetailController>(
        init: RequestATKDetailController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              leading: const CustomBackButton(),
              backgroundColor: whiteColor,
              title: Text("ATK Request".tr, style: appTitle),
              centerTitle: true,
              flexibleSpace: const TopBar(),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Card(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomStatusContainer(
                              backgroundColor: greenColor,
                              status: "Completed".tr,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "OUT-ABM/1859/23.03",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(
                        height: 20,
                        color: greyColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                                readOnly: true,
                                isRequired: true,
                                controller: controller.createdDateController,
                                label: "Created Date".tr),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                readOnly: true,
                                isRequired: true,
                                controller: controller.createdByController,
                                label: "Created By".tr),
                            const SizedBox(
                              height: 64,
                            ),

                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 7,
                                spreadRadius: 1,
                                offset: const Offset(0, 4),
                            )
                          ],
                          color: infoColor,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 10, left: 5),
                              width: 100,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                                gradient: LinearGradient(
                                    stops: [0.1, 0],
                                    colors: [blackColor, whiteColor]),
                              ),
                              child: const Text("Detail"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            child: Column(
                              children: [
                                CustomTextFormField(
                                    readOnly: true,
                                    controller: controller.itemController,
                                    label: "Item".tr),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomTextFormField(
                                    readOnly: true,
                                    controller: controller.brandController,
                                    label: "Brand".tr),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomTextFormField(
                                    readOnly: true,
                                    controller: controller.quantityController,
                                    label: "Quantity".tr),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomTextFormField(
                                    readOnly: true,
                                    controller: controller.uomController,
                                    label: "UOM".tr),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomTextFormField(
                                    readOnly: true,
                                    controller: controller.siteController,
                                    label: "Site".tr),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomTextFormField(
                                    readOnly: true,
                                    controller: controller.warehouseController,
                                    label: "Warehouse".tr),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomTextFormField(
                                    readOnly: true,
                                    multiLine: true,
                                    controller: controller.remarksController,
                                    label: "Remarks".tr),
                              ],
                            ),
                          ),
                        ),
                      ),


                      const SizedBox(
                        height: 32,
                      )
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
