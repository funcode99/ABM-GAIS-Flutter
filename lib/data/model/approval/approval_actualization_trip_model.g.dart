// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval_actualization_trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApprovalActualizationTripModel _$ApprovalActualizationTripModelFromJson(
        Map<String, dynamic> json) =>
    ApprovalActualizationTripModel(
      id: json['id'] as String?,
      codeDocument: json['code_document'] as String?,
      idDocument: json['id_document'] as String?,
      level: json['level'] as int?,
      idEmployee: json['id_employee'] as int?,
      idCompany: json['id_company'] as int?,
      idSite: json['id_site'] as int?,
      idMatrix: json['id_matrix'] as int?,
      idApprovalAuth: json['id_approval_auth'] as int?,
      approvedBy: json['approved_by'],
      approvedBehalf: json['approved_behalf'],
      rejectedBy: json['rejected_by'],
      isApproved: json['is_approved'],
      notes: json['notes'] as String?,
      codeStatusDoc: json['code_status_doc'] as int?,
      isRequestTrip: json['is_request_trip'],
      codeSequence: json['code_sequence'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      deletedAt: json['deleted_at'] as String?,
      currentLevel: json['current_level'] as int?,
      status: json['status'] as String?,
      employeeName: json['employee_name'] as String?,
      noAct: json['no_act'] as String?,
      idOrigin: json['id_origin'] as int?,
      isDelegation: json['is_delegation'] as int?,
      docCreatedAt: json['doc_created_at'] as String?,
      fileName: json['file_name'] as String?,
      path: json['path'] as String?,
      isReSubmit: json['is_re_submit'] as int?,
      levelReal: json['level_real'] as int?,
      purpose: json['purpose'] as String?,
      totalTlk: json['total_tlk'],
      idRequestTrip: json['id_request_trip'],
      daysOfTrip: json['days_of_trip'],
    );

Map<String, dynamic> _$ApprovalActualizationTripModelToJson(
        ApprovalActualizationTripModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code_document': instance.codeDocument,
      'id_document': instance.idDocument,
      'level': instance.level,
      'id_employee': instance.idEmployee,
      'id_company': instance.idCompany,
      'id_site': instance.idSite,
      'id_matrix': instance.idMatrix,
      'id_approval_auth': instance.idApprovalAuth,
      'approved_by': instance.approvedBy,
      'approved_behalf': instance.approvedBehalf,
      'rejected_by': instance.rejectedBy,
      'is_approved': instance.isApproved,
      'notes': instance.notes,
      'code_status_doc': instance.codeStatusDoc,
      'is_request_trip': instance.isRequestTrip,
      'code_sequence': instance.codeSequence,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt,
      'current_level': instance.currentLevel,
      'status': instance.status,
      'employee_name': instance.employeeName,
      'no_act': instance.noAct,
      'id_origin': instance.idOrigin,
      'is_delegation': instance.isDelegation,
      'doc_created_at': instance.docCreatedAt,
      'file_name': instance.fileName,
      'path': instance.path,
      'is_re_submit': instance.isReSubmit,
      'level_real': instance.levelReal,
      'purpose': instance.purpose,
      'total_tlk': instance.totalTlk,
      'id_request_trip': instance.idRequestTrip,
      'days_of_trip': instance.daysOfTrip,
    };
