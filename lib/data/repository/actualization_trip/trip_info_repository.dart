import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/base/base_repository.dart';
import 'package:gais/data/model/actualization_trip/trip_info_model.dart';
import 'package:gais/data/model/api_response_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:get/get.dart';

class TripInfoRepository implements BaseRepository<TripInfoModel, bool>{
  final network = Get.find<NetworkCore>();

  Future<Either<BaseError, List<TripInfoModel>>> getTripInfoByActualizationId(dynamic id) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/actual_trip/get_trip_by_id/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, TripInfoModel.fromJsonModelList);
      return right(apiResponseModel.data);
    } on DioError catch (e) {
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
  Future<Either<BaseError, bool>> addDetail(model) {
    // TODO: implement addDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> deleteData(id) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> deleteDetail(id) {
    // TODO: implement deleteDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, TripInfoModel>> detailData(id) {
    // TODO: implement detailData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<TripInfoModel>>> getData({Map<String, dynamic>? data}) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<bool>>> getDataDetails(id) {
    // TODO: implement getDataDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, PaginationModel>> getPaginationData({Map<String, dynamic>? data}) {
    // TODO: implement getPaginationData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, TripInfoModel>> saveData(model) {
    // TODO: implement saveData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, TripInfoModel>> submitData(id) {
    // TODO: implement submitData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, TripInfoModel>> updateData(model, id) async{
    final tripInfoModel = model as TripInfoModel;

    try {
      Dio.Response response = await network.dio
          .post('/api/actual_trip/update_trip_info/$id',
          data: tripInfoModel.toJson());
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, TripInfoModel.fromJsonModel);
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
  Future<Either<BaseError, bool>> updateDetail(model, id) {
    // TODO: implement updateDetail
    throw UnimplementedError();
  }


}