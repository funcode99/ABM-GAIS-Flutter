// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CostCenterModel _$CostCenterModelFromJson(Map<String, dynamic> json) =>
    CostCenterModel(
      id: json['id'] as int?,
      costCenterName: json['cost_center_name'] as String?,
      no: json['no'] as int?,
      costCenterCode: json['cost_center_code'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
    );

Map<String, dynamic> _$CostCenterModelToJson(CostCenterModel instance) =>
    <String, dynamic>{
      'no': instance.no,
      'id': instance.id,
      'cost_center_code': instance.costCenterCode,
      'cost_center_name': instance.costCenterName,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
    };
