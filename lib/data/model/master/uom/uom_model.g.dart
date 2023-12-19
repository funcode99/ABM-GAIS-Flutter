// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UomModel _$UomModelFromJson(Map<String, dynamic> json) => UomModel(
      id: json['id'] as int?,
      uomName: json['uom_name'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as String?,
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'] as String?,
    );

Map<String, dynamic> _$UomModelToJson(UomModel instance) => <String, dynamic>{
      'id': instance.id,
      'uom_name': instance.uomName,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
    };
