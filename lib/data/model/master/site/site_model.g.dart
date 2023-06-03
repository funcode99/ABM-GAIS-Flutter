// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteModel _$SiteModelFromJson(Map<String, dynamic> json) => SiteModel(
      no: json['no'] as int?,
      id: json['id'] as int?,
      siteName: json['site_name'] as String?,
      siteCode: json['site_code'] as String?,
      idCompany: json['id_company'] as int?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      companyName: json['company_name'] as String?,
      companyCode: json['company_code'] as String?,
    );

Map<String, dynamic> _$SiteModelToJson(SiteModel instance) => <String, dynamic>{
      'no': instance.no,
      'id': instance.id,
      'site_name': instance.siteName,
      'site_code': instance.siteCode,
      'id_company': instance.idCompany,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'company_name': instance.companyName,
      'company_code': instance.companyCode,
    };
