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
import 'package:gais/reusable/list_item/common_add_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/approval/detail/approval_cash_advance_non_travel_detail_controller.dart';
import 'package:gais/screen/tms/cash_advance/enum/approval_action_enum.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class ApprovalCashAdvanceNonTravelDetailScreen extends StatefulWidget {
  const ApprovalCashAdvanceNonTravelDetailScreen(
      {Key? key, this.approvalActionEnum = ApprovalActionEnum.none})
      : super(key: key);

  final ApprovalActionEnum approvalActionEnum;

  @override
  State<ApprovalCashAdvanceNonTravelDetailScreen> createState() =>
      _ApprovalCashAdvanceNonTravelDetailScreenState();
}

class _ApprovalCashAdvanceNonTravelDetailScreenState
    extends State<ApprovalCashAdvanceNonTravelDetailScreen> {

  _openApproveDialog() async{
    ApprovalCashAdvanceNonTravelDetailController controller = Get.find();
    ApprovalModel? result = await Get.dialog(ApprovalConfirmationDialog(
      idEmployee: controller.selectedItem.value.idEmployee,
      idSite: controller.selectedItem.value.idSite,
      idCompany: controller.selectedItem.value.idCompany,
      idApprovalAuth: controller.selectedItem.value.idApprovalAuth,
    ));

    if(result!=null){
      controller.approvalModel(result);
      controller.approve();
    }
  }

  _openRejectDialog() async{
    ApprovalCashAdvanceNonTravelDetailController controller = Get.find();
    ApprovalModel result = await Get.dialog(const RejectDialog());
    if(result!=null){
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

    final ApprovalCashAdvanceNonTravelDetailController controller =
    Get.put(ApprovalCashAdvanceNonTravelDetailController())
      ..selectedItem(selectedItem);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title:
        Text("approval_cash_advance_non_travel".tr, style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() {
                      return CustomStatusContainer(
                        backgroundColor: greenColor,
                        status: "${controller.detailSelectedItem.value.status}",
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
                height: 12,
              ),
              Obx(() {
                if(controller.detailSelectedItem.value.codeStatusDoc == CashAdvanceNonTravelEnum.waitingApproval.value){
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
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                        isRequired: true,
                        readOnly: true,
                        controller: controller.requestorController,
                        label: "Requestor".tr),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        isRequired: true,
                        readOnly: true,
                        controller: controller.eventController,
                        label: "Event".tr),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        isRequired: true,
                        readOnly: true,
                        controller: controller.dateController,
                        label: "Date".tr),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        readOnly: true,
                        isRequired: true,
                        controller: controller.currencyController,
                        label: "Currency".tr),
                    CustomTextFormField(
                        readOnly: true,
                        controller: controller.totalController,
                        label: "Total".tr),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Details Item",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    const Divider(
                      height: 20,
                      color: greyColor,
                    ),
                        Obx(() {
                      return controller.listDetail.isEmpty
                          ? const SizedBox()
                          : ListView(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        children: [
                          ...controller.listDetail.mapIndexed((index,
                              item) =>
                              CommonAddItem(
                                number: "${index + 1}",
                                title: "${item.itemName}",
                                subtitle: item.costCenterCode ?? "",
                                nominal:
                                "${controller.detailSelectedItem.value
                                    .currencyCode ?? ""} ${item.nominal
                                    ?.toInt().toCurrency()}",
                                action: [],
                              ))
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 32,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
