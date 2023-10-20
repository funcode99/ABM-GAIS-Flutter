import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/approval_cash_advance/approval_cash_advance_model.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/dialog/approval_confirmation_dialog.dart';
import 'package:gais/reusable/dialog/reject_dialog.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list/approval_log_list.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/cash_advance_travel/detail/approval_cash_advance_travel_detail_controller.dart';
import 'package:gais/util/color/color_util.dart';
import 'package:gais/util/enum/approval_action_enum.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class ApprovalActualizationTripDetailScreen extends StatefulWidget {
  const ApprovalActualizationTripDetailScreen(
      {Key? key, this.approvalActionEnum = ApprovalActionEnum.none})
      : super(key: key);

  final ApprovalActionEnum approvalActionEnum;

  @override
  State<ApprovalActualizationTripDetailScreen> createState() =>
      _ApprovalActualizationTripDetailScreenState();
}

class _ApprovalActualizationTripDetailScreenState
    extends State<ApprovalActualizationTripDetailScreen> {
  _openApproveDialog() async {
    ApprovalCashAdvanceTravelDetailController controller = Get.find();
    ApprovalModel? result = await Get.dialog(ApprovalConfirmationDialog(
      idEmployee: controller.selectedItem.value.idEmployee,
      idSite: controller.selectedItem.value.idSite,
      idCompany: controller.selectedItem.value.idCompany,
      idApprovalAuth: controller.selectedItem.value.idApprovalAuth,
    ));

    if (result != null) {
      controller.approvalModel(result);
      controller.approve();
    }
  }

  _openRejectDialog() async {
    ApprovalCashAdvanceTravelDetailController controller = Get.find();
    ApprovalModel? result = await Get.dialog(const RejectDialog());
    if (result != null) {
      controller.approvalModel(result);
      controller.reject();
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      if (widget.approvalActionEnum == ApprovalActionEnum.approve) {
        _openApproveDialog();
      } else if (widget.approvalActionEnum == ApprovalActionEnum.reject) {
        _openRejectDialog();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ApprovalCashAdvanceModel? selectedItem;
    if (Get.arguments != null) {
      selectedItem = Get.arguments["item"];
    }

    final ApprovalCashAdvanceTravelDetailController controller =
        Get.put(ApprovalCashAdvanceTravelDetailController())
          ..selectedItem(selectedItem);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("approval_cash_advance_travel".tr, style: appTitle),
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
                          if (controller.selectedItem.value.status == null) {
                            return const SizedBox();
                          }
                          return CustomStatusContainer(
                            backgroundColor: ColorUtil.getStatusColorByText("${controller.selectedItem.value.status}"),
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
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(() {
                    if (controller.selectedItem.value.codeStatusDoc ==
                        RequestTripEnum.waitingApproval.value) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            title: "Approve".tr,
                            iconData: Icons.check,
                            backgroundColor: successColor,
                            onPressed: () {
                              _openApproveDialog();
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          CustomIconButton(
                            title: "Reject".tr,
                            iconData: Icons.close,
                            backgroundColor: redColor,
                            onPressed: () {
                              _openRejectDialog();
                            },
                          )
                        ],
                      );
                    }

                    return const SizedBox();
                  }),
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
                      ],
                    ),
                  ),
                ]),
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
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 10, left: 5),
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
                              child: const Text("Approval Info"),
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
                  const SizedBox(
                    height: 16,
                  ),
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
                                    ...controller.listDetail.mapIndexed((index,
                                            item) =>
                                        CommonListItem(
                                          number: "${index + 1}",
                                          subtitle: controller.selectedItem
                                                  .value.employeeName ??
                                              "-",
                                          total:
                                              "${controller.selectedItem.value.currencyCode ?? ""} ${item.total?.toInt().toCurrency()}",
                                          content: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Item".tr,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            ?.copyWith(
                                                                fontSize: 14,
                                                                color:
                                                                    Colors.black,
                                                                height: 1.5),
                                                      ),
                                                      Text(
                                                        item.itemName ?? item.namaItem ?? "-",
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            ?.copyWith(
                                                                fontSize: 14,
                                                                color: greyColor,
                                                                height: 1.5),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Frequency".tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          ?.copyWith(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black,
                                                              height: 1.5),
                                                    ),
                                                    Text(
                                                      "${item.frequency}",
                                                      style: Theme.of(context)
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
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          ?.copyWith(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black,
                                                              height: 1.5),
                                                    ),
                                                    Text(
                                                      "${controller.selectedItem.value.currencyCode ?? ""} ${item.nominal?.toInt().toCurrency()}",
                                                      style: Theme.of(context)
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
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}
