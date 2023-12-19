// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_atk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestAtkModel _$RequestAtkModelFromJson(Map<String, dynamic> json) =>
    RequestAtkModel(
      id: json['id'],
      idCompany: json['id_company'] as int?,
      idDepartement: json['id_departement'] as int?,
      idSite: json['id_site'] as int?,
      idWarehouse: json['id_warehouse'] as int?,
      idEmployee: json['id_employee'] as int?,
      noAtkRequest: json['no_atk_request'] as String?,
      remarks: json['remarks'] as String?,
      notes: json['notes'] as String?,
      notesDelivered: json['notes_delivered'] as String?,
      notesRejected: json['notes_rejected'] as String?,
      codeStatusDoc: json['code_status_doc'],
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      employeeName: json['employee_name'] as String?,
      warehouseName: json['warehouse_name'] as String?,
      departementName: json['departement_name'] as String?,
      companyName: json['company_name'] as String?,
      companyCode: json['company_code'] as String?,
      siteName: json['site_name'] as String?,
      siteCode: json['site_code'] as String?,
      itemCount: json['item_count'] as int?,
      arrayDetail: (json['array_detail'] as List<dynamic>?)
          ?.map(
              (e) => RequestATKDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      approvedAt: json['approved_at'] as String?,
      nameApproved: json['name_approved'] as String?,
      nameDelivered: json['name_delivered'] as String?,
      nameRejected: json['name_rejected'] as String?,
      deliveredAt: json['delivered_at'] as String?,
      approvedBy: json['approved_by'],
      rejectedBy: json['rejected_by'],
      deliveredBy: json['delivered_by'],
      rejectedAt: json['rejected_at'] as String?,
    );

Map<String, dynamic> _$RequestAtkModelToJson(RequestAtkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_company': instance.idCompany,
      'id_departement': instance.idDepartement,
      'id_site': instance.idSite,
      'id_warehouse': instance.idWarehouse,
      'id_employee': instance.idEmployee,
      'no_atk_request': instance.noAtkRequest,
      'remarks': instance.remarks,
      'notes': instance.notes,
      'notes_delivered': instance.notesDelivered,
      'notes_rejected': instance.notesRejected,
      'code_status_doc': instance.codeStatusDoc,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'approved_by': instance.approvedBy,
      'rejected_by': instance.rejectedBy,
      'delivered_by': instance.deliveredBy,
      'employee_name': instance.employeeName,
      'warehouse_name': instance.warehouseName,
      'departement_name': instance.departementName,
      'company_name': instance.companyName,
      'company_code': instance.companyCode,
      'site_name': instance.siteName,
      'site_code': instance.siteCode,
      'item_count': instance.itemCount,
      'array_detail': instance.arrayDetail?.map((e) => e.toJson()).toList(),
      'approved_at': instance.approvedAt,
      'delivered_at': instance.deliveredAt,
      'rejected_at': instance.rejectedAt,
      'name_approved': instance.nameApproved,
      'name_delivered': instance.nameDelivered,
      'name_rejected': instance.nameRejected,
    };
