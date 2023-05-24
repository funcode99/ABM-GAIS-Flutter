import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:gais/base/base_error.dart';
import 'package:gais/data/model/api_response_model.dart';
import 'package:gais/data/model/master/brand/brand_model.dart';
import 'package:gais/data/model/master/uom/uom_model.dart';
import 'package:gais/data/model/warehouse_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:get/get.dart';

class MasterRepository{
  final network = Get.find<NetworkCore>();

  Future<Either<BaseError, List<WarehouseModel>>> getListWarehouseByCompanyId(int idCompany)async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/warehouse/get_by_company_id/$idCompany',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, WarehouseModel.fromJsonModelList);
      return right(apiResponseModel.data);
    } on Dio.DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    } on FormatException catch (e){
      return left(BaseError(message: e.message));
    }catch (e){
      return left(BaseError(message: "General error occurred"));
    }
  }

  Future<Either<BaseError, List<BrandModel>>> getListBrandByCompanyId(int idCompany)async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/brand/',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, BrandModel.fromJsonModelList);
      return right(apiResponseModel.data);
    } on Dio.DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    } on FormatException catch (e){
      return left(BaseError(message: e.message));
    }catch (e){
      return left(BaseError(message: "General error occurred"));
    }
  }

  Future<Either<BaseError, List<UomModel>>> getListUom()async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/uom/',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, UomModel.fromJsonModelList);
      return right(apiResponseModel.data);
    } on Dio.DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    } on FormatException catch (e){
      return left(BaseError(message: e.message));
    }catch (e){
      return left(BaseError(message: "General error occurred"));
    }
  }

}