import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customalertcontainer.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customformlabel.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/actualization_trip/add/form_actualization_trip_controller.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/actualization_trip/add/activities_detail/act_activities_detail_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/actualization_trip/add/trip_info/act_trip_info_screen.dart';
import 'package:gais/util/input_formatter/thousand_separator_input_formatter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class FormActualizationTripScreen extends StatelessWidget {
  const FormActualizationTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FormActualizationTripController controller =
    Get.put(FormActualizationTripController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Actualization Trip", style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: () {
              controller.updateButton();
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: 32, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      controller: controller.purposeController,
                      label: "Purpose".tr),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Trip Info",
                    style: formlabelTextStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),


                  ActualizationTripItem(
                    action: [
                      CustomIconButton(
                        iconData: IconlyBold.edit,
                        backgroundColor: successColor,
                        onPressed: () {
                          Get.dialog(DeleteConfirmationDialog(
                            onDeletePressed: () {},
                          ));
                        },
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      CustomIconButton(
                        iconData: IconlyBold.delete,
                        backgroundColor: redColor,
                        onPressed: () {
                          Get.dialog(DeleteConfirmationDialog(
                            onDeletePressed: () {},
                          ));
                        },
                      )
                    ],
                    title: "23/04/2023 - 25/04/2023, Jakarta -> Surabaya",
                    number: "1",
                    content: Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: infoColor,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "26/04/2023 -> 26/04/2023",
                                style: TextStyle(
                                    fontSize: 12
                                ),
                              ),
                              Text(
                                "SGU -> GMR",
                                style: TextStyle(
                                    fontSize: 12
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: infoColor),
                      child: RichText(
                        text: TextSpan(
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            children: [
                              const TextSpan(text: "+ "),
                              TextSpan(text: "Add Trip".tr)
                            ]),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 16,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Activities ',
                      style: formlabelTextStyle,
                      children: const <TextSpan>[
                        TextSpan(text: '*', style: TextStyle(color: Colors
                            .red)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ActualizationTripItem(
                    action: [
                      CustomIconButton(
                        iconData: IconlyBold.edit,
                        backgroundColor: successColor,
                        onPressed: () {
                          Get.dialog(DeleteConfirmationDialog(
                            onDeletePressed: () {},
                          ));
                        },
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      CustomIconButton(
                        iconData: IconlyBold.delete,
                        backgroundColor: redColor,
                        onPressed: () {
                          Get.dialog(DeleteConfirmationDialog(
                            onDeletePressed: () {},
                          ));
                        },
                      )
                    ],
                    title: "23/04/2023",
                    number: "1",
                    content: Text(
                        "Travel from Jakarta to Surabaya"
                    ),

                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: infoColor),
                      child: RichText(
                        text: TextSpan(
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            children: [
                              const TextSpan(text: "+ "),
                              TextSpan(text: "Add Activities".tr)
                            ]),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    multiLine: true,
                    controller: controller.notesController,
                    label: "Notes".tr,
                    isRequired: true,
                  ),


                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                        ),
                        child: Text("Cancel".tr),
                      ),
                      Obx(() {
                        return ElevatedButton(
                          onPressed: controller.enableButton.value
                              ? () {

                          }
                              : null,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: successColor),
                          child: Text("Submit".tr),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}

class ActualizationTripItem extends StatelessWidget {
  final String? number;
  final String? title;
  final Widget? content;
  final List<Widget> action;

  const ActualizationTripItem(
      {super.key, this.title, this.content, required this.action, this.number});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 50,
            minWidth: 50,
          ),
          child: CustomAlertContainer(
            backgroundColor: infoColor,
            content: Text("No\n${number}",
                style: listTitleTextStyle.copyWith(color: whiteColor),
                textAlign: TextAlign.center),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title != null
                  ? Text(
                  title ?? "", style: listTitleTextStyle.copyWith(fontSize: 12))
                  :
              const SizedBox(height: 6,),
              content ?? const SizedBox(),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: action,
              )
            ],
          ),
        ),
      ],
    );
  }

}
