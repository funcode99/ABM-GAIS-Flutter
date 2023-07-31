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
import 'package:gais/screen/tms/request_trip/add/airliness/add/add_airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_controller.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/check_schedule/check_schedule_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:get/get.dart';

class AirlinessScreen extends StatelessWidget {
  const AirlinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AirlinessController>(
        init: AirlinessController(),
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
              child: RefreshIndicator(
                onRefresh: () async{
                  controller.fetchList();
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
                        child: SvgPicture.asset(
                          ImageConstant.airplane,
                          height: 25,
                        ),
                      ),
                      Text("Airliness", style: appTitle),
                      SizedBox(height: 14),
                      Column(
                        children: controller.airlinessList
                            .mapIndexed((i, e) => CustomTripCard(
                                  listNumber: i + 1,
                                  title: controller.travellerName,
                                  subtitle: controller.dateFormat.format(DateTime.parse(e.createdAt.toString())).toString(),
                                  status: controller.statusModel?.data?.where((status) => status.code == e.codeStatusDoc).first.status,
                                  info: e.flightNo,
                                  isEdit: true,
                                  editAction: () {
                                    Get.off(CheckScheduleScreen(),
                                        arguments: {'id': e.id, 'purposeID': controller.purposeID, 'codeDocument': controller.codeDocument});
                                  },
                                  isDelete: true,
                                  deleteAction: () => controller.delete(e.id.toString()),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Departure", style: listTitleTextStyle),
                                          Text("CGK (06.00)", style: listSubTitleTextStyle),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Arrival", style: listTitleTextStyle),
                                          Text("SUB (09.00)", style: listSubTitleTextStyle),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Price", style: listTitleTextStyle),
                                          Text("${int.parse(e.ticketPrice.toString()).toCurrency()}", style: listSubTitleTextStyle),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: CustomFilledButton(
                          color: infoColor,
                          title: "Add Airliness",
                          icon: Icons.add,
                          onPressed: () => Get.off(AddAirlinessScreen(), arguments: {
                            'purposeID': controller.purposeID,
                            'codeDocument': controller.codeDocument,
                            'formEdit': controller.formEdit,
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
                            onPressed: () => Get.back(result: {'purposeID': controller.purposeID, 'codeDocument': controller.codeDocument}),
                          ),
                          CustomFilledButton(width: 100, color: infoColor, title: "Next", onPressed: () => controller.next()),
                        ],
                      )
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
