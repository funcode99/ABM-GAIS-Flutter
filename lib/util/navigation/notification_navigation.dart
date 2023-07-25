import 'package:gais/const/color.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/model/pool_car/pool_car_model.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/edit/edit_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/detail/cash_advance_travel_detail_screen.dart';
import 'package:gais/screen/tms/pool_car/detail/pool_car_detail_screen.dart';
import 'package:gais/util/enum/code_document_enum.dart';
import 'package:get/get.dart';


class NotificationNavigation {
  static void navigateToPage({String? codeDocument, String? id}) {
    if (codeDocument == CodeDocumentEnum.cashAdvanceTravel.value) {
      CashAdvanceModel item = CashAdvanceModel(id: id);
      Get.to(() => const CashAdvanceTravelDetailScreen(),
          arguments: {"item": item});
    } else if (codeDocument == CodeDocumentEnum.cashAdvanceNonTravel.value) {
      CashAdvanceModel item = CashAdvanceModel(id: id);
      Get.to(() => const EditCashAdvanceNonTravelScreen(),
          arguments: {"item": item});
    }else if (codeDocument == CodeDocumentEnum.poolCarRequest.value) {
      PoolCarModel item = PoolCarModel(id: id);
      Get.to(() => const PoolCarDetailScreen(),
          arguments: {"item": item}
      );
    }else if (codeDocument == CodeDocumentEnum.requestTrip.value) {
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
