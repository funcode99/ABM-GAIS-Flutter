import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/pool_car/pool_car_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/pool_car/detail/pool_car_detail_controller.dart';
import 'package:gais/screen/tms/pool_car/p2h/pool_car_p2h_screen.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class PoolCarDetailScreen extends StatefulWidget {
  const PoolCarDetailScreen({Key? key}) : super(key: key);

  @override
  State<PoolCarDetailScreen> createState() =>
      _PoolCarDetailScreenState();
}

class _PoolCarDetailScreenState
    extends State<PoolCarDetailScreen> {
  @override
  Widget build(BuildContext context) {
    PoolCarModel selectedItem = Get.arguments["item"];

    final PoolCarDetailController controller =
    Get.put(PoolCarDetailController())
      ..selectedItem(selectedItem);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Pool Car Request".tr, style: appTitle),
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
                        controller.selectedItem.value.noPoolCar ?? "-",
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
                  Obx(() {
                    if (controller.showSubmitButton.value) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
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

                        /*Obx(() {
                          if(controller.selectedItem.value.codeStatusDoc != RequestTripEnum.draft.value){
                            return GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5),
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
                          }
                          return const SizedBox();
                        }),*/

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
                          return CommonListItem(
                            number: "1",
                            subtitle: controller.selectedItem.value.requestorName ?? "-",
                            total: controller.selectedItem.value.plate ?? "-",
                            content: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Driver".tr,
                                          style: listTitleTextStyle,
                                        ),
                                        Text(
                                            controller.selectedItem.value.driverName ?? "-",
                                            style: listSubTitleTextStyle.copyWith(
                                                overflow: TextOverflow.ellipsis
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Text(
                                          "From Date".tr,
                                          style: listTitleTextStyle,
                                        ),
                                        Text(
                                            "${controller.selectedItem.value.fromDate?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy")}",
                                            style: listSubTitleTextStyle.copyWith(
                                                overflow: TextOverflow.ellipsis
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Text(
                                          "To Date".tr,
                                          style: listTitleTextStyle,
                                        ),
                                        Text(
                                          "${controller.selectedItem.value.toDate?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy")}",
                                          style: listSubTitleTextStyle.copyWith(
                                              overflow: TextOverflow.ellipsis
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Odometer".tr,
                                          style: listTitleTextStyle,
                                        ),
                                        Text(
                                          "${controller.selectedItem.value.odometer ?? "-"}",
                                          style: listSubTitleTextStyle.copyWith(
                                              overflow: TextOverflow.ellipsis
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            action: [
                              Obx((){
                                if(controller.showP2H.value){
                                  return CustomIconButton(
                                    title: "P2H",
                                    iconData: IconlyBold.edit,
                                    backgroundColor: orangeColor,
                                    onPressed: () async{
                                      Get.to(()=>const PoolCarP2HScreen(), arguments: {
                                        "item" : controller.selectedItem.value
                                      })?.then((value) => controller.detailHeader());

                                    },
                                  );
                                }
                                return const SizedBox();
                              })
                            ],
                          );
                        }),
                      );
                    } /*else if (controller.selectedTab.value ==
                        TabEnum.approval) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Obx(() {
                          return controller.listLogApproval.isEmpty
                              ? const SizedBox()
                              : ApprovalLogList(list: controller.listLogApproval, waitingApprovalValue: RequestTripEnum.waitingApproval.value,);
                        }),
                      );
                    }*/ else {
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
