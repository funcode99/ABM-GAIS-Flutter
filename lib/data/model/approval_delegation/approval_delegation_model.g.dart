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
      delegator: json['delegator'] as String?,
      delegateTo: json['delegate_to'] as String?,
      remarks: json['remarks'] as String?,
      activeFrom: json['active_from'] as String?,
      activeTo: json['active_to'] as String?,
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
      'delegator': instance.delegator,
      'delegate_to': instance.delegateTo,
      'remarks': instance.remarks,
      'active_from': instance.activeFrom,
      'active_to': instance.activeTo,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt,
    };
