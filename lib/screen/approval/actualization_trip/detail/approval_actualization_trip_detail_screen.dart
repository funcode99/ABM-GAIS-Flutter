import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/actualization_trip/trip_info_model.dart';
import 'package:gais/data/model/approval/approval_actualization_trip_model.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/dialog/approval_confirmation_dialog.dart';
import 'package:gais/reusable/dialog/reject_dialog.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list/approval_log_list.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/actualization_trip/detail/approval_actualization_trip_detail_controller.dart';
import 'package:gais/screen/approval/actualization_trip/edit/form_approval_actualization_trip_screen.dart';
import 'package:gais/screen/tms/actualization_trip/actualization_trip_item.dart';
import 'package:gais/screen/tms/actualization_trip/add/form_trip_info_actualization_trip_screen.dart';
import 'package:gais/util/color/color_util.dart';
import 'package:gais/util/enum/approval_action_enum.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

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
    ApprovalActualizationTripDetailController controller = Get.find();
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
    ApprovalActualizationTripDetailController controller = Get.find();
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
    ApprovalActualizationTripModel? selectedItem;
    if (Get.arguments != null) {
      selectedItem = Get.arguments["item"];
    }

    final ApprovalActualizationTripDetailController controller =
        Get.put(ApprovalActualizationTripDetailController())
          ..selectedItem(selectedItem);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Approval Actualization Trip".tr, style: appTitle),
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
                        controller.selectedItem.value.noAct ?? "-",
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
                        children: controller.onEdit.value ? [
                          OutlinedButton(
                            onPressed: () {
                              controller.onEdit(false);
                            },
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(75, 30),
                            ),
                            child: Text("Cancel".tr),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.onEdit(false);
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(75, 30),
                                backgroundColor: successColor),
                            child: Text("Save".tr),
                          )
                        ]:[
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
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          CustomIconButton(
                            title: "Edit".tr,
                            iconData: Icons.edit,
                            backgroundColor: orangeColor,
                            onPressed: () {
                              controller.onEdit(true);
                            },
                          ),

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
                        Text("Reference".tr, style: formlabelTextStyle),
                        const SizedBox(
                          height: 8,
                        ),
                        Obx(() {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                color: neutralColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child:
                            controller.detailSelectedItem.value.noRequestTrip !=
                                null
                                ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: controller
                                  .detailSelectedItem.value.noRequestTrip!
                                  .map((e) =>
                                  Text("$e",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                        fontSize: 16,
                                        color: Colors.black,
                                        // fontWeight: FontWeight.w600,
                                      )))
                                  .toList(),
                            )
                                : Text("-",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                  fontSize: 16,
                                  color: Colors.black,
                                  // fontWeight: FontWeight.w600,
                                )),
                          );
                        }),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                                isRequired: false,
                                readOnly: true,
                                controller: controller.purposeController,
                                label: "Purpose".tr),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Trip Info",
                              style: formlabelTextStyle,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Obx(() {
                              return Column(
                                children: [
                                  ...controller.listTripInfo.mapIndexed((
                                      index,
                                      item) {
                                    return ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        minHeight: 70,
                                      ),
                                      child: ActualizationTripItem(
                                        action: controller.onEdit.value ? [
                                          CustomIconButton(
                                            iconData: IconlyBold.edit,
                                            backgroundColor: successColor,
                                            onPressed: () async {
                                              TripInfoModel? result = await Get
                                                  .to(() => const FormApprovalActualizationTripScreen(),
                                                  arguments: {
                                                    "trip_info": item
                                                  });

                                              if (result != null) {
                                                controller.updateTripInfo(result);
                                              }
                                            },
                                          ),
                                          SizedBox(
                                            width: item.deletable ? 4 : 0,
                                          ),
                                        ] : [],

                                        title: controller.getTitleTripInfo(item),
                                        number: "${index + 1}",
                                        content: item.type == null
                                            ? const SizedBox()
                                            :
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 8),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    padding: const EdgeInsets.all(
                                                        10),
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: infoColor,
                                                    ),
                                                    child: item.type != null &&
                                                        item.type!.isNotEmpty
                                                        ?
                                                    SvgPicture.asset(
                                                        item.type
                                                            ?.toLowerCase() ==
                                                            "train"
                                                            ? ImageConstant.train
                                                            : ImageConstant
                                                            .airplane)
                                                        : const SizedBox(),
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        controller.getTitleTransportation(item),
                                                        style: const TextStyle(
                                                            fontSize: 12
                                                        ),
                                                      ),
                                                      Text(
                                                        "${item.origin} -> ${item.destination}",
                                                        style: const TextStyle(
                                                            fontSize: 12
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Text("TLK/Day : ${item.tlkRate.toString().toInt().toCurrency() ?? "-"}"),
                                              Text("Total : ${controller.getSubTotalTLK(item).toCurrency()}"),
                                            ],
                                          ),
                                        ),

                                      ),
                                    );
                                  }),
                                ],
                              );
                            }),
                            const SizedBox(
                              height: 16,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Activities ',
                                style: formlabelTextStyle,
                                children: const <TextSpan>[

                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Obx(() {
                              return Column(
                                children: [
                                  ...controller.listActivity.mapIndexed((index, item){
                                    return ActualizationTripItem(
                                        action: [],
                                        title: "${item.actDate?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy")}",
                                        number: "${index + 1}",
                                        content: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 2),
                                          child: item.activities == null || item.activities!.isEmpty ?
                                          const Text(
                                            "Activity details are required",
                                            style: TextStyle(color: Colors.redAccent, fontSize: 12, fontStyle: FontStyle.italic),

                                          ) : Text(
                                              "${item.activities}"
                                          ),
                                        )

                                    );
                                  })
                                ],
                              );
                            }),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomTextFormField(
                              readOnly: true,
                              controller: controller.totalTLKController,
                              label: "Total TPLK".tr,
                              isRequired: false,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomTextFormField(
                              multiLine: true,
                              readOnly: true,
                              controller: controller.notesController,
                              label: "Notes".tr,
                              isRequired: false,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      );
                    } else if (controller.selectedTab.value ==
                        TabEnum.approval) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Obx(() {
                          return controller.listLogApproval.isEmpty
                              ? const DataEmpty()
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
