import 'package:gais/data/network_core.dart';
import 'package:gais/data/repository/approval_request_trip/approval_request_trip_impl.dart';
import 'package:gais/data/repository/approval_request_trip/approval_request_trip_repository.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_non_travel_repository.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_travel_repository.dart';
import 'package:gais/data/repository/document_delivery/document_delivery_impl.dart';
import 'package:gais/data/repository/document_delivery/document_delivery_repository.dart';
import 'package:gais/data/repository/management_item_atk/management_item_atk_repository.dart';
import 'package:gais/data/repository/master/master_repository.dart';
import 'package:gais/data/repository/repository.dart';
import 'package:gais/data/repository/repository_impl.dart';
import 'package:gais/data/repository/request_atk/request_atk_repository.dart';
import 'package:gais/data/repository/stock_in/stock_in_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:get/get.dart';


class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkCore>(NetworkCore(), permanent: true);
    Get.put<StorageCore>(StorageCore(), permanent: true);
    Get.put<Repository>(RepositoryImpl(), permanent: true);
    Get.put<DocumentDeliveryRepository>(DocumentDeliveryImpl(), permanent:  true);
    Get.put<ApprovalRequestTripRepository>(ApprovalRequestTripImpl(), permanent: true);

    Get.put(CashAdvanceTravelRepository(), permanent: false);
    Get.put(CashAdvanceNonTravelRepository(), permanent: false);
    Get.put(RequestATKRepository(), permanent: false);
    Get.put(ManagementItemATKRepository(), permanent: false);
    Get.put(StockInATKRepository(), permanent: false);


    Get.put(MasterRepository(), permanent: true);
  }
}