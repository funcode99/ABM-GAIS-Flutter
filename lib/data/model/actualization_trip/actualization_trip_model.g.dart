// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actualization_trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActualizationTripModel _$ActualizationTripModelFromJson(
        Map<String, dynamic> json) =>
    ActualizationTripModel(
      no: json['no'] as int?,
      id: json['id'],
      noAct: json['no_act'] as String?,
      idRequestTrip: json['id_request_trip'],
      totalTlk: json['total_tlk'] as int?,
      purpose: json['purpose'] as String?,
      notes: json['notes'] as String?,
      codeStatusDoc: json['code_status_doc'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      deletedAt: json['deleted_at'] as String?,
      idCompany: json['id_company'] as int?,
      idSite: json['id_site'] as int?,
      idCostCenter: json['id_cost_center'] as int?,
      idDepartement: json['id_departement'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      currentLevel: json['current_level'] as int?,
      idEmployee: json['id_employee'],
      employeeName: json['employee_name'] as String?,
      creator: json['creator'] as String?,
      noRequestTrip: json['no_request_trip'] as List<dynamic>?,
      status: json['status'] as String?,
      daysOfTrip: json['days_of_trip'] as String?,
      arrayActivities: json['array_activities'],
      arrayTrip: json['array_trip'],
    );

Map<String, dynamic> _$ActualizationTripModelToJson(
        ActualizationTripModel instance) =>
    <String, dynamic>{
      'no': instance.no,
      'id': instance.id,
      'no_act': instance.noAct,
      'id_request_trip': instance.idRequestTrip,
      'total_tlk': instance.totalTlk,
      'purpose': instance.purpose,
      'notes': instance.notes,
      'code_status_doc': instance.codeStatusDoc,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt,
      'id_company': instance.idCompany,
      'id_site': instance.idSite,
      'id_cost_center': instance.idCostCenter,
      'id_departement': instance.idDepartement,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'current_level': instance.currentLevel,
      'id_employee': instance.idEmployee,
      'employee_name': instance.employeeName,
      'creator': instance.creator,
      'no_request_trip': instance.noRequestTrip,
      'status': instance.status,
      'days_of_trip': instance.daysOfTrip,
      'array_trip': instance.arrayTrip,
      'array_activities': instance.arrayActivities,
    };
