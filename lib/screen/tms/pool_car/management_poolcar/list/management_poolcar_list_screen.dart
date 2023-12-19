import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/pool_car/management_poolcar/add/add_management_poolcar_screen.dart';
import 'package:gais/screen/tms/pool_car/management_poolcar/list/management_poolcar_list_controller.dart';
import 'package:get/get.dart';

class ManagementPoolCarListScreen extends StatelessWidget {
  const ManagementPoolCarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementPoolCarListController>(
        init: ManagementPoolCarListController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Management Pool Car", style: appTitle),
              leading: const CustomBackButton(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.fetchList(1);
                  controller.update();
                },
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverAppBarDelegate(
                        minHeight: controller.dataisnull || controller.isLoading
                            ? Get.height
                            : 180,
                        maxHeight: 32,
                        child: Container(
                          color: baseColor,
                          child: Column(
                            children: [
                              CustomSearchBar(
                                onSubmit: (string) {
                                  controller.applySearch(string);
                                },
                                onClearFilter: () {
                                  controller.applySearch("");
                                },
                                onPressedFilter: () {
                                  controller.openFilter();
                                  Get.bottomSheet(
                                      enableDrag: true,
                                      persistent: false,
                                      isScrollControlled: true,
                                      FilterBottomSheet(
                                        onApplyFilter: () {
                                          controller.applyFilter();
                                          Get.back();
                                        },
                                        onResetFilter: () {
                                          controller.resetFilter();
                                        },
                                        children: [
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          !controller.enableSelectCompany ?
                                          CustomTextFormField(
                                            controller:
                                            controller
                                                .companyTextEditingController,
                                            label: "Company",
                                            readOnly: true,
                                          ) :
                                          GetBuilder<
                                              ManagementPoolCarListController>(
                                              builder: (controller) {
                                                return CustomDropDownFormField(
                                                  items: controller.listCompany
                                                      .map((e) =>
                                                      DropdownMenuItem(
                                                        value: e.id.toString(),
                                                        child: Text(
                                                            "${e.companyName}"),
                                                      ))
                                                      .toList(),
                                                  onChanged: (item) {
                                                    controller
                                                        .onChangeSelectedCompany(
                                                        item.toString());
                                                  },
                                                  label: "Company".tr,
                                                  value: controller
                                                      .selectedCompanyTemp?.id
                                                      .toString() ?? "",
                                                );
                                              }),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          GetBuilder<ManagementPoolCarListController>(
                                              builder: (controller) {
                                                return CustomDropDownFormField(
                                                  items: controller.listSite
                                                      .map((e) =>
                                                      DropdownMenuItem(
                                                        value: e.id.toString(),
                                                        child: Text(
                                                            "${e.siteName}"),
                                                      ))
                                                      .toList(),
                                                  onChanged: (item) {
                                                    controller
                                                        .onChangeSelectedSite(
                                                        item.toString());
                                                  },
                                                  label: "Site".tr,
                                                  value: controller
                                                      .selectedSiteTemp
                                                      ?.id.toString() ?? "",
                                                );
                                              }),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      ));
                                },
                              ),
                              CustomPagination(
                                colorSub: whiteColor,
                                colorPrimary: infoColor,
                                onPageChanged: (int pageNumber) {
                                  controller.currentPage = pageNumber;
                                  controller.fetchList(controller.currentPage);
                                  controller.update();
                                },
                                threshold: 5,
                                pageTotal: controller.carModel?.data?.lastPage
                                    ?.toInt() ?? 1,
                                // pageTotal: 5,
                                pageInit: controller.currentPage,
                              ),
                              controller.isLoading
                                  ? Container(height: Get.height / 2,
                                  child: const Center(
                                      child: CircularProgressIndicator()))
                                  : controller.dataisnull
                                  ? SizedBox(height: Get.height / 2,
                                  child: const DataEmpty())
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          if (controller.carList.isNotEmpty) {
                            return SizedBox(
                              child: Column(
                                children: [
                                  CustomTripCard(
                                    // listNumber: controller.currentPage > 1 ? (controller.ddModel?.data?.from?.toInt() ?? 0) + index : (index + 1),
                                    listNumber: (index + 1),
                                    title: controller.carList[index].plate
                                        .toString(),
                                    subtitle: controller.carList[index].carName,
                                    info: controller.carList[index].odometer
                                        .toString(),
                                    isEdit: true,
                                    editAction: () =>
                                        Get.to(
                                            const AddManagementPoolCarScreen(),
                                            arguments: {
                                              'id': controller.carList[index]
                                                  .id!.toInt(),
                                              'isEdit': true,
                                            })?.then((value) {
                                          controller.fetchList(1);
                                          controller.update();
                                        }),
                                    isDelete: true,
                                    deleteAction: () {
                                      Get.dialog(DeleteConfirmationDialog(
                                        onDeletePressed: () {
                                          Get.close(1);
                                          controller.deleteData(
                                              controller.carList[index].id!
                                                  .toInt());
                                        },
                                      ));
                                    },
                                    content: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text("Driver",
                                                style: listTitleTextStyle),
                                            Text(controller.carList[index].name
                                                .toString())
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text("Site",
                                                style: listTitleTextStyle),
                                            Text(controller.carList[index]
                                                .siteName.toString())
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (controller.carList.length ==
                                      index + 1) const SizedBox(height: 100)
                                ],
                              ),
                            );
                          }
                          return SizedBox();
                        },
                        childCount: !controller.dataisnull ? controller.carList
                            .length : 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add_rounded, size: 45),
              backgroundColor: successColor,
              onPressed: () {
                Get.to(const AddManagementPoolCarScreen(),
                    arguments: {'isEdit': false})?.then((value) {
                  controller.fetchList(1);
                  controller.update();
                });
              },
            ),
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
