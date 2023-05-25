import 'package:gais/data/model/master/brand/brand_model.dart';
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

  Future<List<BrandModel>> getListBrandByCompanyId(int idCompany)async{
    final result = await _repository.getListBrandByCompanyId(idCompany);
    return result.fold((l) => [], (listBrand) => listBrand);
  }

  Future<List<UomModel>> getListUOM()async{
    final result = await _repository.getListUom();
    return result.fold((l) => [], (listUom) => listUom);
  }

}