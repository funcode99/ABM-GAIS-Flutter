// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_in_atk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockInATKModel _$StockInATKModelFromJson(Map<String, dynamic> json) =>
    StockInATKModel(
      id: json['id'],
      idCompany: json['id_company'] as int?,
      idDepartement: json['id_departement'] as int?,
      idSite: json['id_site'] as int?,
      idWarehouse: json['id_warehouse'] as int?,
      idEmployee: json['id_employee'] as int?,
      noStockIn: json['no_stock_in'] as String?,
      remarks: json['remarks'] as String?,
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
              (e) => StockInATKDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StockInATKModelToJson(StockInATKModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_company': instance.idCompany,
      'id_departement': instance.idDepartement,
      'id_site': instance.idSite,
      'id_warehouse': instance.idWarehouse,
      'id_employee': instance.idEmployee,
      'no_stock_in': instance.noStockIn,
      'remarks': instance.remarks,
      'code_status_doc': instance.codeStatusDoc,
      'status': instance.status,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'employee_name': instance.employeeName,
      'warehouse_name': instance.warehouseName,
      'departement_name': instance.departementName,
      'company_name': instance.companyName,
      'company_code': instance.companyCode,
      'site_name': instance.siteName,
      'site_code': instance.siteCode,
      'item_count': instance.itemCount,
      'array_detail': instance.arrayDetail?.map((e) => e.toJson()).toList(),
    };
