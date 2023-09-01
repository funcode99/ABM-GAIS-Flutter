import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:gais/data/model/master/brand/brand_model.dart';
import 'package:gais/data/model/master/car/car_model.dart';
import 'package:gais/data/model/master/check_item/check_item_model.dart';
import 'package:gais/data/model/master/company/company_model.dart';
import 'package:gais/data/model/master/cost_center/cost_center_model.dart';
import 'package:gais/data/model/master/currency/currency_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/master/facility/facility_model.dart';
import 'package:gais/data/model/master/meeting_room/meeting_room_model.dart';
import 'package:gais/data/model/master/room/room_model.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/model/master/status_doc/status_doc_model.dart';
import 'package:gais/data/model/master/uom/uom_model.dart';
import 'package:gais/data/model/master/warehouse/warehouse_model.dart';
import 'package:gais/data/repository/master/master_repository.dart';
import 'package:get/get.dart';

mixin MasterDataMixin{

  final MasterRepository _repository = Get.find();

  Future<List<WarehouseModel>> getListWarehouseByCompanyId(int idCompany)async{
    final result = await _repository.getListWarehouseByCompanyId(idCompany);
    return result.fold((l) => [], (listWarehouse) => listWarehouse);
  }

  Future<List<WarehouseModel>> getListWarehouseBySiteId(int idSite)async{
    final result = await _repository.getListWarehouseBySiteId(idSite);
    return result.fold((l) => [], (listWarehouse) => listWarehouse);
  }

  Future<List<BrandModel>> getListBrandByCompanyId(int idCompany)async{
    final result = await _repository.getListBrandByCompanyId(idCompany);
    return result.fold((l) => [], (listBrand) => listBrand);
  }

  Future<List<UomModel>> getListUOM()async{
    final result = await _repository.getListUom();
    return result.fold((l) => [], (listUom) => listUom);
  }

  Future<List<CostCenterModel>> getListCostCenter() async{
    final result = await _repository.getListCostCenter();
    return result.fold((l) => [], (list) => list);
  }

  Future<List<ManagementItemATKModel>> getListItemByWarehouseId(int warehouseId)async{
    final result = await _repository.getListItemByWarehouseId(warehouseId);
    return result.fold((l) => [], (listManagementItem) => listManagementItem);
  }

  Future<List<ManagementItemATKModel>> getListItemBySiteId(dynamic siteId)async{
    final result = await _repository.getListItemBySiteId(siteId);
    return result.fold((l) => [], (listManagementItem) => listManagementItem);
  }

  Future<List<ManagementItemATKModel>> getListItem({dynamic companyId, dynamic siteId})async{
    final result = await _repository.getListItem(companyId: companyId, siteID: siteId);
    return result.fold((l) => [], (listManagementItem) => listManagementItem);
  }

  Future<List<StatusDocModel>> getListStatusDoc()async{
    final result = await _repository.getListStatusDoc();
    return result.fold((l) => [], (list) => list);
  }

  Future<List<CurrencyModel>> getListCurrency()async{
    final result = await _repository.getListCurrency();
    return result.fold((l) => [], (list) => list);
  }

  Future<List<CompanyModel>> getListCompany()async{
    final result = await _repository.getListCompany();
    return result.fold((l) => [], (list) => list);
  }

  Future<List<SiteModel>> getListSite()async{
    final result = await _repository.getListSite();
    return result.fold((l) => [], (list) => list);
  }

  Future<List<SiteModel>> getListSiteByCompanyId(int idCompany)async{
    final result = await _repository.getListSiteByCompanyId(idCompany);
    return result.fold((l) => [], (list) => list);
  }

  Future<List<RoomModel>> getListMeetingRoomBySiteId(int idSite)async{
    final result = await _repository.getListMeetingRoomBySiteId(idSite);
    return result.fold((l) => [], (list) => list);
  }

  Future<List<WarehouseModel>> getListWarehouse()async{
    final result = await _repository.getListWarehouse();
    return result.fold((l) => [], (list) => list);
  }

  Future<List<EmployeeModel>> getApproveBehalf({int? idEmployee, int? idCompany, int? idSite, int? idApprovalAuth})async{
    final result = await _repository.getApproveBehalf(idCompany: idCompany, idEmployee: idEmployee, idSite: idSite, idApprovalAuth: idApprovalAuth);
    return result.fold((l) => [], (list) => list);
  }

  Future<List<MeetingRoomModel>> getListMeetingRoom()async{
    final result = await _repository.getListMeetingRoom();
    return result.fold((l) => [], (list) => list);
  }

  Future<List<String>> getFacilityByRoomId(dynamic id)async{
    final result = await _repository.getFacilityByRoomId(id);
    return result.fold((l) => [], (list) => list);
  }

  Future<List<CheckItemModel>> getListCheckItem(int id)async{
    final result = await _repository.getListCheckItem(id);
    return result.fold((l) => [], (list) => list);
  }

  Future<List<RoomModel>> getListRoomBySite(int idSite)async{
    final result = await _repository.getListRoomBySite(idSite);
    return result.fold((l) => [], (list) => list);
  }

  Future<List<EmployeeModel>> getListEmployee()async{
    final result = await _repository.getListEmployee();
    return result.fold((l) => [], (list) => list);
  }

  Future<List<EmployeeModel>> getListDelegateTo(int id)async{
    final result = await _repository.getListDelegateTo(id);
    return result.fold((l) => [], (list) => list);
  }

  Future<List<EmployeeModel>> getListEmployeeByKeyword(String keyword)async{
    final result = await _repository.getListEmployeeByKeyword(keyword);
    return result.fold((l) => [], (list) => list);
  }

  Future<List<CarModel>> getListCar({String? keyword, int? idSite})async{
    final result = await _repository.getListCar(keyword: keyword, idSite: idSite);
    return result.fold((l) => [], (list) => list);
  }

  Future<List<FacilityModel>> getListFacility()async{
    final result = await _repository.getListFacility();
    return result.fold((l) => [], (list) => list);
  }

}