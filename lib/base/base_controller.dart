import 'package:gais/data/repository/repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final repository = Get.find<Repository>();
  final storage = Get.find<StorageCore>();

}