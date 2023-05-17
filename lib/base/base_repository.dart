import 'package:dartz/dartz.dart';
import 'package:gais/base/base_error.dart';

abstract class BaseRepository<T, S>{

  Future<Either<BaseError, List<T>>> getData({Map<String, dynamic>? data});

}