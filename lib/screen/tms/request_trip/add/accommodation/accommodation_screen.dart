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
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/accommodation_controller.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/add/add_accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/edit/edit_accommodation_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:get/get.dart';

class AccommodationScreen extends StatelessWidget {
  const AccommodationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccommodationController>(
        init: AccommodationController(),
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
                      child:
                          SvgPicture.asset(ImageConstant.building, height: 25),
                    ),
                    Text("Accommodation", style: appTitle),
                    const SizedBox(height: 14),
                    Column(
                      children: controller.accommodationsList
                          .mapIndexed(
                            (i, e) => CustomTripCard(
                              listNumber: i + 1,
                              title: e.employeeName.toString(),
                              status: e.status.toString(),
                              info: e.hotelName,
                              //hotel name
                              isEdit: true,
                              editAction: () => Get.off(
                                  const EditAccommodationScreen(),
                                  arguments: {
                                    'purposeID': controller.purposeID,
                                    'codeDocument': controller.codeDocument,
                                    'id': e.id,
                                    'formEdit': controller.formEdit
                                  })?.then((result) {
                                controller.fetchList();
                                controller.update();
                                print(result);
                              }),
                              isDelete: true,
                              deleteAction: () =>
                                  controller.delete(e.id!.toInt()),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Check In",
                                          style: listTitleTextStyle),
                                      Text(e.checkInDate.toString(),
                                          style: listSubTitleTextStyle),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Check Out",
                                          style: listTitleTextStyle),
                                      Text(e.checkOutDate.toString(),
                                          style: listSubTitleTextStyle),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Price", style: listTitleTextStyle),
                                      Text("${int.parse(e.price ?? "0").toCurrency()}",
                                          style: listSubTitleTextStyle),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomFilledButton(
                        color: infoColor,
                        title: "Add Accommodation",
                        icon: Icons.add,
                        onPressed: () => Get.off(const AddAccommodationScreen(),
                            arguments: {
                              'purposeID': controller.purposeID,
                              'codeDocument': controller.codeDocument,
                              'formEdit': true,
                            })?.then((result) {
                          controller.fetchList();
                          controller.update();
                          print(result);
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
                          onPressed: () => controller.next()
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
