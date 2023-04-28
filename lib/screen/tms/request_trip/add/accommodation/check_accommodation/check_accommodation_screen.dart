import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/check_accommodation/check_accommodation_controller.dart';
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
            appBar: AppBar(
              title: Text("Accommodation", style: appTitle),
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
                      child: SvgPicture.asset("assets/icons/building.svg",
                          height: 25),
                    ),
                    Text("Accommodation", style: appTitle),
                    SizedBox(height: 14),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                      decoration: BoxDecoration(
                          color: infoColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text("Surabaya",
                              style: listTitleTextStyle.copyWith(
                                  color: whiteColor)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("20/01/23 ",
                                  style: listTitleTextStyle.copyWith(
                                      color: whiteColor)),
                              const Icon(IconlyLight.arrow_right,
                                  color: whiteColor),
                              Text("21/01/23",
                                  style: listTitleTextStyle.copyWith(
                                      color: whiteColor)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset("assets/img/hotel.png"),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Aston Gubeng",
                                          style: listTitleTextStyle),
                                      RatingBarIndicator(
                                        rating: 4,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        direction: Axis.horizontal,
                                      ),
                                      Text(
                                        "Gubeng, Surabaya",
                                        style: listSubTitleTextStyle.copyWith(
                                            color: Colors.blue),
                                      )
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
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: infoColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Row(
                                            children: [
                                              Text(
                                                "View Room ",
                                                style: listSubTitleTextStyle
                                                    .copyWith(
                                                        color: whiteColor),
                                              ),
                                              Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                                color: whiteColor,
                                              )
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          controller.viewRoom =
                                              controller.viewRoom == false
                                                  ? true
                                                  : false;
                                          controller.update();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          controller.viewRoom!
                              ? Container(
                                  margin: EdgeInsets.only(left: 59),
                                  child: Card(
                                    elevation: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                              "assets/img/hotel_room.png"),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Deluxe Room",
                                                  style: listTitleTextStyle),
                                              Text(
                                                  "65ft square\nInclude Breakfast")
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
                                                  margin:
                                                      EdgeInsets.only(top: 5),
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      color: infoColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    "Book ",
                                                    style: listSubTitleTextStyle
                                                        .copyWith(
                                                            color: whiteColor),
                                                  ),
                                                ),
                                                onTap: () {
                                                  controller.viewRoom =
                                                      controller.viewRoom ==
                                                              false
                                                          ? true
                                                          : false;
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
                          Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset("assets/img/hotel.png"),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Aston Gubeng",
                                          style: listTitleTextStyle),
                                      RatingBarIndicator(
                                        rating: 4,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        direction: Axis.horizontal,
                                      ),
                                      Text(
                                        "Gubeng, Surabaya",
                                        style: listSubTitleTextStyle.copyWith(
                                            color: Colors.blue),
                                      )
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
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: infoColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Row(
                                            children: [
                                              Text(
                                                "View Room ",
                                                style: listSubTitleTextStyle
                                                    .copyWith(
                                                        color: whiteColor),
                                              ),
                                              Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                                color: whiteColor,
                                              )
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          controller.viewRoom =
                                              controller.viewRoom == false
                                                  ? true
                                                  : false;
                                          controller.update();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          controller.viewRoom!
                              ? Container(
                                  margin: EdgeInsets.only(left: 59),
                                  child: Card(
                                    elevation: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                              "assets/img/hotel_room.png"),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Deluxe Room",
                                                  style: listTitleTextStyle),
                                              Text(
                                                  "65ft square\nInclude Breakfast")
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
                                                  margin:
                                                      EdgeInsets.only(top: 5),
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      color: infoColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    "Book ",
                                                    style: listSubTitleTextStyle
                                                        .copyWith(
                                                            color: whiteColor),
                                                  ),
                                                ),
                                                onTap: () {
                                                  controller.viewRoom =
                                                      controller.viewRoom ==
                                                              false
                                                          ? true
                                                          : false;
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
                      ),
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
