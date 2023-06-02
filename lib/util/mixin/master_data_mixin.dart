import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:gais/data/model/master/brand/brand_model.dart';
import 'package:gais/data/model/master/cost_center/cost_center_model.dart';
import 'package:gais/data/model/master/currency/currency_model.dart';
import 'package:gais/data/model/master/status_doc/status_doc_model.dart';
import 'package:gais/data/model/master/uom/uom_model.dart';
import 'package:gais/data/model/warehouse_model.dart';
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
    final list = <CostCenterModel>[];
    for(int i = 1; i <= 10; i++) {
      list.add(CostCenterModel(costCenterName: "Cost Center Name ${i}", id: i));
    }

    return list;
  }

  Future<List<ManagementItemATKModel>> getListItemByWarehouseId(int warehouseId)async{
    final result = await _repository.getListItemByWarehouseId(warehouseId);
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

}