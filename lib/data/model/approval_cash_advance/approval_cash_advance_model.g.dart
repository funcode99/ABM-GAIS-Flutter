// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval_cash_advance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApprovalCashAdvanceModel _$ApprovalCashAdvanceModelFromJson(
        Map<String, dynamic> json) =>
    ApprovalCashAdvanceModel(
      id: json['id'] as int?,
      codeDocument: json['code_document'] as String?,
      idDocument: json['id_document'] as int?,
      level: json['level'] as int?,
      idEmployee: json['id_employee'] as int?,
      idCompany: json['id_company'] as int?,
      idSite: json['id_site'] as int?,
      idMatrix: json['id_matrix'] as int?,
      idApprovalAuth: json['id_approval_auth'] as int?,
      approvedBy: json['approved_by'],
      approvedBehalf: json['approved_behalf'],
      rejectedBy: json['rejected_by'],
      isApproved: json['is_approved'] as String?,
      notes: json['notes'] as String?,
      codeStatusDoc: json['code_status_doc'] as int?,
      isRequestTrip: json['is_request_trip'] as String?,
      codeSequence: json['code_sequence'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as String?,
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'] as String?,
      deletedAt: json['deleted_at'] as String?,
      currentLevel: json['current_level'] as int?,
      noCa: json['no_ca'] as String?,
      idCa: json['id_ca'] as int?,
      codeStatusCa: json['code_status_ca'] as int?,
      grandTotal: json['grand_total'] as String?,
      event: json['event'] as String?,
      status: json['status'] as String?,
      idCurrency: json['id_currency'] as int?,
      currencyName: json['currency_name'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      currencyCode: json['currency_code'] as String?,
    );

Map<String, dynamic> _$ApprovalCashAdvanceModelToJson(
        ApprovalCashAdvanceModel instance) =>
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
      'no_ca': instance.noCa,
      'id_ca': instance.idCa,
      'code_status_ca': instance.codeStatusCa,
      'id_currency': instance.idCurrency,
      'grand_total': instance.grandTotal,
      'event': instance.event,
      'status': instance.status,
      'currency_name': instance.currencyName,
      'currency_symbol': instance.currencySymbol,
      'currency_code': instance.currencyCode,
    };
