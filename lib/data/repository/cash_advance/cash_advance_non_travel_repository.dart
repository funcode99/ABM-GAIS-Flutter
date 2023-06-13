import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:gais/base/approval_base_repository.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/base/base_repository.dart';
import 'package:gais/data/model/api_response_model.dart';
import 'package:gais/data/model/approval_cash_advance/approval_cash_advance_model.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:get/get.dart';

class CashAdvanceNonTravelRepository implements BaseRepository<CashAdvanceModel, CashAdvanceDetailModel>, ApprovalBaseRepository<ApprovalCashAdvanceModel>{
  final network = Get.find<NetworkCore>();

  @override
  Future<Either<BaseError, List<CashAdvanceModel>>> getData({Map<String, dynamic>? data}) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/cash_advance/non_travel/',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, CashAdvanceModel.fromJsonModelList);
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
  Future<Either<BaseError, CashAdvanceModel>> saveData(model) async{
    final cashAdvanceModel = model as CashAdvanceModel;

    try {
      Dio.Response response = await network.dio.post(
        '/api/cash_advance/store',
        data: cashAdvanceModel.toJson()
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, CashAdvanceModel.fromJsonModel);
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
  Future<Either<BaseError, CashAdvanceModel>> updateData(model, id) async{
    final cashAdvanceModel = model as CashAdvanceModel;

    try {
      Dio.Response response = await network.dio.post(
          '/api/cash_advance/update_data/$id',
          data: cashAdvanceModel.toJson()
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, CashAdvanceModel.fromJsonModel);
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
  Future<Either<BaseError, bool>> deleteDetail(int id) async{
    try {
      Dio.Response response = await network.dio.delete(
          '/api/cash_advance/delete_data_detail/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, CashAdvanceModel.fromJsonModel);
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
  Future<Either<BaseError, CashAdvanceDetailModel>> addDetail(model) async{
    final cashAdvanceDetailModel = model as CashAdvanceDetailModel;

    try {
      Dio.Response response = await network.dio.post(
          '/api/cash_advance/store_detail',
          data: cashAdvanceDetailModel.toJson()
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, CashAdvanceDetailModel.fromJsonModel);
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
  Future<Either<BaseError, bool>> deleteData(int id) async{
    try {
      Dio.Response response = await network.dio.delete(
        '/api/cash_advance/delete_data/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, CashAdvanceModel.fromJsonModel);
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
  Future<Either<BaseError, CashAdvanceDetailModel>> updateDetail(model, int id) async{
    final cashAdvanceDetailModel = model as CashAdvanceDetailModel;

    try {
      Dio.Response response = await network.dio.post(
          '/api/cash_advance/update_data_detail/$id',
          data: cashAdvanceDetailModel.toJson()
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, CashAdvanceDetailModel.fromJsonModel);
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
  Future<Either<BaseError, PaginationModel>> getPaginationData({Map<String, dynamic>? data}) async{
    try {
      Dio.Response response = await network.dio.get(
          '/api/cash_advance/non_travel/',
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
  Future<Either<BaseError, CashAdvanceModel>> submitData(int id) async{
    try {
      Dio.Response response = await network.dio.post(
          '/api/cash_advance/submit/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, CashAdvanceModel.fromJsonModel);
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
  Future<Either<BaseError, CashAdvanceModel>> detailData(int id) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/cash_advance/non_travel/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, CashAdvanceModel.fromJsonModelList);
      List<CashAdvanceModel> list = apiResponseModel.data;
      return right(list.first);
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
  Future<Either<BaseError, List<ApprovalCashAdvanceModel>>> getDataApproval({Map<String, dynamic>? data}) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/approval_non_travel/get_data',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ApprovalCashAdvanceModel.fromJsonModelList);
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
  Future<Either<BaseError, PaginationModel>> getPaginationDataApproval({Map<String, dynamic>? data}) async{
    try {
      Dio.Response response = await network.dio.get(
          '/api/approval_non_travel/get_data',
          queryParameters: data
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ApprovalCashAdvanceModel.fromJsonModelList);
      PaginationModel paginationModel = PaginationModel();
      paginationModel.data = apiResponseModel.data;
      paginationModel.perPage = "1000";
      paginationModel.currentPage = 1;
      paginationModel.total = 1;
      // ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, PaginationModel.fromJsonModel);
      return right(paginationModel);
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
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ApprovalCashAdvanceModel.fromJsonModel);
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
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ApprovalCashAdvanceModel.fromJsonModel);
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