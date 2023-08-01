import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/pool_car/management_poolcar/get_car_type_model.dart' as car;
import 'package:gais/data/model/pool_car/management_poolcar/get_driver_model.dart' as driver;
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:gais/screen/tms/pool_car/management_poolcar/list/management_poolcar_list_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddManagementPoolCarController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final selectedCompany = TextEditingController();
  final selectedSite = TextEditingController();
  final nameCar = TextEditingController();
  final plate = TextEditingController();
  final odometer = TextEditingController();
  final selectedCarType = TextEditingController();
  final selectedTransmision = TextEditingController();
  final selectedStatus = TextEditingController();
  final selectedDriver = TextEditingController();

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final hullNumberController = TextEditingController();
  final assetNumberController = TextEditingController();
  final vendorNameController = TextEditingController();
  final vehicleRegistrationDateController = TextEditingController();
  final plateExpiredDateController = TextEditingController();
  final kirRegistrationDateController = TextEditingController();
  final stickerExpiredDateController = TextEditingController();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  bool isAdministrator = false;
  bool isSuperAdmin = false;
  bool isAdmin = false;
  bool isLoading = false;
  bool isLoadSite = false;
  bool isEdit = false;

  List<comp.Data> companyList = [];
  List<site.Data> siteList = [];
  List<car.Data> carTypeList = [];
  List<driver.Data> driverList = [];
  List<int> typeList = [
    1,
    2,
  ];

  int? carID;
  String? companyID;
  int? siteID;
  int? carTypeID;
  int? driverID;
  String selectedType = "1";

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();

  final vehicleRegistrationDate = Rxn<DateTime>();
  final plateExpiredDate = Rxn<DateTime>();
  final kirRegistrationDate = Rxn<DateTime>();
  final stickerExpiredDate = Rxn<DateTime>();

  @override
  void onInit() {
    super.onInit();
    fetchList();

    if(Get.arguments != null){
      carID = Get.arguments['id'];
      isEdit = Get.arguments['isEdit'];
    }
    if (isEdit == true) fetchEdit();
  }

  Future<void> fetchEdit() async {
    try {
      await managementPoolCar.getByID(carID!).then((value) {
        selectedCompany.text = value.data?.first.idCompany.toString() ?? "";
        selectedSite.text = value.data?.first.idSite.toString() ?? "";
        nameCar.text = value.data?.first.carName.toString() ?? "";
        plate.text = value.data?.first.plate.toString() ?? "";
        odometer.text = value.data?.first.odometer.toString() ?? "";
        selectedCarType.text = value.data?.first.idCarType.toString() ?? "";
        selectedTransmision.text = value.data?.first.transmisi.toString() ?? "";
        selectedStatus.text = value.data?.first.status.toString() ?? "";
        selectedDriver.text = value.data?.first.idDriver.toString() ?? "";
      });
    } catch (e) {
      e.printError();
    }
    update();
  }

  Future<void> fetchList() async {
    isLoading = true;
    companyList = [];
    siteList = [];
    carTypeList = [];
    driverList = [];

    try {
      await repository.getCompanyList().then((value) => companyList.addAll(value.data?.toSet().toList() ?? []));

      await repository.getSiteList().then((value) => siteList.addAll(value.data?.toSet().toList() ?? []));

      await managementPoolCar.getCarTypeList().then((value) {
        carTypeList.addAll(value.data?.toSet().toList() ?? []);
        carTypeList.add(car.Data(id: 0, typeCar: "Add Car Type"));
      });

      await managementPoolCar.getDriverList().then((value) => driverList.addAll(value.data?.toSet().toList() ?? []));
    } catch (e) {
      e.printError();
    }

    isLoading = false;
    update();
  }

  Future<void> fetchSiteList(int id) async {
    isLoadSite = true;
    siteList = [];

    try {
      await repository.getSiteListByCompanyID(companyID!).then((value) => siteList.addAll(value.data?.toSet().toList() ?? []));
    } catch (e) {
      e.printError();
    }

    isLoadSite = false;
    update();
  }

  Future<void> saveData() async {
    try {
      await managementPoolCar
          .save(
        nameCar.text,
        companyID.toString(),
        siteID.toString(),
        plate.text,
        carTypeID.toString(),
        driverID.toString(),
        odometer.text,
        selectedTransmision.text,
        selectedStatus.text,
        selectedType,
        selectedType == "1" ? "assets" : "kontrak",
        hullNumberController.text,
        selectedType == "1" ? assetNumberController.text : null,
        selectedType == "2" ? vendorNameController.text : null,
        startDate.value.toString(),
        endDate.value.toString(),
        vehicleRegistrationDate.value.toString(),
        plateExpiredDate.value.toString(),
        kirRegistrationDate.value.toString(),
        stickerExpiredDate.value.toString()
      )
          .then((value) {
        Get.off(const ManagementPoolCarListScreen());
        Get.showSnackbar(const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: "Save Success",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
        ));
      });
    } catch (e, i) {
      e.printError();
      i.printError();
      Get.showSnackbar(const GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Save Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> updateData() async {
    try {
      await managementPoolCar
          .update(
        carID!.toInt(),
        nameCar.text,
        (companyID ?? selectedCompany.text).toString(),
        (siteID ?? selectedSite.text).toString(),
        plate.text,
        (carTypeID ?? selectedCarType.text).toString(),
        (driverID ?? selectedDriver.text).toString(),
        odometer.text,
        selectedTransmision.text,
        selectedStatus.text,
      )
          .then((value) {
        Get.off(const ManagementPoolCarListScreen());
        Get.showSnackbar(const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: "Update Success",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
        ));
      });
    } catch (e, i) {
      e.printError();
      i.printError();
      Get.showSnackbar(const GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Update Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
  }
}
