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
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/model/request_atk/request_atk_detail_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:get/get.dart';

class BookingMeetingRoomRepository
    implements BaseRepository<BookingMeetingRoomModel, bool> {
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
  Future<Either<BaseError, BookingMeetingRoomModel>> detailData(int id) {
    // TODO: implement detailData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<BookingMeetingRoomModel>>> getData({Map<String, dynamic>? data}) {
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
          '/api/book_meeting_room/get/',
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
  Future<Either<BaseError, BookingMeetingRoomModel>> saveData(model) {
    // TODO: implement saveData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, BookingMeetingRoomModel>> submitData(int id) {
    // TODO: implement submitData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, BookingMeetingRoomModel>> updateData(model, int id) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> updateDetail(model, int id) {
    // TODO: implement updateDetail
    throw UnimplementedError();
  }

}
