// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval_request_atk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApprovalRequestATKModel _$ApprovalRequestATKModelFromJson(
        Map<String, dynamic> json) =>
    ApprovalRequestATKModel(
      no: json['no'] as int?,
      id: json['id'] as int?,
      idCompany: json['id_company'] as int?,
      idSite: json['id_site'] as int?,
      idEmployee: json['id_employee'] as int?,
      noAtkRequest: json['no_atk_request'] as String?,
      remarks: json['remarks'] as String?,
      codeStatusDoc: json['code_status_doc'] as int?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      deletedAt: json['deleted_at'] as String?,
      employeeName: json['employee_name'] as String?,
      companyName: json['company_name'] as String?,
      companyCode: json['company_code'] as String?,
      siteName: json['site_name'] as String?,
      siteCode: json['site_code'] as String?,
      status: json['status'] as String?,
      itemCount: json['item_count'] as int?,
    );

Map<String, dynamic> _$ApprovalRequestATKModelToJson(
        ApprovalRequestATKModel instance) =>
    <String, dynamic>{
      'no': instance.no,
      'id': instance.id,
      'id_company': instance.idCompany,
      'id_site': instance.idSite,
      'id_employee': instance.idEmployee,
      'no_atk_request': instance.noAtkRequest,
      'remarks': instance.remarks,
      'code_status_doc': instance.codeStatusDoc,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt,
      'employee_name': instance.employeeName,
      'company_name': instance.companyName,
      'company_code': instance.companyCode,
      'site_name': instance.siteName,
      'site_code': instance.siteCode,
      'status': instance.status,
      'item_count': instance.itemCount,
    };
