import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/document_delivery/add/add_document_delivery_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';


class AddDocumentDeliveryScreen extends StatelessWidget {
  const AddDocumentDeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddDocumentDeliveryController>(
        init: AddDocumentDeliveryController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Document Delivery Info", style: appTitle),
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
                    Text("Document Delivery", style: appTitle),
                    const SizedBox(height: 39),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              controller: controller.sender,
                              label: "Sender",
                              isRequired: true,
                              readOnly: true,
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: "Receiver".tr,
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
                                  color: controller.showReceiverError
                                      ? Colors.redAccent
                                      : Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: TypeAheadFormField<EmployeeModel>(
                                  textFieldConfiguration: TextFieldConfiguration(
                                    controller: controller.autocompleteController,
                                    autofocus: false,
                                    style: Theme.of(context).textTheme.titleMedium,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Receiver".tr,
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
                                    final list = await controller.getEmployeeByKeyword(pattern);
                                    return list;
                                  },
                                  itemBuilder: (context, suggestion) {
                                    return ListTile(
                                      title: Text("${suggestion.employeeName}"),
                                      subtitle: Text("${suggestion.email}"),
                                    );
                                  },
                                  onSuggestionSelected: (suggestion) {
                                    controller.onChangeSelectedReceiver(suggestion.id.toString());
                                    controller.autocompleteController.text = suggestion.employeeName ?? "";
                                  },
                                  debounceDuration:
                                  const Duration(milliseconds: 1500),
                                  hideOnLoading: true,
                                  hideSuggestionsOnKeyboardHide: true,
                                  keepSuggestionsOnLoading: false,
                                  minCharsForSuggestions: 1,
                                  validator: (value) {
                                    controller.showReceiverError = controller.selectedEmployee == null;
                                    controller.update();

                                    if (controller.selectedEmployee == null) {
                                      return "";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            if (controller.showReceiverError)
                            const Padding(
                              padding: EdgeInsets.only(left: 10, top: 8),
                              child: Text(
                                "This field is required",
                                style:
                                TextStyle(color: Colors.redAccent, fontSize: 12),
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.company,
                              label: "Receiver Company",
                              isRequired: false,
                              readOnly: true,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.location,
                              label: "Location",
                              isRequired: false,
                              readOnly: true,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.subjectDocument,
                              label: "Subject Document",
                              isRequired: true,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.attachment,
                              label: "Attachment (Optional)",
                              suffixIcon: const Icon(Icons.upload),
                              readOnly: true,
                              onTap: (){
                                controller.getSingleFile();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.remarks,
                              label: "Remarks",
                              multiLine: true,
                            ),
                            Center(
                              child: CustomFilledButton(
                                width: Get.width / 2,
                                color: successColor,
                                title: "Save",
                                onPressed: () {
                                  if (controller.formKey.currentState?.validate() == true) {
                                    controller.saveDocument();
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
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
