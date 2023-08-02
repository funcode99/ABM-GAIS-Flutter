import 'package:gais/data/model/pool_car/management_poolcar/get_car_byid_model.dart';
import 'package:gais/data/model/pool_car/management_poolcar/get_car_list_model.dart';
import 'package:gais/data/model/pool_car/management_poolcar/get_car_type_model.dart';
import 'package:gais/data/model/pool_car/management_poolcar/get_driver_model.dart';
import 'package:gais/data/model/pool_car/management_poolcar/save_car_model.dart';
import 'package:gais/data/model/pool_car/management_poolcar/update_car_model.dart';

abstract class ManagementPoolCarRepository {
  Future<GetCarTypeModel> getCarTypeList();

  Future<GetDriverModel> getDriverList();

  Future<GetCarListModel> getList(
    int perPage,
    int page,
    String? search,
    int? companyID,
    int? siteID,
  );

  Future<GetCarByidModel> getByID(int id);

  Future<SaveCarModel> save(
    String carName,
    String companyID,
    String siteID,
    String plate,
    String carTypeID,
    String driverID,
    String odometer,
    String transmisi,
    String status,
    String type,
    String typeName,
    String? hullNumber,
    String? assetNo,
    String? vendorName,
    String? startDate,
    String? endDate,
    String? registrationDate,
    String? plateDate,
    String? kirDate,
    String? stickerDate
  );

  Future<UpdateCarModel> update(
    int id,
    String carName,
    String companyID,
    String siteID,
    String plate,
    String carTypeID,
    String driverID,
    String odometer,
    String transmisi,
    String status,
    String type,
    String typeName,
    String? hullNumber,
    String? assetNo,
    String? vendorName,
    String? startDate,
    String? endDate,
    String? registrationDate,
    String? plateDate,
    String? kirDate,
    String? stickerDate
  );

  Future delete(int id);
}
