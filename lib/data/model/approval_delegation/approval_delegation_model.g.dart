// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval_delegation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApprovalDelegationModel _$ApprovalDelegationModelFromJson(
        Map<String, dynamic> json) =>
    ApprovalDelegationModel(
      no: json['no'] as int?,
      id: json['id'] as int?,
      idEmployee: json['id_employee'],
      idEmployeeTo: json['id_employee_to'],
      delegator: json['delegator'] as String?,
      delegateTo: json['delegate_to'] as String?,
      notes: json['notes'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      deletedAt: json['deleted_at'] as String?,
    );

Map<String, dynamic> _$ApprovalDelegationModelToJson(
        ApprovalDelegationModel instance) =>
    <String, dynamic>{
      'no': instance.no,
      'id': instance.id,
      'id_employee_to': instance.idEmployeeTo,
      'id_employee': instance.idEmployee,
      'delegator': instance.delegator,
      'delegate_to': instance.delegateTo,
      'notes': instance.notes,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt,
    };
