// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverModel _$DriverModelFromJson(Map<String, dynamic> json) => DriverModel(
      id: json['id'],
      username: json['username'] as String?,
      name: json['name'] as String?,
      idCompany: json['id_company'] as int?,
      idSite: json['id_site'] as int?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$DriverModelToJson(DriverModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'id_company': instance.idCompany,
      'id_site': instance.idSite,
      'email': instance.email,
    };
