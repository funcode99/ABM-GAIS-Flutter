import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customformlabel.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/reservation/airport_reservation_controller.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AirportReservationScreen extends StatelessWidget {
  const AirportReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AirportReservationController>(
        init: AirportReservationController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text(
                "Airliness",
                style: appTitle,
              ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.flight.airlineName.toString(),
                                  style: listTitleTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  controller.flight.airlineImageUrl.toString(),
                                  height: 40,
                                  width: 40,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.flight.departTime.toString()),
                                    Text(controller.flight.origin.toString()),
                                    Text(
                                      controller.flight.number.toString().split('/').join("\n"),
                                      style: listTitleTextStyle,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Icon(
                                      Icons.arrow_forward,
                                      size: 19,
                                    ),
                                    Text(controller.flight.duration.toString()),
                                    Text(controller.flight.classObjects?.first.category.toString() ?? ""),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.flight.arriveTime.toString()),
                                    Text(controller.flight.destination.toString()),
                                    const Text(""),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(controller.flight.fare!.toInt().toCurrency().toString(), style: listTitleTextStyle),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const Icon(IconlyBold.call, color: blackColor),
                                Text("   Booking Contact", style: appTitle, textAlign: TextAlign.start),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Get.width / 5,
                                child: CustomTextFormField(
                                  controller: controller.bookTitle,
                                  label: "Title",
                                  isRequired: true,
                                ),
                              ),
                              Container(
                                width: Get.width - (Get.width / 3),
                                child: CustomTextFormField(
                                  controller: controller.bookFirstName,
                                  label: "First Name",
                                  isRequired: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.bookLastName,
                            label: "Last Name",
                            isRequired: true,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.bookHomePhone,
                            label: "Home Phone",
                            isRequired: true,
                            inputType: TextInputType.number,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.bookMobilePhone,
                            label: "Mobile Phone",
                            isRequired: true,
                            inputType: TextInputType.number,
                          ),
                          SizedBox(height: 8),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const Icon(IconlyBold.profile, color: blackColor),
                                Text("   Passengers", style: appTitle, textAlign: TextAlign.start),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Get.width / 5,
                                child: CustomTextFormField(
                                  controller: controller.passTitle,
                                  label: "Title",
                                  isRequired: true,
                                ),
                              ),
                              Container(
                                width: Get.width - (Get.width / 3),
                                child: CustomTextFormField(
                                  controller: controller.passFirstName,
                                  label: "First Name",
                                  isRequired: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.passLastName,
                            label: "Last Name",
                            isRequired: true,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.passBirthDate,
                            label: "Birth Date",
                            isRequired: true,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.passEmail,
                            label: "Email",
                            isRequired: true,
                          ),
                          SizedBox(height: 8),
                          CustomFormLabel(label: "Is Senior Citizen?", showRequired: true),
                          Row(
                            children: [
                              Radio(
                                value: true,
                                groupValue: controller.isSeniorCitizen,
                                onChanged: (value) {
                                  controller.isSeniorCitizen = value;
                                  controller.update();
                                },
                              ),
                              Text("Yes"),
                              Radio(
                                value: false,
                                groupValue: controller.isSeniorCitizen,
                                onChanged: (value) {
                                  controller.isSeniorCitizen = value;
                                  controller.update();
                                },
                              ),
                              Text("No"),
                            ],
                          ),
                          CustomTextFormField(
                            controller: controller.passMobilePhone,
                            label: "Mobile Phone",
                            isRequired: true,
                            inputType: TextInputType.number,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.passIDNumber,
                            label: "ID Number",
                            isRequired: true,
                            inputType: TextInputType.number,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.passPassportNumber,
                            label: "Passport Number",
                            isRequired: true,
                            inputType: TextInputType.number,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.passPassportOrigin,
                            label: "Passport Origin",
                            isRequired: true,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.passPassportExpire,
                            label: "Passport Expire",
                            isRequired: true,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.passEmergencyFullName,
                            label: "Emergency Full Name",
                            isRequired: true,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.passEmergencyEmail,
                            label: "Emergency Email",
                            isRequired: true,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: controller.passEmergencyPhone,
                            label: "Emergency Phone",
                            isRequired: true,
                            inputType: TextInputType.number,
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomFilledButton(
                                color: Colors.transparent,
                                fontColor: infoColor,
                                borderColor: infoColor,
                                title: "Cancel",
                                width: 100,
                                onPressed: () => controller.formEdit == true
                                    ? Get.off(const FormRequestTripScreen(), arguments: {
                                        'id': controller.purposeID,
                                        'codeDocument': controller.codeDocument,
                                      })
                                    : Get.off(const AirlinessScreen(), arguments: {
                                        'purposeID': controller.purposeID,
                                        'codeDocument': controller.codeDocument,
                                      }),
                              ),
                              CustomFilledButton(
                                color: infoColor,
                                title: "Book",
                                width: 100,
                                onPressed: () {},
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
          );
        });
  }
}
