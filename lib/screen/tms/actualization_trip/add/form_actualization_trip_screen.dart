import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
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
import 'package:gais/screen/tms/actualization_trip/actualization_trip_item.dart';
import 'package:gais/screen/tms/actualization_trip/add/form_activitiy_actualization_trip_screen.dart';
import 'package:gais/screen/tms/actualization_trip/add/form_actualization_trip_controller.dart';
import 'package:gais/screen/tms/actualization_trip/add/form_trip_info_actualization_trip_screen.dart';
import 'package:gais/screen/tms/actualization_trip/detail/actualization_trip_detail_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/actualization_trip/add/activities_detail/act_activities_detail_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/actualization_trip/add/trip_info/act_trip_info_screen.dart';
import 'package:gais/util/input_formatter/thousand_separator_input_formatter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class FormActualizationTripScreen extends StatelessWidget {
  const FormActualizationTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic>? ids;
    if (Get.arguments != null) {
      ids = Get.arguments["ids"];
    }


    final FormActualizationTripController controller =
    Get.put(FormActualizationTripController())
      ..listIdRequestTrip(ids);

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

                  Obx(
                          () =>
                          Column(
                            children: [
                              ...controller.listTripInfo.mapIndexed((index,
                                  item) {
                                return ActualizationTripItem(
                                  action: [
                                    CustomIconButton(
                                      iconData: IconlyBold.edit,
                                      backgroundColor: successColor,
                                      onPressed: () {

                                      },
                                    ),
                                    SizedBox(
                                      width: item.deletable ? 4 : 0,
                                    ),
                                    if(item.deletable)
                                      CustomIconButton(
                                        iconData: IconlyBold.delete,
                                        backgroundColor: redColor,
                                        onPressed: () {},
                                      )
                                  ],
                                  title: "${item
                                      .textDate}, Jakarta -> Surabaya",
                                  number: "${index + 1}",
                                  content: Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: infoColor,
                                          ),
                                          child: item.type != null &&
                                              item.type!.isNotEmpty
                                              ?
                                          SvgPicture.asset(
                                              item.type?.toLowerCase() ==
                                                  "train"
                                                  ? ImageConstant.train
                                                  : ImageConstant.airplane)
                                              : SizedBox(),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "${item.textDate}",
                                              style: const TextStyle(
                                                  fontSize: 12
                                              ),
                                            ),
                                            Text(
                                              "${item.origin} -> ${item
                                                  .destination}",
                                              style: const TextStyle(
                                                  fontSize: 12
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),

                                );
                              }),
                            ],
                          )
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        Get
                            .to(() => const FormTripInfoActualizationTripScreen());
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
                  Obx(() {
                    return Column(
                      children: [
                        ...controller.listActivity.mapIndexed((index, item){
                          return ActualizationTripItem(
                            action: [
                              CustomIconButton(
                                iconData: IconlyBold.edit,
                                backgroundColor: successColor,
                                onPressed: () {

                                },
                              ),
                              SizedBox(
                                width: item.deletable ? 4 : 0,
                              ),
                              if(item.deletable)
                                CustomIconButton(
                                  iconData: IconlyBold.delete,
                                  backgroundColor: redColor,
                                  onPressed: () {},
                                )
                            ],
                            title: "${item.actDate}",
                            number: "${index + 1}",
                            content: Text(
                                "${item.activities}"
                            ),

                          );
                        })
                      ],
                    );
                  }),

                  const SizedBox(
                    height: 16,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        Get
                            .to(() => const FormActivityActualizationTripScreen());
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
                            Get
                                .off(() => const ActualizationTripDetailScreen());
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