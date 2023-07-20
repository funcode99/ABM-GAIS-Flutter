import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:gais/base/base_error.dart';
import 'package:gais/base/base_repository.dart';
import 'package:gais/data/model/api_response_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/model/pool_car/get_check_model.dart';
import 'package:gais/data/model/pool_car/pool_car_model.dart';
import 'package:gais/data/model/pool_car/submit_check_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:get/get.dart';

class PoolCarRepository implements BaseRepository<PoolCarModel, bool>{
  final network = Get.find<NetworkCore>();

  @override
  Future<Either<BaseError, bool>> addDetail(model) {
    // TODO: implement addDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> deleteData(int id) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> deleteDetail(int id) {
    // TODO: implement deleteDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, PoolCarModel>> detailData(dynamic id) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/pool_car/get_data/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, PoolCarModel.fromJsonModelList);
      List<PoolCarModel> list = apiResponseModel.data;
      return right(list.first);
    } on Dio.DioError catch (e) {
      print("DioError $e");
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    } on FormatException catch (e){
      print("FormatException $e");
      return left(BaseError(message: e.message));
    }catch (e){
      print("catch error $e");
      return left(BaseError(message: "General error occurred"));
    }
  }

  @override
  Future<Either<BaseError, List<PoolCarModel>>> getData({Map<String, dynamic>? data}) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<bool>>> getDataDetails(int id) {
    // TODO: implement getDataDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, PaginationModel>> getPaginationData({Map<String, dynamic>? data}) async{
    try {
      Dio.Response response = await network.dio.get(
          '/api/pool_car/get_data',
          queryParameters: data
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, PaginationModel.fromJsonModel);
      return right(apiResponseModel.data);
    } on Dio.DioError catch (e) {
      print("DioError $e");
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    } on FormatException catch (e){
      print("FormatException $e");
      return left(BaseError(message: e.message));
    }catch (e){
      print("catch error $e");
      return left(BaseError(message: "General error occurred"));
    }
  }

  @override
  Future<Either<BaseError, PoolCarModel>> saveData(model) {
    // TODO: implement saveData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, PoolCarModel>> submitData(dynamic id) async{
    try {
      Dio.Response response = await network.dio.post(
        '/api/pool_car/update_status/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, PoolCarModel.fromJsonModel);
      return right(apiResponseModel.data);
    } on Dio.DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    }on FormatException catch (e){
      return left(BaseError(message: e.message));
    } catch (e){
      print("E $e");
      return left(BaseError(message: "General error occurred"));
    }
  }

  @override
  Future<Either<BaseError, PoolCarModel>> updateData(model, int id) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> updateDetail(model, int id) {
    // TODO: implement updateDetail
    throw UnimplementedError();
  }

  Future<Either<BaseError, bool>> submitCheck(model) async{
    final submitCheckModel = model as SubmitCheckModel;

    try {
      Dio.Response response = await network.dio
          .post('/api/pool_car/store_check', data: submitCheckModel.toJson());
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, SubmitCheckModel.fromJsonModel);
      return right(apiResponseModel.success ?? false);
    } on Dio.DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    } on FormatException catch (e) {
      return left(BaseError(message: e.message));
    } catch (e) {
      print("Error $e");
      return left(BaseError(message: "General error occurred"));
    }
  }

  Future<Either<BaseError, GetCheckModel>> getCheckData(dynamic id) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/pool_car/get_check/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, GetCheckModel.fromJsonModel);
      return right(apiResponseModel.data);
    } on Dio.DioError catch (e) {
      print(e);

      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    } on FormatException catch (e){
      print(e);
      return left(BaseError(message: e.message));
    }catch (e){
      print(e);

      return left(BaseError(message: "General error occurred"));
    }
  }

}