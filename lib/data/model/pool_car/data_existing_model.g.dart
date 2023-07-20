// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_existing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataExistingModel _$DataExistingModelFromJson(Map<String, dynamic> json) =>
    DataExistingModel(
      odometer: json['odometer'],
      isUsable: json['is_usable'] as int?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$DataExistingModelToJson(DataExistingModel instance) =>
    <String, dynamic>{
      'is_usable': instance.isUsable,
      'odometer': instance.odometer,
      'notes': instance.notes,
    };
