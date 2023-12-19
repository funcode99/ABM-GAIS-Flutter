// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_doc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusDocModel _$StatusDocModelFromJson(Map<String, dynamic> json) =>
    StatusDocModel(
      code: json['code'],
      status: json['status'] as String?,
    );

Map<String, dynamic> _$StatusDocModelToJson(StatusDocModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
    };
