import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/request_trip/request_trip_list_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/other_transport/add/add_other_transport_screen.dart';
import 'package:gais/screen/tms/request_trip/add/other_transport/edit/edit_other_transport_screen.dart';
import 'package:gais/screen/tms/request_trip/add/other_transport/other_transport_controller.dart';
import 'package:gais/screen/tms/request_trip/request_trip_list/request_trip_list_screen.dart';
import 'package:get/get.dart';

class OtherTransportScreen extends StatelessWidget {
  const OtherTransportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtherTransportController>(
        init: OtherTransportController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Request Trip", style: appTitle),
              centerTitle: true,
              leading: CustomBackButton(),
              flexibleSpace: TopBar(),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 42,
                      width: 42,
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: infoColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: SvgPicture.asset(ImageConstant.car, height: 25),
                    ),
                    Text("Other Transportation", style: appTitle),
                    SizedBox(height: 14),
                    Column(
                      children: controller.otList
                          .mapIndexed(
                            (i, e) => CustomTripCard(
                              listNumber: i + 1,
                              title: e.noRequestTrip.toString(),
                              subtitle: e.typeTransportation.toString(),
                              status: e.status.toString(),
                              info: e.cityName.toString(),
                              isEdit: true,
                              editAction: () => Get.to(
                                  EditOtherTransportScreen(),
                                  arguments: {
                                    'purposeID': controller.purposeID,
                                    'codeDocument': controller.codeDocument,
                                    'otID': e.id,
                                  })?.then((result) {
                                controller.fetchList();
                                controller.update();
                                print(result);
                              }),
                              isDelete: true,
                              deleteAction: () =>
                                  controller.delete(int.parse(e.id.toString())),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("From Date",
                                          style: listTitleTextStyle),
                                      Text(e.fromDate.toString(),
                                          style: listSubTitleTextStyle),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("To Date",
                                          style: listTitleTextStyle),
                                      Text(e.toDate.toString(),
                                          style: listSubTitleTextStyle),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("Quantity",
                                          style: listTitleTextStyle),
                                      Text(e.qty.toString(),
                                          style: listSubTitleTextStyle),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomFilledButton(
                        color: infoColor,
                        title: "Add Other Transportation",
                        icon: Icons.add,
                        onPressed: () => Get.to(AddOtherTransportScreen(),
                            arguments: {
                              'purposeID': controller.purposeID,
                              'codeDocument': controller.codeDocument
                            })?.then((result) {
                          controller.fetchList();
                          controller.update();
                          print(result);
                        }),
                      ),
                    ),
                    controller.codeDocument == 2
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
                                onPressed: ()=> Get.offAll(RequestTripListScreen()),
                              ),
                              CustomFilledButton(
                                width: 100,
                                color: infoColor,
                                title: "Submit",
                                onPressed: ()=> controller.submit(),
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
                                onPressed: () => controller.next()
                              ),
                            ],
                          )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}
