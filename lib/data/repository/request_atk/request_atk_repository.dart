import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:gais/base/approval_base_repository.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/base/base_repository.dart';
import 'package:gais/data/model/api_response_model.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/approval_request_atk/approval_request_atk_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/model/request_atk/request_atk_detail_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:get/get.dart';

class RequestATKRepository
    implements BaseRepository<RequestAtkModel, RequestATKDetailModel>, ApprovalBaseRepository<ApprovalRequestATKModel> {
  final network = Get.find<NetworkCore>();

  @override
  Future<Either<BaseError, PaginationModel>> getPaginationData(
      {Map<String, dynamic>? data}) async {
    try {
      Dio.Response response =
          await network.dio.get('/api/request_atk/get/', queryParameters: data);
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
  Future<Either<BaseError, List<RequestAtkModel>>> getData(
      {Map<String, dynamic>? data}) async {
    try {
      Dio.Response response = await network.dio.get(
        '/api/request_atk/get/',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, PaginationModel.fromJsonModel);
      PaginationModel paginationModel = apiResponseModel.data;

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
  Future<Either<BaseError, RequestATKDetailModel>> addDetail(model) async {
    final requestATKDetailModel = model as RequestATKDetailModel;

    try {
      Dio.Response response = await network.dio.post(
          '/api/request_atk/store_detail',
          data: requestATKDetailModel.toJson());
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, RequestATKDetailModel.fromJsonModel);
      return right(apiResponseModel.data);
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
  Future<Either<BaseError, bool>> deleteData(int id) async {
    try {
      Dio.Response response = await network.dio.delete(
        '/api/request_atk/delete_data/$id',
      );
      if (response.data == "") {
        return right(true);
      }

      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, RequestAtkModel.fromJsonModel);
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
  Future<Either<BaseError, bool>> deleteDetail(int id) async {
    try {
      Dio.Response response = await network.dio.delete(
        '/api/request_atk/delete_data_detail/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, RequestAtkModel.fromJsonModel);
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
  Future<Either<BaseError, List<RequestATKDetailModel>>> getDataDetails(
      int id) async {
    try {
      Dio.Response response = await network.dio.get(
        '/api/request_atk/get_by_atk_request_id/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, RequestATKDetailModel.fromJsonModelList);
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
  Future<Either<BaseError, RequestAtkModel>> saveData(model) async {
    final requestAtkModel = model as RequestAtkModel;

    try {
      Dio.Response response = await network.dio
          .post('/api/request_atk/store', data: requestAtkModel.toJson());
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, RequestAtkModel.fromJsonModel);
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
  Future<Either<BaseError, RequestAtkModel>> updateData(model, int id) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, RequestATKDetailModel>> updateDetail(
      model, int id) async {
    final requestATKDetailModel = model as RequestATKDetailModel;

    try {
      Dio.Response response = await network.dio.post(
          '/api/request_atk/update_data_detail/$id',
          data: requestATKDetailModel.toJson());
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, RequestATKDetailModel.fromJsonModel);
      return right(apiResponseModel.data);
    } on DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    } on FormatException catch (e) {
      return left(BaseError(message: e.message));
    } catch (e) {
      print("Ess $e");
      return left(BaseError(message: "General error occurred"));
    }
  }

  @override
  Future<Either<BaseError, RequestAtkModel>> submitData(int id) async {
    try {
      Dio.Response response = await network.dio.post(
        '/api/request_atk/submit/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, RequestAtkModel.fromJsonModel);
      return right(apiResponseModel.data);
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
  Future<Either<BaseError, RequestAtkModel>> detailData(int id) async {
    try {
      Dio.Response response = await network.dio.get(
        '/api/request_atk/get/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, RequestAtkModel.fromJsonModelList);
      List<RequestAtkModel> list = apiResponseModel.data;
      return right(list.first);
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
  Future<Either<BaseError, List<ApprovalRequestATKModel>>> getDataApproval({Map<String, dynamic>? data}) {
    // TODO: implement getDataApproval
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, PaginationModel>> getPaginationDataApproval({Map<String, dynamic>? data}) async {
    //TODO : temporary, using approval non travel, should use approval request atk
    try {
      Dio.Response response = await network.dio.get(
          '/api/approval_request_atk/get_data',
          queryParameters: data
      );
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
  Future<Either<BaseError, bool>> reject(model, int id) async{
    try {
      final approvalModel = model as ApprovalModel;

      Dio.Response response = await network.dio.post(
          '/api/approval_non_travel/reject/$id',
          data: approvalModel.toJson()
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ApprovalRequestATKModel.fromJsonModel);
      return right(apiResponseModel.success ?? false);
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
  Future<Either<BaseError, bool>> approve(model, int id) async{
    try {
      final approvalModel = model as ApprovalModel;

      Dio.Response response = await network.dio.post(
          '/api/approval_non_travel/approve/$id',
          data: approvalModel.toJson()
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ApprovalRequestATKModel.fromJsonModel);
      return right(apiResponseModel.success ?? false);
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
  Future<Either<BaseError, List<ApprovalLogModel>>> getApprovalLog(int id) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/cash_advance/get_history_non_travel/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ApprovalLogModel.fromJsonModelList);
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
}
