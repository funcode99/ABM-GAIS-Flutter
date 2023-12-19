// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityModel _$FacilityModelFromJson(Map<String, dynamic> json) =>
    FacilityModel(
      id: json['id'],
      facilityName: json['facility_name'] as String?,
    );

Map<String, dynamic> _$FacilityModelToJson(FacilityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'facility_name': instance.facilityName,
    };
