import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/add/add_accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/check_accommodation/hotels/check_hotels_controller.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CheckHotelsScreen extends StatelessWidget {
  const CheckHotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckHotelsController>(
        init: CheckHotelsController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
                title: Text("Accommodation", style: appTitle),
                leading: IconButton(
                    onPressed: () => Get.off(
                          const AddAccommodationScreen(),
                          arguments: {
                            'purposeID': controller.purposeID,
                            'codeDocument': controller.codeDocument,
                          },
                        ),
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                      size: 30,
                    ))),
            body: Container(
              // alignment: Alignment.center,
              // padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(7),
              height: Get.height,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 42,
                    width: 42,
                    // padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                    child: SvgPicture.asset(ImageConstant.building, height: 25),
                  ),
                  Text("Accommodation", style: appTitle),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Text(controller.selectedCity!.cityName.toString(), style: listTitleTextStyle.copyWith(color: whiteColor)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.checkinDate, style: listTitleTextStyle.copyWith(color: whiteColor)),
                            const Icon(IconlyLight.arrow_right, color: whiteColor),
                            Text(controller.checkoutDate, style: listTitleTextStyle.copyWith(color: whiteColor)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  controller.isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(150),
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : controller.hotelList.isEmpty && controller.isLoading == false
                          ? DataEmpty()
                          : Expanded(
                              child: ListView(
                                  children: controller.hotelList
                                      .mapIndexed((i, e) => Column(
                                            children: [
                                              Card(
                                                elevation: 3,
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 4),
                                                  child: Row(
                                                    children: [
                                                      Image.network(
                                                        e.thumbUri.toString(),
                                                        fit: BoxFit.cover,
                                                        width: Get.width / 4.5,
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets.only(left: 5),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              width: Get.width / 2,
                                                              child: Text(e.hotelName.toString(), style: listTitleTextStyle),
                                                            ),
                                                            RatingBarIndicator(
                                                              rating: e.starRating?.toDouble() ?? 0,
                                                              itemBuilder: (context, index) => const Icon(
                                                                Icons.star,
                                                                color: Colors.amber,
                                                              ),
                                                              itemCount: 5,
                                                              itemSize: 20.0,
                                                              direction: Axis.horizontal,
                                                            ),
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 150,
                                                                  child: Text(
                                                                    e.address.toString(),
                                                                    style: listSubTitleTextStyle.copyWith(color: Colors.blue),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    // Text(
                                                                    //   e.pricePerRoomNight!.toInt().toCurrency().toString(),
                                                                    //   style: listSubTitleTextStyle,
                                                                    // ),
                                                                    GestureDetector(
                                                                      child: Container(
                                                                        margin: const EdgeInsets.only(top: 10),
                                                                        height: 30,
                                                                        padding: const EdgeInsets.all(4),
                                                                        decoration:
                                                                            BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(5)),
                                                                        child: Row(
                                                                          children: [
                                                                            Text(
                                                                              "View Room ",
                                                                              style: listSubTitleTextStyle.copyWith(color: whiteColor),
                                                                            ),
                                                                            Icon(
                                                                              controller.viewRoom[i] == false
                                                                                  ? Icons.keyboard_arrow_down_outlined
                                                                                  : Icons.keyboard_arrow_up,
                                                                              color: whiteColor,
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      onTap: () {
                                                                        controller.viewRoom[i] = controller.viewRoom[i] == false ? true : false;
                                                                        controller.update();
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              controller.viewRoom[i]
                                                  ? Column(
                                                      children: e.rooms
                                                              ?.map((room) => Container(
                                                                    margin: const EdgeInsets.only(left: 20),
                                                                    child: Card(
                                                                      elevation: 3,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Image.asset("assets/img/hotel_room.png"),
                                                                            Container(
                                                                              width: Get.width / 2.5,
                                                                              padding: EdgeInsets.only(left: 5),
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(room.roomName.toString(), style: listTitleTextStyle),
                                                                                  Text(room.includeBreakfast!
                                                                                      ? "Include Breakfast"
                                                                                      : "Not Include Breakfast")
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                Text(
                                                                                  room.totalPrice!.toInt().toCurrency().toString(),
                                                                                  style: listSubTitleTextStyle,
                                                                                ),
                                                                                GestureDetector(
                                                                                  child: Container(
                                                                                    height: 30,
                                                                                    margin: const EdgeInsets.only(top: 5),
                                                                                    padding: const EdgeInsets.all(4),
                                                                                    decoration: BoxDecoration(
                                                                                        color: infoColor, borderRadius: BorderRadius.circular(5)),
                                                                                    child: Text(
                                                                                      "Book ",
                                                                                      style: listSubTitleTextStyle.copyWith(color: whiteColor),
                                                                                    ),
                                                                                  ),
                                                                                  onTap: () {
                                                                                    controller.bookButton(
                                                                                      room.totalPrice.toString(),
                                                                                      e.hotelKey.toString(),
                                                                                      room.roomKey.toString(),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ))
                                                              .toList() ??
                                                          [],
                                                    )
                                                  : const SizedBox(),
                                            ],
                                          ))
                                      .toList()),
                            )
                ],
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
