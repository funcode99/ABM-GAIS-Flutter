import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/base/base_repository.dart';
import 'package:gais/data/model/api_response_model.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/pagination_model.dart';
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
  Future<Either<BaseError, bool>> deleteData(int id) async{
    try {
      Dio.Response response = await network.dio.delete(
        '/api/book_meeting_room/delete_data/$id',
      );
      if (response.data == "") {
        return right(true);
      }

      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(
          response.data, BookingMeetingRoomModel.fromJsonModel);
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
  Future<Either<BaseError, bool>> deleteDetail(int id) {
    // TODO: implement deleteDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, BookingMeetingRoomModel>> detailData(int id) async{
    try {
      Dio.Response response = await network.dio.get(
        '/api/book_meeting_room/get/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, BookingMeetingRoomModel.fromJsonModelList);
      List<BookingMeetingRoomModel> list = apiResponseModel.data;
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
  Future<Either<BaseError, BookingMeetingRoomModel>> saveData(model) async{
    final bookingMeetingRoomModel = model as BookingMeetingRoomModel;

    final formData = Dio.FormData.fromMap(bookingMeetingRoomModel.toJson());
    if(bookingMeetingRoomModel.attachmentPath!=null){
      formData.files.add(MapEntry("attachment", await Dio.MultipartFile.fromFile(bookingMeetingRoomModel.attachmentPath!)));
    }

    //from backend, use participant[] instead of participant, :)
    formData.fields.add(
      MapEntry("participant[]", bookingMeetingRoomModel.participant.toString())
    );

    formData.fields.add(
        MapEntry("facility[]", bookingMeetingRoomModel.facility.toString())
    );

    formData.fields.add(
        MapEntry("external[]", bookingMeetingRoomModel.external.toString())
    );

    print(formData.fields);

    try {
      Dio.Response response = await network.dio.post(
          '/api/book_meeting_room/store/',
          data: formData
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, BookingMeetingRoomModel.fromJsonModel);
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
  Future<Either<BaseError, BookingMeetingRoomModel>> submitData(int id) async{
    try {
      Dio.Response response = await network.dio.post(
        '/api/book_meeting_room/book/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, BookingMeetingRoomModel.fromJsonModel);
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
  Future<Either<BaseError, BookingMeetingRoomModel>> updateData(model, int id) async{
    final bookingMeetingRoomModel = model as BookingMeetingRoomModel;

    try {
      Dio.Response response = await network.dio.post(
          '/api/book_meeting_room/update_data/$id',
          data: bookingMeetingRoomModel.toJson()
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, BookingMeetingRoomModel.fromJsonModel);
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
  Future<Either<BaseError, bool>> updateDetail(model, int id) {
    // TODO: implement updateDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> cancelData(int id) async{
    try {
      Dio.Response response = await network.dio.post(
        '/api/book_meeting_room/cancel/$id',
      );
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(response.data, BookingMeetingRoomModel.fromJsonModel);
      return right(apiResponseModel.success ?? false);
    } on DioError catch (e) {
      return left(BaseError(message: e.response!.data['message'] ?? e.message));
    }on FormatException catch (e){
      return left(BaseError(message: e.message));
    } catch (e){
      print("E $e");
      return left(BaseError(message: "General error occurred"));
    }
  }

}
