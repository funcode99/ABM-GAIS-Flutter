// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApprovalModel _$ApprovalModelFromJson(Map<String, dynamic> json) =>
    ApprovalModel(
      approvedBehalf: json['approved_behalf'] as int?,
      notes: json['notes'] as String?,
      notesRejected: json['notes_rejected'] as String?,
      isRevision: json['is_revision'] as bool?,
      arrayDetail: json['array_detail'] as List<dynamic>?,
      path: json['path'] as String?,
      warehouseDetail: json['warehouse_detail'] as List<dynamic>?,
    );

Map<String, dynamic> _$ApprovalModelToJson(ApprovalModel instance) =>
    <String, dynamic>{
      'approved_behalf': instance.approvedBehalf,
      'notes': instance.notes,
      'notes_rejected': instance.notesRejected,
      'is_revision': instance.isRevision,
      'array_detail': instance.arrayDetail,
      'warehouse_detail': instance.warehouseDetail,
      'path': instance.path,
    };
