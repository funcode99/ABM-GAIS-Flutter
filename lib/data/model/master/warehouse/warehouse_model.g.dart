// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseModel _$WarehouseModelFromJson(Map<String, dynamic> json) =>
    WarehouseModel(
      id: json['id'],
      warehouseName: json['warehouse_name'] as String?,
      idCompany: json['id_company'] as int?,
      idSite: json['id_site'] as int?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as String?,
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'] as String?,
      companyName: json['company_name'] as String?,
      companyCode: json['company_code'] as String?,
      siteName: json['site_name'] as String?,
      siteCode: json['site_code'] as String?,
    );

Map<String, dynamic> _$WarehouseModelToJson(WarehouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'warehouse_name': instance.warehouseName,
      'id_company': instance.idCompany,
      'id_site': instance.idSite,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'company_name': instance.companyName,
      'company_code': instance.companyCode,
      'site_name': instance.siteName,
      'site_code': instance.siteCode,
    };
