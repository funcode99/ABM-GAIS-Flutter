// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantModel _$ParticipantModelFromJson(Map<String, dynamic> json) =>
    ParticipantModel(
      idEmployee: json['id_employee'] as int?,
      email: json['email'] as String?,
      employeeName: json['employee_name'] as String?,
    );

Map<String, dynamic> _$ParticipantModelToJson(ParticipantModel instance) =>
    <String, dynamic>{
      'id_employee': instance.idEmployee,
      'employee_name': instance.employeeName,
      'email': instance.email,
    };
