// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApprovalModel _$ApprovalModelFromJson(Map<String, dynamic> json) =>
    ApprovalModel(
      approvedBehalf: json['approved_behalf'] as int?,
      notes: json['notes'] as String?,
      isRevision: json['is_revision'] as bool?,
    );

Map<String, dynamic> _$ApprovalModelToJson(ApprovalModel instance) =>
    <String, dynamic>{
      'approved_behalf': instance.approvedBehalf,
      'notes': instance.notes,
      'is_revision': instance.isRevision,
    };
