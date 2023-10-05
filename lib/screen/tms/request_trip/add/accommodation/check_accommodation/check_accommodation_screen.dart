import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/add/add_accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/check_accommodation/check_accommodation_controller.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/edit/edit_accommodation_screen.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CheckAccommodationScreen extends StatelessWidget {
  const CheckAccommodationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckAccommodationController>(
        init: CheckAccommodationController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
                title: Text("Accommodation", style: appTitle),
                leading: IconButton(
                    onPressed: () => Get.off(
                          controller.isEdit == true ? EditAccommodationScreen() : AddAccommodationScreen(),
                          arguments: {
                            'purposeID': controller.purposeID,
                            'codeDocument': controller.codeDocument,
                          },
                        ),
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                      size: 30,
                    ))),
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
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                      child: SvgPicture.asset(ImageConstant.building, height: 25),
                    ),
                    Text("Accommodation", style: appTitle),
                    SizedBox(height: 14),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(controller.city.toString(), style: listTitleTextStyle.copyWith(color: whiteColor)),
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
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      child: Column(
                          children: controller.hotelList
                              .mapIndexed((i, e) => Column(
                                    children: [
                                      Card(
                                        elevation: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 4),
                                          child: Row(
                                            children: [
                                              Image.asset("assets/img/hotel.png"),
                                              Container(
                                                margin: EdgeInsets.only(left: 5),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(e.hotelName.toString(), style: listTitleTextStyle),
                                                    RatingBarIndicator(
                                                      // rating: e.rating?.toDouble() ?? 0,
                                                      itemBuilder: (context, index) => Icon(
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
                                                            Text(
                                                              "899.990\n ",
                                                              style: listSubTitleTextStyle,
                                                            ),
                                                            GestureDetector(
                                                              child: Container(
                                                                height: 30,
                                                                padding: EdgeInsets.all(4),
                                                                decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(5)),
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
                                          ? Container(
                                              margin: EdgeInsets.only(left: 59),
                                              child: Card(
                                                elevation: 3,
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Image.asset("assets/img/hotel_room.png"),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Deluxe Room", style: listTitleTextStyle),
                                                          Text("65ft square\nInclude Breakfast")
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "899.990",
                                                            style: listSubTitleTextStyle,
                                                          ),
                                                          GestureDetector(
                                                            child: Container(
                                                              height: 30,
                                                              margin: EdgeInsets.only(top: 5),
                                                              padding: EdgeInsets.all(4),
                                                              decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(5)),
                                                              child: Text(
                                                                "Book ",
                                                                style: listSubTitleTextStyle.copyWith(color: whiteColor),
                                                              ),
                                                            ),
                                                            onTap: () {
                                                              // controller.selectHotel(
                                                                // e.id.toString(),
                                                                // 899990,
                                                                // e.id.toString(),
                                                                // e.idTypeHotel.toString(),
                                                              // );
                                                              controller.update();
                                                            },
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : SizedBox(),
                                    ],
                                  ))
                              .toList()),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomBar(menu: 0),
          );
        });
  }
}
