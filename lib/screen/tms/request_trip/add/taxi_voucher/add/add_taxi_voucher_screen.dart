import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/add/add_taxi_voucher_controller.dart';
import 'package:get/get.dart';

class AddTaxiVoucherScreen extends StatelessWidget {
  const AddTaxiVoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaxiVoucherController>(
        init: AddTaxiVoucherController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Taxi Voucher", style: appTitle),
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
                      child: Icon(Icons.account_balance_wallet_rounded,
                          color: whiteColor),
                    ),
                    Text("Taxi Voucher", style: appTitle),
                    SizedBox(height: 14),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Traveller ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            DropdownButtonFormField(
                              icon: Icon(Icons.keyboard_arrow_down),
                              hint: Text("Name"),
                              value: controller.traveller,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("name"),
                                  value: "value",
                                ),
                              ],
                              onChanged: (value) {
                                controller.traveller = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Date ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: controller.departureDate,
                              decoration: InputDecoration(
                                  hintText: "Date",
                                  suffixIcon: Icon(Icons.keyboard_arrow_down)),
                              onTap: () => showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(DateTime.now().year),
                                      lastDate: DateTime.now()
                                          .add(const Duration(days: 30)))
                                  .then((date) {
                                controller.selectedDate = date!;
                                controller.departureDate.text =
                                    controller.dateFormat.format(date);
                                controller.update();
                              }),
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Departure ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            DropdownButtonFormField(
                              icon: Icon(Icons.keyboard_arrow_down),
                              hint: Text("City"),
                              value: controller.departure,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("name"),
                                  value: "value",
                                ),
                              ],
                              onChanged: (value) {
                                controller.departure = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Arrival ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            DropdownButtonFormField(
                              icon: Icon(Icons.keyboard_arrow_down),
                              hint: Text("City"),
                              value: controller.arrival,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("name"),
                                  value: "value",
                                ),
                              ],
                              onChanged: (value) {
                                controller.arrival = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Amount ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: controller.amount,
                              decoration: InputDecoration(hintText: "Amount"),
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Voucher ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: controller.voucher,
                              decoration: InputDecoration(
                                hintText: "Voucher",
                              ),
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Remarks ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: controller.remarks,
                              decoration: InputDecoration(hintText: "Remarks"),
                            ),
                            SizedBox(height: 8),
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
                                  color: infoColor,
                                  title: "Save",
                                  // onPressed: () => Get.to(TravellerScreen()),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}
