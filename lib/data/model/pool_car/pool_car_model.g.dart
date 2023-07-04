// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pool_car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoolCarModel _$PoolCarModelFromJson(Map<String, dynamic> json) => PoolCarModel(
      id: json['id'] as int?,
      idCar: json['id_car'] as int?,
      idEmployee: json['id_employee'] as int?,
      idDrivers: json['id_drivers'] as int?,
      idRequestTrip: json['id_request_trip'] as int?,
      fromDate: json['from_date'] as String?,
      toDate: json['to_date'] as String?,
      noPoolCar: json['no_pool_car'] as String?,
      codeStatusDoc: json['code_status_doc'] as int?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      requestorName: json['requestor_name'] as String?,
      noRequestTrip: json['no_request_trip'] as String?,
      plate: json['plate'] as String?,
      status: json['status'] as String?,
      driverName: json['driver_name'] as String?,
    );

Map<String, dynamic> _$PoolCarModelToJson(PoolCarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_car': instance.idCar,
      'id_employee': instance.idEmployee,
      'id_drivers': instance.idDrivers,
      'id_request_trip': instance.idRequestTrip,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
      'no_pool_car': instance.noPoolCar,
      'code_status_doc': instance.codeStatusDoc,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'requestor_name': instance.requestorName,
      'no_request_trip': instance.noRequestTrip,
      'plate': instance.plate,
      'status': instance.status,
      'driver_name': instance.driverName,
    };
