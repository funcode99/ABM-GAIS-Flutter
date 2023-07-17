import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/other_transport/other_transport_screen.dart';
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/add/add_taxi_voucher_screen.dart';
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/edit/edit_taxi_voucher_screen.dart';
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/taxi_voucher_controller.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:gais/screen/tms/request_trip/request_trip_list/request_trip_list_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:get/get.dart';

class TaxiVoucherScreen extends StatelessWidget {
  const TaxiVoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaxiVoucherController>(
        init: TaxiVoucherController(),
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
                      child: const Icon(Icons.account_balance_wallet_rounded,
                          color: whiteColor),
                    ),
                    Text("Taxi Voucher", style: appTitle),
                    const SizedBox(height: 14),
                    Column(
                      children: controller.tvList.isNotEmpty
                          ? controller.tvList
                              .mapIndexed(
                                (i, e) => CustomTripCard(
                                  listNumber: i + 1,
                                  title: e.accountName.toString(),
                                  subtitle: e.date,
                                  status: e.status.toString(),
                                  info: int.parse(e.amount.toString()).toCurrency(),
                                  isEdit: true,
                                  editAction: () => Get.to(
                                      const EditTaxiVoucherScreen(),
                                      arguments: {
                                        'purposeID': controller.purposeID,
                                        'id': e.id
                                      })?.then((_) {
                                    controller.getList();
                                    controller.update();
                                  }),
                                  isDelete: true,
                                  deleteAction: () => controller
                                      .delete(int.parse(e.id.toString())),
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text("Departure",
                                              style: listTitleTextStyle),
                                          Text(e.nameDepartureCity.toString(),
                                              style: listSubTitleTextStyle),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text("Arrival",
                                              style: listTitleTextStyle),
                                          Text(e.nameArrivalCity.toString(),
                                              style: listSubTitleTextStyle),
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
                        title: "Add Taxi Voucher",
                        icon: Icons.add,
                        onPressed: () => Get.to(const AddTaxiVoucherScreen(),
                                arguments: {'purposeID': controller.purposeID})
                            ?.then((_) {
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
                                onPressed: ()=> Get.offAll(FormRequestTripScreen(), arguments: {
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
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
