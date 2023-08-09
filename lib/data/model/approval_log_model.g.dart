// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApprovalLogModel _$ApprovalLogModelFromJson(Map<String, dynamic> json) =>
    ApprovalLogModel(
      codeStatus: json['code_status'] as int?,
      level: json['level'] as int?,
      text: json['text'] as String?,
      date: json['date'] as String?,
      path: json['path'],
      file: json['file'],
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$ApprovalLogModelToJson(ApprovalLogModel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'code_status': instance.codeStatus,
      'text': instance.text,
      'date': instance.date,
      'notes': instance.notes,
      'path': instance.path,
      'file': instance.file,
    };
