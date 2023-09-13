import 'package:dartz/dartz.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/data/model/api_response_model.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/dashboard/dashboard_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

class DashboardMeetingRoomRepository {
  final network = Get.find<NetworkCore>();

  Future<Either<BaseError, List<BookingMeetingRoomModel>>> getData({Map<String, dynamic>? data}) async{
    try {
      Dio.Response response = await network.dio.get(
          '/api/book_meeting_room/dashboard/',
          queryParameters: data
      );

      if(response.data["data"] == null){
        return right([]);
      }

      ApiResponseModel apiResponse = ApiResponseModel.fromJson(response.data, BookingMeetingRoomModel.fromJsonModelList);
      return right(apiResponse.data);

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

}