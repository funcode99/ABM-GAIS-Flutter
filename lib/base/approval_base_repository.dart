import 'package:dartz/dartz.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/data/model/pagination_model.dart';

abstract class ApprovalBaseRepository<T>{

  Future<Either<BaseError, PaginationModel>> getPaginationDataApproval({Map<String, dynamic>? data});
  Future<Either<BaseError, List<T>>> getDataApproval({Map<String, dynamic>? data});

  Future<Either<BaseError, bool>> reject(dynamic model, int id);
  Future<Either<BaseError, bool>> approve(dynamic model, int id);

  Future<Either<BaseError, List<ApprovalLogModel>>> getApprovalLog(String id);

}