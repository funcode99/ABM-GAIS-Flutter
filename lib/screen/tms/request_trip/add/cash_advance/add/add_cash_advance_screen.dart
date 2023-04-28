import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/add/add_cash_advance_controller.dart';
import 'package:get/get.dart';

class AddCashAdvanceScreen extends StatelessWidget {
  const AddCashAdvanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCashAdvanceController>(
      init: AddCashAdvanceController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Cash Advance", style: appTitle),
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
                        color: infoColor, borderRadius: BorderRadius.circular(50)),
                    child: SvgPicture.asset("assets/icons/empty-wallet-time.svg",
                        height: 25),
                  ),
                  Text("Cash Advance", style: appTitle),
                  SizedBox(height: 14),
                  Form(
                    // key: controller.formKey,
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
                            // //value: controller.type,
                            isExpanded: true,
                            // underline: SizedBox(),
                            items: [
                              DropdownMenuItem(
                                child: Text("name"),
                                value: "value",
                              ),
                            ],
                            onChanged: (value) {
                              // controller.type = value;
                              controller.update();
                            },
                          ),
                          SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              text: 'Item ',
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
                            hint: Text("Item"),
                            //value: controller.name,
                            isExpanded: true,
                            // underline: SizedBox(),
                            items: [
                              DropdownMenuItem(
                                child: Text("name"),
                                value: "value",
                              ),
                            ],
                            onChanged: (value) {
                              // controller.name = value;
                              controller.update();
                            },
                          ),
                          SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              text: 'Frequency ',
                              style: listTitleTextStyle,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Frequency"
                            ),
                          ),
                          SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              text: 'Curency ',
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
                            hint: Text("Curency"),
                            //value: controller.gender,
                            isExpanded: true,
                            // underline: SizedBox(),
                            items: [
                            ],
                            onChanged: (value) {
                              // controller.gender = value;
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
                            // controller: controller.contact,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              hintText: "Amount",
                              hintStyle: hintTextStyle,
                            ),
                          ),
                          SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              text: 'Total ',
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
                            hint: Text("Total"),
                            //value: controller.department,
                            isExpanded: true,
                            // underline: SizedBox(),
                            items: [
                              DropdownMenuItem(
                                child: Text("name"),
                                value: "value",
                              ),
                            ],
                            onChanged: (value) {
                              // controller.department = value;
                              controller.update();
                            },
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
                            decoration: InputDecoration(
                              hintText: "Remarks"
                            ),
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
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomBar(menu: 1),
        );
      }
    );
  }
}
