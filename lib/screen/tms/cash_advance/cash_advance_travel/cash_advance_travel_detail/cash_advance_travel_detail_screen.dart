import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list/approval_log_list.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/cash_advance_travel_detail/cash_advance_travel_detail_controller.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class CashAdvanceTravelDetailScreen extends StatefulWidget {
  const CashAdvanceTravelDetailScreen({Key? key}) : super(key: key);

  @override
  State<CashAdvanceTravelDetailScreen> createState() =>
      _CashAdvanceTravelDetailScreenState();
}

class _CashAdvanceTravelDetailScreenState
    extends State<CashAdvanceTravelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    CashAdvanceModel selectedItem = Get.arguments["item"];

    final CashAdvanceTravelDetailController controller =
    Get.put(CashAdvanceTravelDetailController())
      ..selectedItem(selectedItem);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("cash_advance_travel".tr, style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Card(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(() {
                          return CustomStatusContainer(
                            backgroundColor: greenColor,
                            status: "${controller.selectedItem.value.status}",
                          );
                        })
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() {
                      return Text(
                        controller.selectedItem.value.noCa ?? "-",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    height: 20,
                    color: greyColor,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                            controller: controller.requestorController,
                            label: "Requestor".tr),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                            readOnly: true,
                            isRequired: false,
                            controller: controller.referenceController,
                            label: "Reference".tr),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                            readOnly: true,
                            isRequired: false,
                            controller: controller.currencyController,
                            label: "Currency".tr),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                            readOnly: true,
                            controller: controller.totalController,
                            label: "Total".tr),
                        const SizedBox(
                          height: 8,
                        ),
                        Obx(() {
                          if(controller.selectedItem.value.codeStatusDoc == CashAdvanceTravelEnum.rejected){
                            return CustomTextFormField(
                                readOnly: true,
                                controller: controller.remarksController,
                                label: "Note".tr);
                          }
                          return SizedBox();
                        }),
                        const SizedBox(
                          height: 64,
                        ),
                      ],
                    ),
                  ),
                ]
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                  minHeight: 60,
                  maxHeight: 60,
                  child: Container(
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
                        GestureDetector(
                          child: Obx(() {
                            return Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 10, left: 5),
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                color: controller.selectedTab.value ==
                                    TabEnum.detail
                                    ? whiteColor
                                    : neutralColor,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                                gradient: LinearGradient(stops: const [
                                  0.1,
                                  0
                                ], colors: [
                                  controller.selectedTab.value == TabEnum.detail
                                      ? blackColor
                                      : whiteColor,
                                  Colors.white
                                ]),
                              ),
                              child: const Text("Detail"),
                            );
                          }),
                          onTap: () {
                            controller.selectedTab(TabEnum.detail);
                          },
                        ),
                        GestureDetector(
                          child: Obx(() {
                            return Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 10, left: 5),
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                color: controller.selectedTab.value ==
                                    TabEnum.approval
                                    ? whiteColor
                                    : neutralColor,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                                gradient: LinearGradient(stops: const [
                                  0.1,
                                  0
                                ], colors: [
                                  controller.selectedTab.value ==
                                      TabEnum.approval
                                      ? blackColor
                                      : whiteColor,
                                  Colors.white
                                ]),
                              ),
                              child: const Text("Approval"),
                            );
                          }),
                          onTap: () {
                            controller.selectedTab(TabEnum.approval);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SliverList(
                delegate: SliverChildListDelegate([
                  Obx(() {
                    if (controller.selectedTab.value == TabEnum.detail) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Obx(() {
                          return controller.listDetail.isEmpty
                              ? const SizedBox()
                              : ListView(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            children: [
                              ...controller.listDetail
                                  .mapIndexed((index, item) =>
                                  CommonListItem(
                                    number: "${index + 1}",
                                    subtitle: controller.selectedItem.value
                                        .employeeName ?? "-",
                                    total: "${controller.selectedItem.value
                                        .currencyCode ?? ""} ${item.total?.toInt().toCurrency()}",
                                    content: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Item".tr,
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    height: 1.5),
                                              ),
                                              Text(
                                                "${item.itemName}",
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                    fontSize: 14,
                                                    color: greyColor,
                                                    height: 1.5),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Frequency".tr,
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    height: 1.5),
                                              ),
                                              Text(
                                                "${item.frequency}",
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                    fontSize: 14,
                                                    color: greyColor,
                                                    height: 1.5),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Nominal".tr,
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    height: 1.5),
                                              ),
                                              Text(
                                                "${controller.selectedItem.value
                                                    .currencyCode ?? ""} ${item.nominal?.toInt()
                                                    .toCurrency()}",
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                    fontSize: 14,
                                                    color: greyColor,
                                                    height: 1.5),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    action: const [],
                                  ))
                            ],
                          );
                        }),
                      );
                    } else if (controller.selectedTab.value ==
                        TabEnum.approval) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Obx(() {
                          return controller.listLogApproval.isEmpty
                              ? const SizedBox()
                              : ApprovalLogList(list: controller.listLogApproval, waitingApprovalValue: RequestTripEnum.waitingApproval.value,);
                        }),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                  const SizedBox(
                    height: 32,
                  )
                ]),
              )

            ],

          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
