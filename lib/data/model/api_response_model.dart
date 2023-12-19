import 'package:json_annotation/json_annotation.dart';

part 'api_response_model.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class ApiResponseModel<T> {
  bool? success;
  String? message;
  T? data;

  ApiResponseModel({required this.success, required this.message, this.data});

  factory ApiResponseModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseModelFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T) toJsonT) => _$ApiResponseModelToJson(this, toJsonT);

}