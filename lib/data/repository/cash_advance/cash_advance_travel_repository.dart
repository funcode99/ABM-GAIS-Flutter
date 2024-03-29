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

class CashAdvanceTravelRepository implements BaseRepository<CashAdvanceModel, CashAdvanceDetailModel>, ApprovalBaseRepository<ApprovalCashAdvanceModel>{
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
  Future<Either<BaseError, List<CashAdvanceDetailModel>>> getDataDetails(dynamic id) async{
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

  @override
  Future<Either<BaseError, bool>> deleteDetail(dynamic id) {
    // TODO: implement deleteDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, CashAdvanceDetailModel>> addDetail(model) {
    // TODO: implement addDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> deleteData(dynamic id) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, CashAdvanceDetailModel>> updateDetail(model, dynamic id) {
    // TODO: implement updateDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, PaginationModel>> getPaginationData({Map<String, dynamic>? data}) async{
    try {
      Dio.Response response = await network.dio.get(
          '/api/cash_advance/travel',
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

  Future<Either<BaseError, CashAdvanceModel>> submitData(dynamic id) {
    // TODO: implement submitData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, CashAdvanceModel>> detailData(dynamic id) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/cash_advance/travel/$id',
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
        '/api/approval_cash_advance/get_data',
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
        '/api/approval_cash_advance/get_data',
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
  Future<Either<BaseError, bool>> reject(model, dynamic id) async{
    try {
      final approvalModel = model as ApprovalModel;

      Dio.Response response = await network.dio.post(
          '/api/approval_cash_advance/reject/$id',
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
  Future<Either<BaseError, bool>> approve(model, dynamic id) async{
    try {
      final approvalModel = model as ApprovalModel;

      final formData = Dio.FormData.fromMap(approvalModel.toJson());
      if(approvalModel.approvedBehalf != null){
        if(approvalModel.path!=null){
          formData.files.add(MapEntry("file", await Dio.MultipartFile.fromFile(approvalModel.path!)));
        }
      }

      Dio.Response response = await network.dio.post(
          '/api/approval_cash_advance/approve/$id',
          data: formData
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
  Future<Either<BaseError, List<ApprovalLogModel>>> getApprovalLog(dynamic id) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/request_trip/get_history_approval/$id',
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

  @override
  Future<Either<BaseError, PaginationModel>> getPaginationDataApprovalHistory({Map<String, dynamic>? data}) async{
    try {
      Dio.Response response = await network.dio.get(
          '/api/approval_cash_advance/history',
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

}