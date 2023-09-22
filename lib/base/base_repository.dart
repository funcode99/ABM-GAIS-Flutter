import 'package:dartz/dartz.dart';
import 'package:gais/base/base_error.dart';
import 'package:gais/data/model/pagination_model.dart';

abstract class BaseRepository<T, S>{

  Future<Either<BaseError, PaginationModel>> getPaginationData({Map<String, dynamic>? data});
  Future<Either<BaseError, List<T>>> getData({Map<String, dynamic>? data});
  Future<Either<BaseError, T>> saveData(dynamic model);
  Future<Either<BaseError, T>> updateData(dynamic model, dynamic id);
  Future<Either<BaseError, bool>> deleteData(dynamic id);
  Future<Either<BaseError, T>> submitData(dynamic id);
  Future<Either<BaseError, T>> detailData(dynamic id);

  Future<Either<BaseError, List<S>>> getDataDetails(dynamic id);
  Future<Either<BaseError, bool>> deleteDetail(dynamic id);
  Future<Either<BaseError, S>> addDetail(dynamic model);
  Future<Either<BaseError, S>> updateDetail(dynamic model, dynamic id);
}