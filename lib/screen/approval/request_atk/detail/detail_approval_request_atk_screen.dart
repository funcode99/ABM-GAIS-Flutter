import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/approval_request_atk/approval_request_atk_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/dialog/reject_dialog.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list/approval_log_list.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/request_atk/confirm/confirm_approval_request_atk_screen.dart';
import 'package:gais/screen/approval/request_atk/delivery/delivery_approval_request_atk_screen.dart';
import 'package:gais/screen/approval/request_atk/detail/detail_approval_request_atk_controller.dart';
import 'package:gais/util/color/color_util.dart';
import 'package:gais/util/enum/approval_action_enum.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:get/get.dart';

class DetailApprovalRequestATKScreen extends StatefulWidget {
  const DetailApprovalRequestATKScreen({Key? key, this.approvalActionEnum = ApprovalActionEnum.none}) : super(key: key);

  final ApprovalActionEnum approvalActionEnum;

  @override
  State<DetailApprovalRequestATKScreen> createState() => _DetailApprovalRequestATKScreenState();
}

class _DetailApprovalRequestATKScreenState extends State<DetailApprovalRequestATKScreen> {
  _goToConfirmPage(ApprovalRequestATKModel? selectedItem)async{
    DetailApprovalRequestATKController controller = Get.find();
    ApprovalModel? result = await  Get.to(
        ()=>const ConfirmApprovalRequestATKScreen(),
      arguments: {
          "item" : selectedItem
      }
    );
    if (result != null) {
      controller.approvalModel(result);
      controller.approve();
    }
  }

  _openRejectDialog()async{
    DetailApprovalRequestATKController controller = Get.find();
    ApprovalModel? result = await Get.dialog(const RejectDialog(rejectFormEnum: RejectFormEnum.onlyFullReject));
    if (result != null) {
      controller.approvalModel(result);
      controller.reject();
    }
  }

  _goToDeliveryPage(ApprovalRequestATKModel? selectedItem)async{
    DetailApprovalRequestATKController controller = Get.find();
    ApprovalModel? result = await  Get.to(
            ()=>const DeliveryApprovalRequestATKScreen(),
        arguments: {
          "item" : selectedItem
        }
    );
    if (result != null) {
      controller.approvalModel(result);
      controller.complete();
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, (){
      if(widget.approvalActionEnum == ApprovalActionEnum.approve){
        ApprovalRequestATKModel? selectedItem;
        if (Get.arguments != null) {
          selectedItem = Get.arguments["item"];
        }
        _goToConfirmPage(selectedItem);
      }else if(widget.approvalActionEnum == ApprovalActionEnum.reject){
        _openRejectDialog();
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ApprovalRequestATKModel? selectedItem;
    if (Get.arguments != null) {
      selectedItem = Get.arguments["item"];
    }

    final DetailApprovalRequestATKController controller =
    Get.put(DetailApprovalRequestATKController())
      ..selectedItem(selectedItem);


    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Approval ATK Request".tr, style: appTitle),
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
                            backgroundColor: ColorUtil.getStatusColorByText("${controller.selectedItem.value.status}"),
                            status:
                            "${controller.detailSelectedItem.value.status}",
                          );
                        })
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() {
                      return Text(
                        controller.selectedItem.value.noAtkRequest ?? "-",
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
                        RequestATKEnum.waitingApproval.value) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            title: "Confirm".tr,
                            iconData: Icons.check,
                            backgroundColor: successColor,
                            onPressed: () {
                              _goToConfirmPage(controller.selectedItem.value);
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
                    }else if (controller.selectedItem.value.codeStatusDoc ==
                        RequestATKEnum.approve.value) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            title: "Delivery".tr,
                            iconData: Icons.check,
                            backgroundColor: successColor,
                            onPressed: () {
                              _goToDeliveryPage(controller.selectedItem.value);
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
                            controller: controller.companyController,
                            label: "Company".tr),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                            readOnly: true,
                            isRequired: true,
                            controller: controller.siteController,
                            label: "Site".tr),
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
                  )
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
                      return Obx(() {
                        if (controller.listDetail.isEmpty) {
                          return const SizedBox();
                        } else {
                          return ListView(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          children: [
                            ...controller.listDetail.mapIndexed(
                                    (index, item) => CommonListItem(
                                      number: "${index + 1}",
                                      title: item.itemName ?? "",
                                      // subtitle: item.brandName ?? "",
                                      subtitle: item.codeItem ?? "",
                                      action: [],
                                      content: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                        child: SingleChildScrollView(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "Qty\nRequest".tr,
                                                    textAlign: TextAlign.center,
                                                    style: listTitleTextStyle,
                                                  ),
                                                  Text(
                                                    "${item.qty ?? ""}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        ?.copyWith(fontSize: 14, color: greyColor, height: 1.5),
                                                  ),
                                                ],
                                              ),
                                              if(item.codeStatusDoc != null)
                                                if(item.qtyApproved != null && item.codeStatusDoc! > 1)
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Qty\nApproved".tr,
                                                        textAlign: TextAlign.center,
                                                        style: listTitleTextStyle,
                                                      ),
                                                      Text(
                                                        "${item.qtyApproved ?? ""}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            ?.copyWith(fontSize: 14, color: greyColor, height: 1.5),
                                                      ),
                                                    ],
                                                  ),
                                              if(item.codeStatusDoc != null)
                                                if(item.qtyUnsend != null && item.codeStatusDoc! > 1)
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Qty\nRejected".tr,
                                                        textAlign: TextAlign.center,
                                                        style: listTitleTextStyle,
                                                      ),
                                                      Text(
                                                        "${item.qtyUnsend ?? ""}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            ?.copyWith(fontSize: 14, color: greyColor, height: 1.5),
                                                      ),
                                                    ],
                                                  ),
                                              if(item.codeStatusDoc != null)
                                                if(item.qtyDelivered != null && item.codeStatusDoc! > 1)
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Qty\nDelivered".tr,
                                                        textAlign: TextAlign.center,
                                                        style: listTitleTextStyle,
                                                      ),
                                                      Text(
                                                        "${item.qtyDelivered ?? ""}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            ?.copyWith(fontSize: 14, color: greyColor, height: 1.5),
                                                      ),
                                                    ],
                                                  ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "UOM".tr,
                                                    style: listTitleTextStyle,
                                                  ),
                                                  Text(
                                                    item.uomName ?? "-",
                                                    style: listSubTitleTextStyle
                                                        .copyWith(
                                                        overflow:
                                                        TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ],
                                              ),
                                              /*Expanded(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Warehouse".tr,
                                                        style: listTitleTextStyle,
                                                      ),
                                                      Text(
                                                        item.warehouseName ?? "-",
                                                        style: listSubTitleTextStyle
                                                            .copyWith(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                      ),
                                                    ],
                                                  ),
                                                ),*/
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: (){
                                        /*Get.dialog(
                                      DetailItemRequestATKScreen(item: element)
                                  );*/
                                      },
                                    ))
                          ],
                        );
                        }
                      });
                    } else if (controller.selectedTab.value ==
                        TabEnum.approval) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Obx(() {
                          return controller.listLogApproval.isEmpty
                              ? const SizedBox()
                              : ApprovalLogList(
                            list: controller.listLogApproval,
                            waitingApprovalValue:
                            CashAdvanceNonTravelEnum.waitingApproval.value,
                          );
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