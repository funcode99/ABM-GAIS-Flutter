import 'package:gais/base/base_repository.dart';
import 'package:gais/data/network_core.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_non_travel_repository.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_travel_repository.dart';
import 'package:gais/data/repository/repository.dart';
import 'package:gais/data/repository/repository_impl.dart';
import 'package:gais/data/storage_core.dart';
import 'package:get/get.dart';


class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkCore>(NetworkCore(), permanent: true);
    Get.put<StorageCore>(StorageCore(), permanent: true);
    Get.put<Repository>(RepositoryImpl(), permanent: true);

    Get.put(CashAdvanceTravelRepository(), permanent: true);
    Get.put(CashAdvanceNonTravelRepository(), permanent: true);
  }
}