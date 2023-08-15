import 'package:gais/const/color.dart';
import 'package:gais/data/model/approval_cash_advance/approval_cash_advance_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/model/pool_car/pool_car_model.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/approval/cash_advance_non_travel/detail/approval_cash_advance_non_travel_detail_screen.dart';
import 'package:gais/screen/approval/cash_advance_travel/detail/approval_cash_advance_travel_detail_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/edit/edit_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/detail/cash_advance_travel_detail_screen.dart';
import 'package:gais/screen/tms/pool_car/detail/pool_car_detail_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:gais/util/enum/approval_action_enum.dart';
import 'package:gais/util/enum/code_document_enum.dart';
import 'package:get/get.dart';

class NotificationNavigation {
  static void navigateToPage(
      {String? codeDocument, String? id, String? typeDocument}) {
    if (typeDocument == TypeDocumentEnum.cashAdvanceTravel.value) {
      CashAdvanceModel item = CashAdvanceModel(id: id);
      Get.to(() => const CashAdvanceTravelDetailScreen(),
          arguments: {"item": item});
    } else if (typeDocument == TypeDocumentEnum.cashAdvanceNonTravel.value) {
      CashAdvanceModel item = CashAdvanceModel(id: id);
      Get.to(() => const EditCashAdvanceNonTravelScreen(),
          arguments: {"item": item});
    } else if (typeDocument == TypeDocumentEnum.poolCarRequest.value) {
      PoolCarModel item = PoolCarModel(id: id);
      Get.to(() => const PoolCarDetailScreen(), arguments: {"item": item});
    } else if (typeDocument == TypeDocumentEnum.requestTrip.value) {
      Get.to(() => const FormRequestTripScreen(), arguments: {
        'id': id,
        'codeDocument': codeDocument,
      });
    } else {
      Get.showSnackbar(CustomGetSnackBar(
          message: "Navigation not implemented yet",
          backgroundColor: redColor));
    }
  }

  static void navigateToPageApproval(
      {String? codeDocument, String? id, String? typeDocument}) {
    if (typeDocument == TypeDocumentEnum.cashAdvanceTravel.value) {
      ApprovalCashAdvanceModel item = ApprovalCashAdvanceModel(idCa: id);
      Get.to(
          () => const ApprovalCashAdvanceTravelDetailScreen(
                approvalActionEnum: ApprovalActionEnum.none,
              ),
          arguments: {"item": item});
    } else if (typeDocument == TypeDocumentEnum.cashAdvanceNonTravel.value) {
      ApprovalCashAdvanceModel item = ApprovalCashAdvanceModel(id: id);
      Get.to(
          () => const ApprovalCashAdvanceNonTravelDetailScreen(
                approvalActionEnum: ApprovalActionEnum.none,
              ),
          arguments: {"item": item});
    } else if (typeDocument == TypeDocumentEnum.requestTrip.value) {
      Get.showSnackbar(CustomGetSnackBar(
          message: "Navigation not implemented yet",
          backgroundColor: redColor));
    } else {
      Get.showSnackbar(CustomGetSnackBar(
          message: "Navigation not implemented yet",
          backgroundColor: redColor));
    }
  }
}
