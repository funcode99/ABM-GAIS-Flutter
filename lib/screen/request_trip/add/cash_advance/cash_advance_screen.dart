import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/request_trip/add/cash_advance/cash_advance_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CashAdvanceScreen extends StatelessWidget {
  const CashAdvanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CashAdvanceController>(
        init: CashAdvanceController(),
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
                      child:
                      SvgPicture.asset("assets/icons/empty-wallet-time.svg", height: 25),
                    ),
                    Text("Cash Advance", style: appTitle),
                    SizedBox(height: 14),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text("Cash Advance",
                          style: listTitleTextStyle,
                          textAlign: TextAlign.start),
                    ),
                    CustomTripCard(
                      listNumber: 1,
                      title: "Jack H",
                      status: "Pending",
                      info: "120.000",
                      isEdit: true,
                      isDelete: true,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Item", style: listTitleTextStyle),
                              Text("Meals", style: listSubTitleTextStyle),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Frequency", style: listTitleTextStyle),
                              Text("2",
                                  style: listSubTitleTextStyle),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Currency", style: listTitleTextStyle),
                              Text("Rupiah", style: listSubTitleTextStyle),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nominal", style: listTitleTextStyle),
                              Text("60.000", style: listSubTitleTextStyle),
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomFilledButton(
                        color: infoColor,
                        title: "Add Cash Advance",
                        icon: Icons.add,
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
                          title: "Draft",
                        ),
                        CustomFilledButton(
                          width: 100,
                          color: infoColor,
                          title: "Submit",
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
