import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/master/facility/facility_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/management_meeting_room/add/add_room_info_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddRoomInfoScreen extends StatelessWidget {
  const AddRoomInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddRoomInfoController>(
        init: AddRoomInfoController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Management\nMeeting Room", style: appTitle, textAlign: TextAlign.center),
              leading: const CustomBackButton(),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(8)),
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
                      child: const Icon(IconlyBold.info_square, color: whiteColor),
                    ),
                    Text(controller.isEdit ? "Edit Room Info" : "Room Info", style: appTitle),
                    const SizedBox(height: 39),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*CustomDropDownFormField(
                              // controller: controller.companyID,
                              label: "Company",
                              hintText: controller.loadCompany ? "Loading..." : "Company",
                              isRequired: true,
                              items: controller.companyList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.companyName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.companyID.text = value!;
                                controller.fetchSiteList(value);
                                controller.update();
                              },
                            ),*/
                            CustomTextFormField(
                                isRequired: true,
                                readOnly: true,
                                controller: controller.companyController,
                                label: "Company".tr),
                            const SizedBox(height: 8),
                            /*CustomDropDownFormField(
                              // controller: controller.siteID,
                              label: "Site",
                              hintText: controller.loadSite ? "Loading..." : "Site",
                              isRequired: true,
                              items: controller.siteList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.siteName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value){
                                controller.siteID.text = value!;
                                controller.update();
                              },
                            ),*/
                            CustomTextFormField(
                                isRequired: true,
                                readOnly: true,
                                controller: controller.siteController,
                                label: "Site".tr),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.mrName,
                              label: "Name Meeting Room",
                              isRequired: true,
                            ),
                            const SizedBox(height: 8),
                            /*CustomTextFormField(
                              controller: controller.mrCode,
                              label: "Code Meeting Room",
                              isRequired: true,
                            ),
                            const SizedBox(height: 8),*/
                            CustomTextFormField(
                              controller: controller.capacity,
                              label: "Capacity",
                              isRequired: true,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.floor,
                              label: "Floor",
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              items: const [
                                DropdownMenuItem(
                                  value: "Available",
                                  child: Text("Available"),
                                ),
                                DropdownMenuItem(
                                  value: "Booked",
                                  child: Text("Booked"),
                                ),
                              ],
                              label: "Available Status",
                              isRequired: true,
                              onChanged: (value) {
                                controller.availableStatus.text = value!;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            // CustomTextFormField(
                            //   controller: controller.remarks,
                            //   label: "Remarks",
                            //   multiLine: true,
                            // ),
                            RichText(
                              text: TextSpan(
                                text: "Facilities".tr,
                                style: formlabelTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: "*", style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: controller.showFacilitiesError
                                      ? Colors.redAccent
                                      : Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Wrap(
                                runSpacing: 8,
                                runAlignment: WrapAlignment.center,
                                children: [
                                  ...controller.listSelectedFacility
                                      .mapIndexed((index, item) => Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4.0),
                                      ),
                                      color: Color(0xFFe4e4e4),
                                    ),
                                    margin: const EdgeInsets.only(
                                        right: 5.0, left: 5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          child: Text(
                                            item.facilityName ?? "",
                                            style: listSubTitleTextStyle,
                                          ),
                                        ),
                                        const SizedBox(width: 4.0),
                                        InkWell(
                                          child: const Icon(
                                            Icons.cancel,
                                            size: 14.0,
                                            color: greyColor,
                                          ),
                                          onTap: () {
                                            controller.deleteFacilityItem(item);
                                          },
                                        )
                                      ],
                                    ),
                                  ))
                                      .toList(),
                                  SizedBox(
                                    width: double.infinity,
                                    child: TypeAheadFormField<FacilityModel>(
                                      textFieldConfiguration: TextFieldConfiguration(
                                        controller: controller.autocompleteController,
                                        autofocus: false,
                                        style: Theme.of(context).textTheme.titleMedium,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            hintText: "Facility".tr,
                                            border: InputBorder.none,
                                            contentPadding: const EdgeInsets.symmetric(
                                                horizontal: 4.0, vertical: 4.0),
                                            errorText: null,
                                            errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              gapPadding: 0,
                                            ),
                                            errorStyle: const TextStyle(height: 0)),
                                      ),
                                      suggestionsCallback: (pattern) async {
                                        final list = await controller.getFacilityByKeyword(pattern);
                                        return list;
                                      },
                                      itemBuilder: (context, suggestion) {
                                        return ListTile(
                                          title: Text("${suggestion.facilityName}"),
                                        );
                                      },
                                      onSuggestionSelected: (suggestion) {
                                        controller.listSelectedFacility.add(suggestion);
                                        controller.autocompleteController.text = "";
                                        controller.update();
                                      },
                                      debounceDuration:
                                      const Duration(milliseconds: 1500),
                                      hideOnLoading: true,
                                      hideSuggestionsOnKeyboardHide: true,
                                      keepSuggestionsOnLoading: false,
                                      minCharsForSuggestions: 1,
                                      validator: (value) {
                                        controller.showFacilitiesError = controller.listSelectedFacility.isEmpty;
                                        controller.update();

                                        if (controller.listSelectedFacility.isEmpty) {
                                          return "";
                                        }
                                        return null;
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            if (controller.showFacilitiesError)
                              const Padding(
                                padding: EdgeInsets.only(left: 10, top: 8),
                                child: Text(
                                  "This field is required",
                                  style:
                                  TextStyle(color: Colors.redAccent, fontSize: 12),
                                ),
                              ),
                            const SizedBox(
                              height: 8,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Approval".tr,
                                style: formlabelTextStyle,
                                children: const <TextSpan>[],
                              ),
                            ),
                            Switch(
                              value: controller.isApproval,
                              onChanged: (value) {
                                controller.isApproval = value;
                                controller.update();
                              },
                              activeColor: infoColor,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            if (controller.isApproval)
                              CustomTextFormField(
                                  readOnly: false,
                                  isRequired: true,
                                  controller: TextEditingController(),
                                  label: "Approver".tr),
                            SizedBox(
                              height: controller.isApproval ? 8 : 0,
                            ),
                            Center(
                              child: CustomFilledButton(
                                width: Get.width / 2,
                                color: successColor,
                                title: "Save",
                                onPressed: () {
                                  if (controller.formKey.currentState?.validate() == true) {
                                    controller.saveMeetingRoom();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
