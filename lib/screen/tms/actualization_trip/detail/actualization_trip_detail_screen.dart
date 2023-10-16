import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/actualization_trip/activity_model.dart';
import 'package:gais/data/model/actualization_trip/actualization_trip_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list/approval_log_list.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/request_atk/add/item_request_atk/add/add_item_request_atk_screen.dart';
import 'package:gais/screen/fss/request_atk/add/item_request_atk/detail/detail_item_request_atk_screen.dart';
import 'package:gais/screen/tms/actualization_trip/actualization_trip_item.dart';
import 'package:gais/screen/tms/actualization_trip/add/form_activity_actualization_trip_screen.dart';
import 'package:gais/screen/tms/actualization_trip/add/form_trip_info_actualization_trip_screen.dart';
import 'package:gais/screen/tms/actualization_trip/detail/actualization_trip_detail_controller.dart';
import 'package:gais/util/color/color_util.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../data/model/actualization_trip/trip_info_model.dart';

class ActualizationTripDetailScreen extends StatelessWidget {
  const ActualizationTripDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ActualizationTripModel? selectedItem;
    if (Get.arguments != null) {
      selectedItem = Get.arguments["item"];
    }

    final ActualizationTripDetailController controller =
    Get.put(ActualizationTripDetailController())
      ..selectedItem(selectedItem);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Actualization Trip".tr, style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Card(
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.always,
            onChanged: () {
              controller.updateEnableButton();
            },
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
                              backgroundColor: ColorUtil.getStatusColorByText(
                                  "${controller.selectedItem.value.status}"),
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
                          controller.selectedItem.value.noAct ?? "",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        );
                      }),
                    ),
                    Obx(() {
                      if (controller.selectedItem.value.codeStatusDoc
                          .toString() == ActualizationTripEnum.revision.value
                          .toString()) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                controller.updateOnEdit();
                              },
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size(75, 30),
                              ),
                              child: controller.onEdit.value
                                  ? Text("Cancel".tr)
                                  : Text("Edit".tr),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            controller.onEdit.value
                                ? ElevatedButton(
                              onPressed: controller.enableButton.value
                                  ? () {
                                controller.onEdit(false);
                              }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(75, 30),
                                  backgroundColor: successColor),
                              child: Text("Save".tr),
                            )
                                : ElevatedButton(
                              onPressed: () {
                                controller.submitHeader();
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(75, 30),
                                  backgroundColor: orangeColor),
                              child: Text("Submit".tr),
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    }),
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
                              controller.selectedItem.value.noRequestTrip !=
                                  null
                                  ? Column(
                                children: controller
                                    .selectedItem.value.noRequestTrip!
                                    .map((e) =>
                                    Text("e",
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
                            height: 64,
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
                                    controller.selectedTab.value ==
                                        TabEnum.detail
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
                          Obx(() {
                            return GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16),
                                alignment: Alignment.center,
                                margin:
                                const EdgeInsets.only(top: 10, left: 5),
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
                              ),
                              onTap: () {
                                controller.selectedTab(TabEnum.approval);
                              },
                            );
                          }),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Obx(() {
                                return CustomTextFormField(
                                    isRequired: true,
                                    readOnly: !controller.onEdit.value,
                                    controller: controller.purposeController,
                                    label: "Purpose".tr);
                              }),
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
                                                    .to(() => const FormTripInfoActualizationTripScreen(),
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
                                            if(item.deletable)
                                              CustomIconButton(
                                                iconData: IconlyBold.delete,
                                                backgroundColor: redColor,
                                                onPressed: () {
                                                  Get.dialog(
                                                      DeleteConfirmationDialog(
                                                        onDeletePressed: () {
                                                          Get.close(1);
                                                          controller.deleteTripInfo(item);
                                                        },
                                                      ));
                                                },
                                              )
                                          ] : [],

                                          title: controller.getTitleTripInfo(item),
                                          number: "${index + 1}",
                                          content: item.type == null
                                              ? const SizedBox()
                                              :
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 8),
                                            child: Row(
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
                              /*SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    Get.to(() =>
                                    const FormTripInfoActualizationTripScreen());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: infoColor),
                                  child: RichText(
                                    text: TextSpan(
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                        children: [
                                          const TextSpan(text: "+ "),
                                          TextSpan(text: "Add Trip".tr)
                                        ]),
                                  ),
                                ),
                              ),*/
                              const SizedBox(
                                height: 16,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Activities ',
                                  style: formlabelTextStyle,
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(color: Colors.red)),
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
                                          action: controller.onEdit.value ? [
                                            CustomIconButton(
                                              iconData: IconlyBold.edit,
                                              backgroundColor: successColor,
                                              onPressed: () async {
                                                ActivityModel? result = await Get.to(() => const FormActivityActualizationTripScreen(), arguments: {
                                                  "activity" : item
                                                });

                                                if(result!=null){
                                                  controller.updateActivity(result);
                                                }
                                              },
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            CustomIconButton(
                                              iconData: IconlyBold.delete,
                                              backgroundColor: redColor,
                                              onPressed: () {
                                                Get.dialog(DeleteConfirmationDialog(
                                                  onDeletePressed: () {
                                                    Get.close(1);
                                                    controller.deleteActivity(item);
                                                  },
                                                ));
                                              },
                                            )
                                          ] : [],
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
                              Obx(() {
                                if (controller.onEdit.value) {
                                  return SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        Get.to(() =>
                                        const FormActivityActualizationTripScreen());
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: infoColor),
                                      child: RichText(
                                        text: TextSpan(
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                            children: [
                                              const TextSpan(text: "+ "),
                                              TextSpan(
                                                  text: "Add Activities".tr)
                                            ]),
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              }),
                              const SizedBox(
                                height: 16,
                              ),
                              Obx(() {
                                return CustomTextFormField(
                                  multiLine: true,
                                  readOnly: !controller.onEdit.value,
                                  controller: controller.notesController,
                                  label: "Notes".tr,
                                  isRequired: true,
                                );
                              }),
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
                                ? const SizedBox()
                                : ApprovalLogList(
                              list: controller.listLogApproval,
                              waitingApprovalValue: ActualizationTripEnum
                                  .waitingApproval.value,
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
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}
