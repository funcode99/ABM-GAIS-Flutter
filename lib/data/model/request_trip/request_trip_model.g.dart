// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTripModel _$RequestTripModelFromJson(Map<String, dynamic> json) =>
    RequestTripModel(
      id: json['id'],
      noRequestTrip: json['no_request_trip'] as String?,
      createdAt: json['created_at'] as String?,
      code: json['code'] as int?,
      status: json['status'] as String?,
      codeDocument: json['code_document'] as String?,
      documentName: json['document_name'] as String?,
    );

Map<String, dynamic> _$RequestTripModelToJson(RequestTripModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no_request_trip': instance.noRequestTrip,
      'created_at': instance.createdAt,
      'code': instance.code,
      'status': instance.status,
      'code_document': instance.codeDocument,
      'document_name': instance.documentName,
    };
