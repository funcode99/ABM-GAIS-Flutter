import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/base/base_repository.dart';
import 'package:gais/data/model/api_response_model.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:get/get.dart';

class ManagementItemATKRepository implements BaseRepository<ManagementItemATKModel, bool>{
  final network = Get.find<NetworkCore>();

  @override
  Future<Either<BaseError, PaginationModel>> getPaginationData({Map<String, dynamic>? data}) async{
    try {
      Dio.Response response = await network.dio.get(
          '/api/management_atk/get/',
          queryParameters: data
      );
      Map<String, dynamic> result = Map<String, dynamic>.from(response.data);
      dynamic resultData = result['data'];
      if(resultData is List){
        List<dynamic> list = List<dynamic>.from(result['data']);

        if(list.isEmpty){
          PaginationModel paginationModel = PaginationModel.fromJson(PaginationModel.fallbackData);
          return right(paginationModel);
        }
      }
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, PaginationModel.fromJsonModel);
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
  Future<Either<BaseError, List<ManagementItemATKModel>>> getData({Map<String, dynamic>? data}) async{
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> addDetail(model) {
    // TODO: implement addDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> deleteData(dynamic id) async{
    try {
      Dio.Response response = await network.dio.delete(
        '/api/management_atk/delete_data/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ManagementItemATKModel.fromJsonModel);
      return right(apiResponseModel.success!);
    } on DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    }on FormatException catch (e){
      return left(BaseError(message: e.message));
    } catch (e){
      print("E $e");
      return left(BaseError(message: "General error occurred"));
    }
  }

  @override
  Future<Either<BaseError, bool>> deleteDetail(dynamic id) {
    // TODO: implement deleteDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<bool>>> getDataDetails(dynamic id) {
    // TODO: implement getDataDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, ManagementItemATKModel>> saveData(model) async{
    final managementItemModel = model as ManagementItemATKModel;
    
    final data = {
      "array_atk" : [
        managementItemModel.toJson()
      ]
    };

    try {
      Dio.Response response = await network.dio.post(
          '/api/management_atk/store',
          data: jsonEncode(data)
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ManagementItemATKModel.fromJsonModel);
      return right(apiResponseModel.data);
    } on DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    }on FormatException catch (e){
      return left(BaseError(message: e.message));
    } catch (e){
      print("E $e");
      return left(BaseError(message: "General error occurred"));
    }
  }

  @override
  Future<Either<BaseError, ManagementItemATKModel>> updateData(model, dynamic id) async{
    final managementItemATKModel = model as ManagementItemATKModel;

    try {
      Dio.Response response = await network.dio.post(
          '/api/management_atk/update/$id',
          data: managementItemATKModel.toJson()
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ManagementItemATKModel.fromJsonModel);
      return right(apiResponseModel.data);
    } on DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    }on FormatException catch (e){
      return left(BaseError(message: e.message));
    } catch (e){
      print("E $e");
      return left(BaseError(message: "General error occurred"));
    }
  }

  @override
  Future<Either<BaseError, bool>> updateDetail(model, dynamic id) {
    // TODO: implement updateDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, ManagementItemATKModel>> submitData(dynamic id) {
    // TODO: implement submitData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, ManagementItemATKModel>> detailData(dynamic id) {
    // TODO: implement detailData
    throw UnimplementedError();
  }



}