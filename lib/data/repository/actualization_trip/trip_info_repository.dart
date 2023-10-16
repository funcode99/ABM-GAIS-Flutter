import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/data/model/actualization_trip/trip_info_model.dart';
import 'package:gais/data/model/api_response_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:get/get.dart';

class TripInfoRepository{
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


}