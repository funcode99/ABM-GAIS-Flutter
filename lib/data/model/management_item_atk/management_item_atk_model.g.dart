// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management_item_atk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagementItemATKModel _$ManagementItemATKModelFromJson(
        Map<String, dynamic> json) =>
    ManagementItemATKModel(
      id: json['id'] as int?,
      codeItem: json['code_item'] as String?,
      itemName: json['item_name'] as String?,
      idBrand: json['id_brand'] as int?,
      idUom: json['id_uom'] as int?,
      alertQty: json['alert_qty'] as int?,
      currentStock: json['current_stock'] as int?,
      idCompany: json['id_company'] as int?,
      idSite: json['id_site'] as int?,
      idWarehouse: json['id_warehouse'] as int?,
      remarks: json['remarks'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      brandName: json['brand_name'] as String?,
      uomName: json['uom_name'] as String?,
      companyName: json['company_name'] as String?,
      companyCode: json['company_code'] as String?,
      siteName: json['site_name'] as String?,
      siteCode: json['site_code'] as String?,
      warehouseName: json['warehouse_name'] as String?,
    );

Map<String, dynamic> _$ManagementItemATKModelToJson(
        ManagementItemATKModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code_item': instance.codeItem,
      'item_name': instance.itemName,
      'id_brand': instance.idBrand,
      'id_uom': instance.idUom,
      'alert_qty': instance.alertQty,
      'current_stock': instance.currentStock,
      'id_company': instance.idCompany,
      'id_site': instance.idSite,
      'id_warehouse': instance.idWarehouse,
      'remarks': instance.remarks,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'brand_name': instance.brandName,
      'uom_name': instance.uomName,
      'company_name': instance.companyName,
      'company_code': instance.companyCode,
      'site_name': instance.siteName,
      'site_code': instance.siteCode,
      'warehouse_name': instance.warehouseName,
    };
