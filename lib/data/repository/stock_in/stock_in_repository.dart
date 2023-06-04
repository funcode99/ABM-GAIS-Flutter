import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/base/base_repository.dart';
import 'package:gais/data/model/api_response_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_detail_model.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:get/get.dart';

class StockInATKRepository
    implements BaseRepository<StockInATKModel, StockInATKDetailModel> {
  final network = Get.find<NetworkCore>();

  @override
  Future<Either<BaseError, PaginationModel>> getPaginationData(
      {Map<String, dynamic>? data}) async {
    try {
      Dio.Response response =
          await network.dio.get('/api/stock_in/get/', queryParameters: data);
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, PaginationModel.fromJsonModel);
      return right(apiResponseModel.data);
    } on DioError catch (e) {
      print("DioError $e");
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    } on FormatException catch (e) {
      print("FormatException $e");
      return left(BaseError(message: e.message));
    } catch (e) {
      print("catch error $e");
      return left(BaseError(message: "General error occurred"));
    }
  }

  @override
  Future<Either<BaseError, StockInATKDetailModel>> addDetail(model) {
    // TODO: implement addDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> deleteData(int id) async {
    try {
      Dio.Response response = await network.dio.delete(
        '/api/stock_in/delete_data/$id',
      );
      if (response.data == "") {
        return right(true);
      }

      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, StockInATKModel.fromJsonModel);
      return right(apiResponseModel.success!);
    } on DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    } on FormatException catch (e) {
      return left(BaseError(message: e.message));
    } catch (e) {
      print("E $e");
      return left(BaseError(message: "General error occurred"));
    }
  }

  @override
  Future<Either<BaseError, bool>> deleteDetail(int id) {
    // TODO: implement deleteDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, StockInATKModel>> detailData(int id) {
    // TODO: implement detailData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<StockInATKModel>>> getData(
      {Map<String, dynamic>? data}) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<StockInATKDetailModel>>> getDataDetails(
      int id) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/stock_in/get_by_stock_in_id/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, StockInATKDetailModel.fromJsonModelList);
      return right(apiResponseModel.data);
    } on DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    } on FormatException catch (e) {
      return left(BaseError(message: e.message));
    } catch (e) {
      return left(BaseError(message: "General error occurred"));
    }
  }

  @override
  Future<Either<BaseError, StockInATKModel>> saveData(model) async{
    final stockInModel = model as StockInATKModel;

    try {
      Dio.Response response = await network.dio
          .post('/api/stock_in/store', data: stockInModel.toJson());
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, StockInATKModel.fromJsonModel);
      return right(apiResponseModel.data);
    } on DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    } on FormatException catch (e) {
      return left(BaseError(message: e.message));
    } catch (e) {
      print("Error $e");
      return left(BaseError(message: "General error occurred"));
    }
  }

  @override
  Future<Either<BaseError, StockInATKModel>> submitData(int id) {
    // TODO: implement submitData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, StockInATKModel>> updateData(model, int id) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, StockInATKDetailModel>> updateDetail(model, int id) {
    // TODO: implement updateDetail
    throw UnimplementedError();
  }
}
