import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list/approval_log_list.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/actualization_trip/add/select_request_trip_controller.dart';
import 'package:gais/util/color/color_util.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class SelectRequestTripScreen extends StatelessWidget {
  const SelectRequestTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SelectRequestTripController controller =
        Get.put(SelectRequestTripController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Actualization Trip", style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Card(
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: SingleChildScrollView(
                  child: Obx(() {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Center(
                          child: Text(
                            "Choose\nRequest Trip".tr,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                                color: infoColor, shape: BoxShape.circle),
                            child: const Icon(
                              IconlyBold.info_square,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ...controller.listRequestTrip
                            .mapIndexed((index, item) => SelectRequestTripItem(
                                  isSelected: controller
                                      .listIDSelectedRequestTrip
                                      .contains(item.id),
                                  onTap: () {
                                    print("ITEM ${item.id}");
                                    if (controller.listIDSelectedRequestTrip
                                        .contains(item.id)) {
                                      controller
                                          .removeSelectedRequestTrip(item.id);
                                    } else {
                                      controller
                                          .addSelectedRequestTrip(item.id);
                                    }
                                  },
                                  title: "${item.noRequestTrip}",
                                  subtitle:
                                      "${item.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy")}",
                                  content: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Purpose of Trip".tr,
                                                style: listTitleTextStyle,
                                              ),
                                              Text(
                                                "${item.documentName}",
                                                style: listSubTitleTextStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Status".tr,
                                                style: listTitleTextStyle,
                                              ),
                                              Text(
                                                "${item.status}",
                                                style: listSubTitleTextStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                      ],
                    );
                  }),
                ),
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(100, 40),
                      ),
                      child: Text("Cancel".tr),
                    ),
                    Obx(() {
                      return ElevatedButton(
                        onPressed: controller.listIDSelectedRequestTrip.isEmpty
                            ? null
                            : () {
                          print("LIST ${controller.listIDSelectedRequestTrip}");
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: infoColor),
                        child: Text("Next".tr),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}

class SelectRequestTripItem extends StatelessWidget {
  const SelectRequestTripItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.content,
      this.isSelected = false,
      required this.onTap});

  final String title;
  final String subtitle;

  final Widget content;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: listTitleTextStyle),
                        Text(
                          subtitle,
                          style: listSubTitleTextStyle,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    color: Colors.grey.withOpacity(0.5),
                    child: isSelected
                        ? Center(
                            child: Container(
                              height: 20,
                              width: 20,
                              color: infoColor,
                            ),
                          )
                        : const SizedBox(),
                  )
                ],
              ),
            ),
            const Divider(
              height: 10,
              thickness: 2,
            ),
            content,
          ],
        ),
      ),
    );
  }
}
