import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/train/add/add_train_screen.dart';
import 'package:gais/screen/tms/request_trip/add/train/train_controller.dart';
import 'package:get/get.dart';

class TrainScreen extends StatelessWidget {
  const TrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainController>(
        init: TrainController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              leading: CustomBackButton(),
              title: Text("Train", style: appTitle),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.getList();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 42,
                        width: 42,
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                        child: const Icon(Icons.train_rounded, color: whiteColor),
                      ),
                      Text("Train", style: appTitle),
                      const SizedBox(height: 14),
                      Column(
                        children: controller.trainList.isNotEmpty
                            ? controller.trainList
                                .mapIndexed(
                                  (i, e) => CustomTripCard(
                                    listNumber: i + 1,
                                    title: e.travelerName.toString(),
                                    subtitle: controller.dateFormat.format(DateTime.parse(e.departDate!)),
                                    // status: e.status.toString(),
                                    // info: int.parse(e.amount.toString()).toCurrency(),
                                    isEdit: true,
                                    editAction: () => Get.off(const AddTrainScreen(), arguments: {
                                      'purposeID': controller.purposeID,
                                      'codeDocument': controller.codeDocument,
                                      'isEdit': true,
                                      'id': e.id,
                                    })?.then((_) {
                                      controller.getList();
                                      controller.update();
                                    }),
                                    isDelete: true,
                                    deleteAction: () => Get.dialog(DeleteConfirmationDialog(
                                      onDeletePressed: () {
                                        controller.delete(e.id.toString());
                                        Get.back();
                                        controller.getList();
                                      },
                                    )),
                                    content: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Origin", style: listTitleTextStyle),
                                            Text(e.nameStation.toString(), style: listSubTitleTextStyle),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Destination", style: listTitleTextStyle),
                                            Text(e.nameStationTo.toString(), style: listSubTitleTextStyle),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList()
                            : [Container()],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: CustomFilledButton(
                          color: infoColor,
                          title: "Add Train",
                          icon: Icons.add,
                          onPressed: () => Get.off(const AddTrainScreen(), arguments: {
                            'purposeID': controller.purposeID,
                            'codeDocument': controller.codeDocument,
                          })?.then((_) {
                            controller.getList();
                            controller.update();
                          }),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomFilledButton(
                            width: 100,
                            color: Colors.transparent,
                            borderColor: infoColor,
                            title: "Back",
                            fontColor: infoColor,
                            onPressed: () => Get.back(),
                          ),
                          CustomFilledButton(
                            width: 100,
                            color: infoColor,
                            title: "Next",
                            onPressed: () => controller.next(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomBar(menu: 0),
          );
        });
  }
}
