import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/pool_car/management_poolcar/get_car_type_model.dart' as car;
import 'package:gais/data/model/pool_car/management_poolcar/get_driver_model.dart' as driver;
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:gais/data/storage_core.dart';
import 'package:gais/screen/tms/pool_car/management_poolcar/list/management_poolcar_list_screen.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
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

  final companyTextEditingController = TextEditingController();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat dateFormatForSubmit = DateFormat("yyyy-MM-dd");

  bool isAdministrator = false;
  bool isSuperAdmin = false;
  bool isAdmin = false;
  bool isLoading = false;
  bool isLoadSite = false;
  bool isEdit = false;
  bool enableSelectCompany = false;

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

  DateTime? startDate;
  DateTime? endDate;

  DateTime? vehicleRegistrationDate;
  DateTime? plateExpiredDate;
  DateTime? kirRegistrationDate;
  DateTime? stickerExpiredDate;

  @override
  void onInit() {
    super.onInit();
    fetchList();

    if(Get.arguments != null){
      carID = Get.arguments['id'];
      isEdit = Get.arguments['isEdit'];
    }
    if (isEdit == true) fetchEdit();

    initData();
  }

  void initData()async{
    String codeRole = await storage.readString(StorageCore.codeRole);

    if(codeRole == RoleEnum.administrator.value){
      enableSelectCompany = true;
    }

    if(!enableSelectCompany){
      String idCompany = await storage.readString(StorageCore.companyID);
      String companyName = await storage.readString(StorageCore.companyName);

      companyID = idCompany;
      companyTextEditingController.text = companyName;

      fetchSiteList(companyID!.toInt());
    }

    update();

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

        selectedType = value.data?.first.type.toString() ?? "1";
        assetNumberController.text = value.data?.first.typeName ?? "";
        vendorNameController.text = value.data?.first.typeName ?? "";
        hullNumberController.text = value.data?.first.hullNo.toString() ?? "";


        startDateController.text = value.data?.first.startDate?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy") ?? "-";
        endDateController.text = value.data?.first.endDate?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy") ?? "-";
        vehicleRegistrationDateController.text = value.data?.first.registrationDate?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy") ?? "-";
        plateExpiredDateController.text = value.data?.first.plateDate?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy") ?? "-";
        kirRegistrationDateController.text = value.data?.first.kirDate?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy") ?? "-";
        stickerExpiredDateController.text = value.data?.first.stickersDate?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy") ?? "-";

        startDate = value.data?.first.startDate?.toDate(originFormat: "yyyy-MM-dd HH:mm:ss");
        endDate = value.data?.first.endDate?.toDate(originFormat: "yyyy-MM-dd HH:mm:ss");
        vehicleRegistrationDate = value.data?.first.registrationDate?.toDate(originFormat: "yyyy-MM-dd HH:mm:ss");
        plateExpiredDate = value.data?.first.plateDate?.toDate(originFormat: "yyyy-MM-dd HH:mm:ss");
        kirRegistrationDate = value.data?.first.kirDate?.toDate(originFormat: "yyyy-MM-dd HH:mm:ss");
        stickerExpiredDate = value.data?.first.stickersDate?.toDate(originFormat: "yyyy-MM-dd HH:mm:ss");

        fetchSiteList(selectedCompany.text.toInt());

        update();
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

      if(isEdit){
        await repository.getSiteList().then((value) => siteList.addAll(value.data?.toSet().toList() ?? []));
      }

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
      isLoadingHitApi(true);
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
        selectedType == "1" ? assetNumberController.text  : vendorNameController.text,
        hullNumberController.text,
        selectedType == "1" ? assetNumberController.text : null,
        selectedType == "2" ? vendorNameController.text : null,
        startDate != null ? dateFormatForSubmit.format(startDate!) : null,
        endDate != null ? dateFormatForSubmit.format(endDate!) : null,
        vehicleRegistrationDate != null ? dateFormatForSubmit.format(vehicleRegistrationDate!) : null,
        plateExpiredDate != null ? dateFormatForSubmit.format(plateExpiredDate!) : null,
        kirRegistrationDate != null ? dateFormatForSubmit.format(kirRegistrationDate!) : null,
        stickerExpiredDate != null ? dateFormatForSubmit.format(stickerExpiredDate!) : null,
    )
          .then((value) {
        isLoadingHitApi(false);
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
      isLoadingHitApi(false);
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
      isLoadingHitApi(true);
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


        selectedType,
        selectedType == "1" ? assetNumberController.text : vendorNameController.text,
        hullNumberController.text,
        selectedType == "1" ? assetNumberController.text : null,
        selectedType == "2" ? vendorNameController.text : null,
        startDate != null ? dateFormatForSubmit.format(startDate!) : null,
        endDate != null ? dateFormatForSubmit.format(endDate!) : null,
        vehicleRegistrationDate != null ? dateFormatForSubmit.format(vehicleRegistrationDate!) : null,
        plateExpiredDate != null ? dateFormatForSubmit.format(plateExpiredDate!) : null,
        kirRegistrationDate != null ? dateFormatForSubmit.format(kirRegistrationDate!) : null,
        stickerExpiredDate != null ? dateFormatForSubmit.format(stickerExpiredDate!) : null,
      )
          .then((value) {
        isLoadingHitApi(false);
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
      isLoadingHitApi(false);
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
