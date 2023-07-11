import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/base/base_repository.dart';
import 'package:gais/data/model/api_response_model.dart';
import 'package:gais/data/model/approval_delegation/approval_delegation_model.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/network_core.dart';
import 'package:get/get.dart';

class ApprovalDelegationRepository
    implements BaseRepository<ApprovalDelegationModel, bool> {
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
  Future<Either<BaseError, ApprovalDelegationModel>> detailData(int id) {
    // TODO: implement detailData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<ApprovalDelegationModel>>> getData({Map<String, dynamic>? data}) {
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
    List<Map<String, dynamic>> data = [
      {
        "no" : 1,
        "delegator" : "John Doe",
        "delegate_to" : "Optimus Prime",
        "created_at" : "2022-12-01",
        "active_from" : "2023-01-01",
        "active_to" : "2024-01-01",
      }
    ];

    return right(
      PaginationModel(
        data: data,
        currentPage: 1,
        total: data.length
      )
    );
  }

  @override
  Future<Either<BaseError, ApprovalDelegationModel>> saveData(model) {
    // TODO: implement saveData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, ApprovalDelegationModel>> submitData(int id) {
    // TODO: implement submitData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, ApprovalDelegationModel>> updateData(model, int id) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, bool>> updateDetail(model, int id) {
    // TODO: implement updateDetail
    throw UnimplementedError();
  }

  

}
