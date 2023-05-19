import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/base/base_repository.dart';
import 'package:gais/data/model/api_response_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:get/get.dart';

class CashAdvanceTravelRepository implements BaseRepository<CashAdvanceModel, CashAdvanceDetailModel>{
  final network = Get.find<NetworkCore>();

  @override
  Future<Either<BaseError, List<CashAdvanceModel>>> getData({Map<String, dynamic>? data}) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/cash_advance/travel/',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, CashAdvanceModel.fromJsonModelList);
      return right(apiResponseModel.data);
    } on DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    } on FormatException catch (e){
      return left(BaseError(message: e.message));
    }catch (e){
      return left(BaseError(message: "General error occurred"));
    }
  }

  @override
  Future<Either<BaseError, List<CashAdvanceDetailModel>>> getDataDetails(int id) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/cash_advance/get_by_cash_id/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, CashAdvanceDetailModel.fromJsonModelList);
      return right(apiResponseModel.data);
    } on DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    }on FormatException catch (e){
      return left(BaseError(message: e.message));
    } catch (e){
      return left(BaseError(message: "General error occurred"));
    }
  }

  @override
  Future<Either<BaseError, CashAdvanceModel>> saveData(data) {
    // TODO: implement saveData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, CashAdvanceModel>> updateData(data, id) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

}