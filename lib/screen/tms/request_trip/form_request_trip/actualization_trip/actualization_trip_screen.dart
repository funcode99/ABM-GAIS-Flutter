import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customformlabel.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/actualization_trip/actualization_trip_controller.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/actualization_trip/add/activities_detail/act_activities_detail_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/actualization_trip/add/trip_info/act_trip_info_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/input_formatter/thousand_separator_input_formatter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ActualizationTripScreen extends StatelessWidget {
  const ActualizationTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActualizationTripController>(
        init: ActualizationTripController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Actualization Trip", style: appTitle),
              leading: const CustomBackButton(),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomFormLabel(label: "Trip Info", showRequired: false),
                      Column(
                        children: controller.listTripInfo
                            .mapIndexed((i, e) => Container(
                                  // width: Get.width,
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        margin: const EdgeInsets.only(right: 10),
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(4)),
                                        child:
                                            Text("No\n${i + 1}", style: listTitleTextStyle.copyWith(color: whiteColor), textAlign: TextAlign.center),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "${controller.dateFormat.format(DateTime.parse(e.dateDeparture.toString()))} - ${controller.dateFormat.format(DateTime.parse(e.dateArrival.toString()))}",
                                              style: listTitleTextStyle),
                                          SizedBox(
                                            width: Get.width - 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("${e.nameCityFrom} - ${e.nameCityTo}", style: listSubTitleTextStyle),
                                                    Text("${e.zonaName}", style: listSubTitleTextStyle),
                                                    Text("${e.tlkRate?.toInt().toCurrency()}", style: listSubTitleTextStyle),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      child: Container(
                                                        padding: const EdgeInsets.all(5),
                                                        margin: const EdgeInsets.all(2),
                                                        decoration: BoxDecoration(color: successColor, borderRadius: BorderRadius.circular(6)),
                                                        child: const Icon(IconlyBold.edit, color: whiteColor),
                                                      ),
                                                      onTap: () {
                                                        Get.to(const ActTripInfoScreen(), arguments: {
                                                          "id": e.id,
                                                          "idActual": controller.actualID,
                                                          "idZona": controller.zonaID,
                                                          "tlkRate": controller.tlkRate,
                                                          'isEdit': true
                                                        })?.then((value) => controller.fetchList());
                                                      },
                                                    ),
                                                    GestureDetector(
                                                      child: Container(
                                                        padding: const EdgeInsets.all(5),
                                                        margin: const EdgeInsets.all(2),
                                                        decoration: BoxDecoration(color: errorColor, borderRadius: BorderRadius.circular(6)),
                                                        child: const Icon(IconlyBold.delete, color: whiteColor),
                                                      ),
                                                      onTap: () {
                                                        print(e.id);
                                                        Get.dialog(DeleteConfirmationDialog(
                                                          onDeletePressed: () {
                                                            controller.deleteTripInfo(e.id.toString());
                                                            controller.fetchList();
                                                            Get.back();
                                                          },
                                                        ));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                      CustomFilledButton(
                        color: infoColor,
                        title: "Add Trip",
                        icon: Icons.add,
                        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        onPressed: () => Get.to(const ActTripInfoScreen(), arguments: {
                          "idActual": controller.actualID,
                          "idZona": controller.zonaID,
                          "tlkRate": controller.tlkRate,
                          'isEdit': false
                        })?.then((value) => controller.fetchList()),
                      ),
                      CustomTextFormField(
                        controller: controller.purpose,
                        label: "Purpose",
                        isRequired: true,
                      ),
                      const SizedBox(height: 10),
                      const CustomFormLabel(label: "Activities", showRequired: true),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.listActivities
                            .mapIndexed((i, e) => Container(
                                  // width: Get.width,
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        margin: const EdgeInsets.only(right: 10),
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(4)),
                                        child:
                                            Text("No\n${i + 1}", style: listTitleTextStyle.copyWith(color: whiteColor), textAlign: TextAlign.center),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(controller.dateFormat.format(DateTime.parse(e.actDate ?? DateTime.now().toString())),
                                              style: listTitleTextStyle),
                                          SizedBox(
                                            width: Get.width - 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(e.activities.toString(), style: listSubTitleTextStyle),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      child: Container(
                                                        padding: const EdgeInsets.all(5),
                                                        margin: const EdgeInsets.all(2),
                                                        decoration: BoxDecoration(color: successColor, borderRadius: BorderRadius.circular(6)),
                                                        child: const Icon(IconlyBold.edit, color: whiteColor),
                                                      ),
                                                      onTap: () {
                                                        Get.to(const ActActivitiesDetailScreen(),
                                                                arguments: {"idActual": controller.actualID, "id": e.id, 'isEdit': true})
                                                            ?.then((value) => controller.fetchList());
                                                      },
                                                    ),
                                                    GestureDetector(
                                                      child: Container(
                                                        padding: const EdgeInsets.all(5),
                                                        margin: const EdgeInsets.all(2),
                                                        decoration: BoxDecoration(color: errorColor, borderRadius: BorderRadius.circular(6)),
                                                        child: const Icon(IconlyBold.delete, color: whiteColor),
                                                      ),
                                                      onTap: () {
                                                        Get.dialog(DeleteConfirmationDialog(
                                                          onDeletePressed: () {
                                                            controller.deleteActivities(e.id!);
                                                            Get.back();
                                                          },
                                                        ));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                      CustomFilledButton(
                        color: infoColor,
                        title: "Add Activities",
                        icon: Icons.add,
                        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        onPressed: () => Get.to(const ActActivitiesDetailScreen(), arguments: {"idActual": controller.actualID, 'isEdit': false})
                            ?.then((value) => controller.fetchList()),
                      ),
                      CustomTextFormField(
                        controller: controller.totalTLK,
                        label: "Total TLK",
                        isRequired: true,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly, ThousandsSeparatorInputFormatter()],
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: controller.notes,
                        label: "Notes",
                        isRequired: true,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomFilledButton(
                            width: 100,
                            color: Colors.transparent,
                            borderColor: infoColor,
                            title: "Cancel",
                            fontColor: infoColor,
                            onPressed: () => Get.back(),
                          ),
                          CustomFilledButton(
                            width: 100,
                            color: successColor,
                            title: "Submit",
                            onPressed: () {
                              if (controller.formKey.currentState?.validate() == true) {
                                controller.updateActualization();
                              }
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
