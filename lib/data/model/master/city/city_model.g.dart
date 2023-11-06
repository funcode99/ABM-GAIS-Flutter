// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      no: json['no'] as int?,
      id: json['id'] as int?,
      cityCode: json['city_code'] as String?,
      cityName: json['city_name'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      deletedAt: json['deleted_at'] as String?,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'no': instance.no,
      'id': instance.id,
      'city_code': instance.cityCode,
      'city_name': instance.cityName,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt,
    };
