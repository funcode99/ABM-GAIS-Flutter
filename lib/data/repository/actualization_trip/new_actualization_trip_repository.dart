import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:gais/base/approval_base_repository.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/base/base_repository.dart';
import 'package:gais/data/model/actualization_trip/actualization_trip_model.dart';
import 'package:gais/data/model/actualization_trip/trip_info_model.dart';
import 'package:gais/data/model/api_response_model.dart';
import 'package:gais/data/model/approval/approval_actualization_trip_model.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/model/request_trip/request_trip_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class NewActualizationTripRepository implements BaseRepository<ActualizationTripModel, bool>, ApprovalBaseRepository<ApprovalActualizationTripModel>{
  final network = Get.find<NetworkCore>();

  @override
  Future<Either<BaseError, List<ActualizationTripModel>>> getData({Map<String, dynamic>? data}) async{
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<bool>>> getDataDetails(dynamic id) async{
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, ActualizationTripModel>> saveData(data) async{
    final actualizationTrip = data as ActualizationTripModel;

    final formData = Dio.FormData.fromMap(actualizationTrip.toJson());

    /*if(actualizationTrip.idRequestTrip != null && actualizationTrip.idRequestTrip.toString().isNotEmpty){
      List<String> ids = List<String>.from(actualizationTrip.idRequestTrip);
      for(String item in ids){
        formData.fields.add(
            MapEntry("id_request_trip[]", item)
        );
      }
    }

    print(formData.fields);*/

    try {
      Dio.Response response = await network.dio.post(
          '/api/actual_trip/store',
          data: actualizationTrip.toJson()
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ActualizationTripModel.fromJsonModel);
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
  Future<Either<BaseError, ActualizationTripModel>> updateData(model, id) async{
    final actTripModel = model as ActualizationTripModel;

    Map<String, dynamic> data = {
      "purpose": actTripModel.purpose,
      "notes": actTripModel.notes,
      "total_tlk": actTripModel.totalTlk,
    };

    try {
      Dio.Response response = await network.dio
          .post('/api/actual_trip/update_data/$id',
          data: data);
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, ActualizationTripModel.fromJsonModel);
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
  Future<Either<BaseError, bool>> deleteDetail(dynamic id) {
    // TODO: implement deleteDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> addDetail(model) {
    // TODO: implement addDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> deleteData(dynamic id) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> updateDetail(model, dynamic id) {
    // TODO: implement updateDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, PaginationModel>> getPaginationData({Map<String, dynamic>? data}) async{
    try {
      Dio.Response response = await network.dio.get(
          '/api/actual_trip/get_data',
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
  Future<Either<BaseError, ActualizationTripModel>> submitData(dynamic id) async{
    try {
      Dio.Response response = await network.dio.post(
        '/api/actual_trip/submit/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ActualizationTripModel.fromJsonModel);
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
  Future<Either<BaseError, ActualizationTripModel>> detailData(dynamic id) async{
    try {
      Dio.Response response = await network.dio.get(
          '/api/actual_trip/get_data/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ActualizationTripModel.fromJsonModel);
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
  Future<Either<BaseError, List<ApprovalActualizationTripModel>>> getDataApproval({Map<String, dynamic>? data}) async{
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, PaginationModel>> getPaginationDataApproval({Map<String, dynamic>? data}) async{
    try {
      Dio.Response response = await network.dio.get(
          '/api/approval_actual/get_data',
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
          '/api/approval_actual/reject/$id',
          data: approvalModel.toJson()
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ApprovalActualizationTripModel.fromJsonModel);
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
          '/api/approval_actual/approve/$id',
          data: formData
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, ApprovalActualizationTripModel.fromJsonModel);
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
        '/api/actual_trip/get_history/$id',
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
          '/api/approval_actual/history',
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

  Future<Either<BaseError, List<RequestTripModel>>> getRequestTrip() async{
    try {
      Dio.Response response = await network.dio.get(
          '/api/actual_trip/get_request_trip',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, RequestTripModel.fromJsonModelList);
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

  Future<Either<BaseError, List<TripInfoModel>>> getTripInfo({List<dynamic>? ids}) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/actual_trip/get_data_trip',
        queryParameters: {
          "id_request_trip[]" : ids
        }
      );

      if(response.statusCode == 400){
        return right([]);
      }

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

  Future<Either<BaseError, int>> getTLKRate(dynamic data) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/zona_job/get_tlk_rate',
        queryParameters: data
      );

      Map<String, dynamic> resp = Map<String, dynamic>.from(response.data);
      if(!resp.containsKey("data")){
        return right(0);
      }

      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, TripInfoModel.fromJsonModel);
      TripInfoModel tripInfoModel = apiResponseModel.data;
      int tlkRate = tripInfoModel.tlkRate.toString().toInt();
      return right(tlkRate);

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