// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CostCenterModel _$CostCenterModelFromJson(Map<String, dynamic> json) =>
    CostCenterModel(
      id: json['id'] as int?,
      costCenterName: json['cost_center_name'] as String?,
    );

Map<String, dynamic> _$CostCenterModelToJson(CostCenterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cost_center_name': instance.costCenterName,
    };
