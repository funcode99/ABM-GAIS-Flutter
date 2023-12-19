import 'package:gais/const/color.dart';
import 'package:gais/data/model/approval_cash_advance/approval_cash_advance_model.dart';
import 'package:gais/data/model/approval_request_atk/approval_request_atk_model.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/model/pool_car/pool_car_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/approval/cash_advance_non_travel/detail/approval_cash_advance_non_travel_detail_screen.dart';
import 'package:gais/screen/approval/cash_advance_travel/detail/approval_cash_advance_travel_detail_screen.dart';
import 'package:gais/screen/approval/request_atk/detail/detail_approval_request_atk_screen.dart';
import 'package:gais/screen/approval/request_trip/form_request_trip/approval_form_request_trip_screen.dart';
import 'package:gais/screen/fss/booking_meeting_room/detail/detail_booking_meeting_room_screen.dart';
import 'package:gais/screen/fss/document_delivery/form_document_delivery/form_document_delivery_screen.dart';
import 'package:gais/screen/fss/request_atk/detail/detail_request_atk_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/edit/edit_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/detail/cash_advance_travel_detail_screen.dart';
import 'package:gais/screen/tms/pool_car/detail/pool_car_detail_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:gais/util/enum/approval_action_enum.dart';
import 'package:gais/util/enum/code_document_enum.dart';
import 'package:get/get.dart';

class NotificationNavigation {
  static void navigateToPage(
      {String? codeDocument, String? idDocument, String? typeDocument}) {
    if (typeDocument == TypeDocumentEnum.cashAdvanceTravel.value) {
      CashAdvanceModel item = CashAdvanceModel(id: idDocument);
      Get.to(() => const CashAdvanceTravelDetailScreen(),
          arguments: {"item": item});
    } else if (typeDocument == TypeDocumentEnum.cashAdvanceNonTravel.value) {
      CashAdvanceModel item = CashAdvanceModel(id: idDocument);
      Get.to(() => const EditCashAdvanceNonTravelScreen(),
          arguments: {"item": item});
    } else if (typeDocument == TypeDocumentEnum.poolCarRequest.value) {
      PoolCarModel item = PoolCarModel(id: idDocument);
      Get.to(() => const PoolCarDetailScreen(), arguments: {"item": item});
    } else if (typeDocument == TypeDocumentEnum.requestTrip.value) {
      Get.to(() => const FormRequestTripScreen(), arguments: {
        'id': idDocument,
        'codeDocument': codeDocument,
      });
    } else if (typeDocument == TypeDocumentEnum.requestATK.value) {
      RequestAtkModel item = RequestAtkModel(id: idDocument);
      Get.to(() => const RequestATKDetailScreen(), arguments: {"item": item});
    } else if (typeDocument == TypeDocumentEnum.bookingMeetingRoom.value) {
      BookingMeetingRoomModel item = BookingMeetingRoomModel(id: idDocument);
      Get.to(() => const DetailBookingMeetingRoomScreen(), arguments: {"item": item});
    }  else if (typeDocument == TypeDocumentEnum.documentDelivery.value) {
      Get.to(() => const FormDocumentDeliveryScreen(), arguments: {"id": idDocument.toString()});
    } else {
      Get.showSnackbar(CustomGetSnackBar(
          message: "Navigation not implemented yet",
          backgroundColor: redColor));
    }
  }

  static void navigateToPageApproval(
      {String? codeDocument, String? idDocument, String? typeDocument}) {
    if (typeDocument == TypeDocumentEnum.cashAdvanceTravel.value) {
      ApprovalCashAdvanceModel item = ApprovalCashAdvanceModel(idCa: idDocument);
      Get.to(
          () => const ApprovalCashAdvanceTravelDetailScreen(
                approvalActionEnum: ApprovalActionEnum.none,
              ),
          arguments: {"item": item});
    } else if (typeDocument == TypeDocumentEnum.cashAdvanceNonTravel.value) {
      ApprovalCashAdvanceModel item = ApprovalCashAdvanceModel(id: idDocument);
      Get.to(
          () => const ApprovalCashAdvanceNonTravelDetailScreen(
                approvalActionEnum: ApprovalActionEnum.none,
              ),
          arguments: {"item": item});
    } else if (typeDocument == TypeDocumentEnum.requestTrip.value) {
      Get.to(() => const ApprovalFormRequestTripScreen(), arguments: {
        'id': idDocument, //id approval request trip
        'approvalEnum': ApprovalActionEnum.none
      });
    } else if (typeDocument == TypeDocumentEnum.requestATK.value) {
      ApprovalRequestATKModel item = ApprovalRequestATKModel(id: idDocument);
      Get.to(
              () => const DetailApprovalRequestATKScreen(
            approvalActionEnum: ApprovalActionEnum.none,
          ),
          arguments: {"item": item});
    }  else if (typeDocument == TypeDocumentEnum.bookingMeetingRoom.value) {
      BookingMeetingRoomModel item = BookingMeetingRoomModel(id: idDocument);
      Get.to(() => const DetailBookingMeetingRoomScreen(), arguments: {"item": item});
    }    else if (typeDocument == TypeDocumentEnum.documentDelivery.value) {
      Get.to(() => const FormDocumentDeliveryScreen(), arguments: {"id": idDocument.toString()});
    } else {
      Get.showSnackbar(CustomGetSnackBar(
          message: "Navigation not implemented yet",
          backgroundColor: redColor));
    }
  }
}
