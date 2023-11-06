import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/antavaya/contact_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/train/reservation/train_reservation_controller.dart';
import 'package:gais/screen/tms/request_trip/add/train/train_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class TrainReservationScreen extends StatelessWidget {
  const TrainReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainReservationController>(
        init: TrainReservationController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text(
                "Train",
                style: appTitle,
              ),
              leading: const CustomBackButton(),
            ),
            body: Stack(
              children: [
                Container(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          child: Column(
                            children: [
                              Container(
                                width: Get.width,
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                color: infoColor,
                                child: Text('Train Summary', style: listTitleTextStyle.copyWith(color: whiteColor)),
                              ),
                              Container(
                                width: Get.width,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                color: lightBlueColor,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(controller.trainModel!.departureTime.toString(), style: TextStyle(fontWeight: bold)),
                                        Text(controller.trainModel!.arrivalTime.toString(), style: TextStyle(fontWeight: bold)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(controller.dateFormat.format(DateTime.parse(controller.trainModel!.departureDate!)),
                                            style: TextStyle(fontWeight: bold)),
                                        Text(controller.trainModel!.duration.toString()),
                                        Text(controller.dateFormat.format(DateTime.parse(controller.trainModel!.arrivalDate!)),
                                            style: TextStyle(fontWeight: bold)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          margin: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: blackColor,
                                          ),
                                        ),
                                        Container(
                                          height: 2,
                                          width: Get.width * 0.65,
                                          color: blackColor,
                                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                                        ),
                                        Container(
                                          height: 10,
                                          width: 10,
                                          margin: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.trainModel!.origin.toString(), style: TextStyle(fontWeight: bold)),
                                        Text(
                                          '${controller.trainModel!.trainName}\n${controller.trainModel?.segments?.first.className} (subclass ${controller.trainModel?.segments?.first.subClass})',
                                          style: listTitleTextStyle.copyWith(color: blueColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(controller.trainModel!.destination.toString(), style: TextStyle(fontWeight: bold)),
                                      ],
                                    ),
                                    const Divider(color: blackColor, thickness: 2),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const WidgetSpan(child: Icon(Icons.person, color: blackColor)),
                                              TextSpan(text: "1 Passenggers", style: listTitleTextStyle.copyWith(color: greyColor))
                                            ],
                                          ),
                                        ),
                                        Text(
                                          '${controller.trainModel!.trainName}\n${controller.trainModel?.segments?.first.className} (subclass ${controller.trainModel?.segments?.first.subClass})\n\n${controller.trainModel?.segments?.first.fare!.toInt().toCurrency()} IDR',
                                          textAlign: TextAlign.center,
                                          style: listTitleTextStyle,
                                        ),
                                      ],
                                    ),
                                    const Divider(color: blackColor, thickness: 2),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('Total', style: appTitle),
                                        Text('${controller.trainModel?.segments?.first.fare!.toInt().toCurrency()} IDR',
                                            style: appTitle.copyWith(fontWeight: extraBold)),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
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
                                    const Icon(IconlyBold.profile, color: blackColor),
                                    Text("   Booking Contact", style: appTitle, textAlign: TextAlign.start),
                                  ],
                                ),
                              ),
                              CustomDropDownFormField(
                                items: controller.gaList
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text('${e.firstName} ${e.lastName}'),
                                        ))
                                    .toList(),
                                label: "Name",
                                hintText: controller.isLoading ? 'Loading...' : 'Name',
                                isRequired: true,
                                validator: (value) {
                                  if (value == null) {
                                    return "This field is required";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  controller.bookingContact = ContactModel(
                                    title: value?.title,
                                    firstName: value?.firstName,
                                    lastName: value?.lastName,
                                    email: value?.email,
                                    mobilePhone: value?.phone,
                                  );
                                  controller.update();
                                },
                              ),
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
                                  SizedBox(
                                    width: Get.width / 5,
                                    child: CustomDropDownFormField(
                                      label: "Title",
                                      items: const [
                                        DropdownMenuItem(
                                          value: "MR",
                                          child: Text('MR'),
                                        ),
                                        DropdownMenuItem(
                                          value: "MSTR",
                                          child: Text('MSTR'),
                                        ),
                                        DropdownMenuItem(
                                          value: "MRS",
                                          child: Text('MRS'),
                                        ),
                                        DropdownMenuItem(
                                          value: "MISS",
                                          child: Text('MISS'),
                                        ),
                                        DropdownMenuItem(
                                          value: "INF",
                                          child: Text('INF'),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        controller.passTitle.text = value.toString();
                                        controller.update();
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width - (Get.width / 3),
                                    child: CustomTextFormField(
                                      controller: controller.passFirstName,
                                      label: "First Name",
                                      isRequired: true,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                controller: controller.passLastName,
                                label: "Last Name",
                                isRequired: true,
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                controller: controller.passBirthDate,
                                label: "Birth Date",
                                isRequired: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "This field is required";
                                  }
                                  return null;
                                },
                                suffixIcon: const Icon(Icons.calendar_month),
                                readOnly: true,
                                onTap: () => showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                ).then(
                                  (date) {
                                    controller.birthDate = date!;
                                    controller.passBirthDate.text = controller.dateFormat.format(date);
                                    controller.update();
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                controller: controller.passIDNumber,
                                label: "ID Number",
                                isRequired: true,
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 16 || value.length > 16) {
                                    return 'Number must be 16 digits';
                                  }
                                  return null;
                                },
                                prefixIcon: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: blackColor)),
                                  child: DropdownButton(
                                    underline: const SizedBox(),
                                    value: controller.selectedPassID,
                                    onChanged: (value) {
                                      controller.selectedPassID = value!;
                                      controller.update();
                                    },
                                    items: const [
                                      DropdownMenuItem(value: 'KTP', child: Text("KTP")),
                                      DropdownMenuItem(value: 'SIM', child: Text("SIM")),
                                      DropdownMenuItem(value: 'Passport', child: Text("Passport")),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                controller: controller.passPassportOrigin,
                                label: "Passport Origin",
                                isRequired: true,
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                controller: controller.passPassportExpire,
                                label: "Passport Expire",
                                isRequired: true,
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                controller: controller.passMobilePhone,
                                label: "Mobile Phone",
                                isRequired: true,
                                inputType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 5) {
                                    return 'Number must be between 5 and 20 characters';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    const Icon(Icons.train, color: blackColor),
                                    Text("   Prefered Seat", style: appTitle, textAlign: TextAlign.start),
                                  ],
                                ),
                              ),
                              CustomTextFormField(
                                controller: controller.seatPassengers,
                                label: "Passengers",
                                isRequired: true,
                              ),
                              const SizedBox(height: 8),
                              // CustomTextFormField(
                              //   controller: controller.seatWagonNo,
                              //   label: "Wagon No",
                              //   isRequired: true,
                              // ),
                              CustomDropDownFormField(
                                items: controller.wagonList
                                    .mapIndexed((i, e) => DropdownMenuItem(
                                          value: i.toString(),
                                          child: Text(e.coachName.toString()),
                                        ))
                                    .toList(),
                                label: "Wagon No",
                                hintText: controller.isLoading ? "Loading..." : "Wagon No",
                                isRequired: true,
                                onChanged: (value) {
                                  controller.fetchSeatsRows(value!.toInt());
                                },
                              ),
                              const SizedBox(height: 8),
                              // CustomTextFormField(
                              //   controller: controller.seatNumber,
                              //   label: "Seat Number",
                              //   isRequired: true,
                              // ),
                              CustomDropDownFormField(
                                items: controller.seatsList
                                    .map((e) => DropdownMenuItem(
                                          child: Text(e.seatNumber.toString()),
                                        ))
                                    .toList(),
                                label: "Seat Number",
                              ),
                              const SizedBox(height: 8),
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
                                        : Get.off(const TrainScreen(), arguments: {
                                            'purposeID': controller.purposeID,
                                            'codeDocument': controller.codeDocument,
                                          }),
                                  ),
                                  CustomFilledButton(
                                    color: infoColor,
                                    title: "Book",
                                    width: 100,
                                    onPressed: () {
                                      if (controller.formKey.currentState?.validate() == true) {
                                        controller.saveData();
                                      }
                                    },
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
                controller.isLoading
                    ? Container(
                        color: neutralColor.withOpacity(0.4),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
