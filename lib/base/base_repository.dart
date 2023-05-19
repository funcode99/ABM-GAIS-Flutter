import 'package:dartz/dartz.dart';
import 'package:gais/base/base_error.dart';

abstract class BaseRepository<T, S>{

  Future<Either<BaseError, List<T>>> getData({Map<String, dynamic>? data});
  Future<Either<BaseError, List<S>>> getDataDetails(int id);
  Future<Either<BaseError, T>> saveData(dynamic model);
  Future<Either<BaseError, T>> updateData(dynamic model, int id);
}