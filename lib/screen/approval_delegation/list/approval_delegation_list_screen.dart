import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval_delegation/add/add_approval_delegation_screen.dart';
import 'package:gais/screen/approval_delegation/edit/edit_approval_delegation_screen.dart';
import 'package:gais/screen/approval_delegation/list/approval_delegation_list_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ApprovalDelegationListScreen extends StatelessWidget {
  const ApprovalDelegationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApprovalDelegationListController controller =
        Get.put(ApprovalDelegationListController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Approval Delegation".tr, style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomSearchBar(
              onSubmit: (string) {
                controller.applySearch(string);
              },
              onClearFilter: () {
                controller.applySearch("");
              },
            ),
            Obx(() {
              if (controller.listHeader.isEmpty) {
                return const SizedBox();
              }

              return CustomPagination(
                colorSub: whiteColor,
                colorPrimary: infoColor,
                key: UniqueKey(),
                onPageChanged: (page) {
                  if (page != controller.currentPage.value) {
                    controller.getHeader(page: page);
                  }
                },
                pageTotal: controller.totalPage.value,
                margin: EdgeInsets.zero,
                pageInit: controller.currentPage.value,
              );
            }),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: RefreshIndicator(
              onRefresh: () async {
                controller.getHeader();
              },
              child: Obx(() {
                return controller.listHeader.isEmpty
                    ? const DataEmpty()
                    : ListView(
                        children: [
                          ...controller.listHeader.mapIndexed((index, item) {
                            bool showEditButton = false;

                            if (item.endDate != null) {
                              DateTime? dateTime = item.endDate
                                  ?.toDate(originFormat: "yyyy-MM-dd");
                              if (dateTime != null) {
                                if (dateTime.isAfter(DateTime.now())) {
                                  showEditButton = true;
                                }
                              }
                            }
                            return CommonListItem(
                                number:
                                    "${((controller.currentPage.value - 1) * controller.limit) + (index + 1)}",
                                title: "${item.delegator}",
                                subtitle:
                                    "${item.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yy")}",
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Delegate To".tr,
                                              textAlign: TextAlign.center,
                                              style: listTitleTextStyle,
                                            ),
                                            Text(
                                              item.delegateTo ?? "-",
                                              style: listSubTitleTextStyle
                                                  .copyWith(
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Active Date".tr,
                                              textAlign: TextAlign.center,
                                              style: listTitleTextStyle,
                                            ),
                                            Text(
                                              "${item.startDate?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yy")} - ${item.endDate?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yy")}",
                                              style: listSubTitleTextStyle
                                                  .copyWith(
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                action: showEditButton
                                    ? [
                                        CustomIconButton(
                                          title: "Edit".tr,
                                          iconData: IconlyBold.edit,
                                          backgroundColor: successColor,
                                          onPressed: () {
                                            Get.to(
                                                () =>
                                                    const EditApprovalDelegationScreen(),
                                                arguments: {
                                                  "item": item
                                                })?.then((value) =>
                                                controller.getHeader());
                                          },
                                        ),
                                      ]
                                    : []);
                          })
                        ],
                      );
              }),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successColor,
        onPressed: () => Get.to(() => const AddApprovalDelegationScreen())
            ?.then((value) => controller.getHeader()),
        child: const Icon(Icons.add_rounded, size: 45),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
