import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/transportation/add/add_transportation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/transportation/transportatio_controller.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';

class TransportationScreen extends StatelessWidget {
  const TransportationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransportationController>(
        init: TransportationController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Request Trip", style: appTitle),
              leading: const CustomBackButton(),
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
                        child: SvgPicture.asset(ImageConstant.car, height: 25),
                      ),
                      Text("Transportation", style: appTitle),
                      const SizedBox(height: 14),
                      Column(
                        children: controller.transportList
                            .mapIndexed(
                              (i, e) => CustomTripCard(
                                listNumber: i + 1,
                                title: e.employeeName.toString(),
                                subtitle: e.typeTransportation.toString(),
                                status: e.status.toString(),
                                info: e.cityName.toString(),
                                isEdit: true,
                                editAction: () => Get.to(const AddTransportationScreen(), arguments: {
                                  'purposeID': controller.purposeID,
                                  'codeDocument': controller.codeDocument,
                                  'otID': e.id,
                                  'isEdit': true,
                                })?.then((result) {
                                  controller.getList();
                                  controller.update();
                                }),
                                isDelete: true,
                                deleteAction: () => Get.dialog(DeleteConfirmationDialog(
                                  onDeletePressed: () {
                                    controller.deleteOT(e.id.toString());
                                    Get.back();
                                  },
                                )),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("From Date", style: listTitleTextStyle),
                                        Text(e.fromDate.toString(), style: listSubTitleTextStyle),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("To Date", style: listTitleTextStyle),
                                        Text(e.toDate.toString(), style: listSubTitleTextStyle),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Quantity", style: listTitleTextStyle),
                                        Text(e.qty.toString(), style: listSubTitleTextStyle),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      Column(
                        children: controller.tvList.isNotEmpty
                            ? controller.tvList
                                .mapIndexed(
                                  (i, e) => CustomTripCard(
                                    listNumber: controller.otList.length + (i + 1),
                                    title: e.employeeName.toString(),
                                    subtitle: 'Blue Bird',
                                    status: e.status.toString(),
                                    // info: int.parse(e.amount.toString()).toCurrency(),
                                    isEdit: true,
                                    editAction: () => Get.to(const AddTransportationScreen(), arguments: {
                                      'purposeID': controller.purposeID,
                                      'tvID': e.id,
                                      'isEdit': true,
                                    })?.then((_) {
                                      controller.getList();
                                      controller.update();
                                    }),
                                    isDelete: true,
                                    deleteAction: () => Get.dialog(DeleteConfirmationDialog(
                                      onDeletePressed: () {
                                        controller.deleteTV(e.id.toString());
                                        Get.back();
                                      },
                                    )),
                                    content: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Departure", style: listTitleTextStyle),
                                            Text(e.nameDepartureCity.toString(), style: listSubTitleTextStyle),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("Arrival", style: listTitleTextStyle),
                                            Text(e.nameArrivalCity.toString(), style: listSubTitleTextStyle),
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
                          title: "Add Transportation",
                          icon: Icons.add,
                          onPressed: () => Get.to(const AddTransportationScreen(), arguments: {'purposeID': controller.purposeID})?.then((_) {
                            controller.getList();
                            controller.update();
                          }),
                        ),
                      ),
                      controller.codeDocument == 4
                          ? Row(
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
                                  title: "Draft",
                                  onPressed: () => Get.offAll(const FormRequestTripScreen(), arguments: {
                                    'id': controller.purposeID,
                                    'codeDocument': controller.codeDocument,
                                  }),
                                ),
                                CustomFilledButton(
                                  width: 100,
                                  color: infoColor,
                                  title: "Submit",
                                  onPressed: () => controller.submit(),
                                ),
                              ],
                            )
                          : Row(
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
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
