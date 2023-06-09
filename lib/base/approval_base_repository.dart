import 'package:dartz/dartz.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/data/model/pagination_model.dart';

abstract class ApprovalBaseRepository<T>{

  Future<Either<BaseError, PaginationModel>> getPaginationDataApproval({Map<String, dynamic>? data});
  Future<Either<BaseError, List<T>>> getDataApproval({Map<String, dynamic>? data});

  Future<Either<BaseError, T>> reject(dynamic model, int id);
}