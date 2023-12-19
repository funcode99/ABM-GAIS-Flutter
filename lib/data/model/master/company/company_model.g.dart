// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
      no: json['no'] as int?,
      id: json['id'],
      companyCode: json['company_code'] as String?,
      companyName: json['company_name'] as String?,
      shortName: json['short_name'] as String?,
      groupCompany: json['group_company'] as String?,
      codeErp: json['code_erp'] as String?,
      logo: json['logo'] as String?,
      logoPath: json['logo_path'],
      idVendor: json['id_vendor'] as int?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      vendor: json['vendor'] as String?,
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'no': instance.no,
      'id': instance.id,
      'company_code': instance.companyCode,
      'company_name': instance.companyName,
      'short_name': instance.shortName,
      'group_company': instance.groupCompany,
      'code_erp': instance.codeErp,
      'logo': instance.logo,
      'logo_path': instance.logoPath,
      'id_vendor': instance.idVendor,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'vendor': instance.vendor,
    };
