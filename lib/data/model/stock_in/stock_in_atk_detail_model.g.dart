// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_in_atk_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockInATKDetailModel _$StockInATKDetailModelFromJson(
        Map<String, dynamic> json) =>
    StockInATKDetailModel(
      key: json['key'] as String?,
      id: json['id'],
      idStockIn: json['id_stock_in'],
      idWarehouse: json['id_warehouse'] as int?,
      idItem: json['id_item'] as int?,
      idBrand: json['id_brand'] as int?,
      idUom: json['id_uom'] as int?,
      qty: json['qty'] as int?,
      remarks: json['remarks'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      itemName: json['item_name'] as String?,
      codeItem: json['code_item'] as String?,
      brandName: json['brand_name'] as String?,
      uomName: json['uom_name'] as String?,
      warehouseName: json['warehouse_name'] as String?,
    );

Map<String, dynamic> _$StockInATKDetailModelToJson(
        StockInATKDetailModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'id': instance.id,
      'id_stock_in': instance.idStockIn,
      'id_warehouse': instance.idWarehouse,
      'id_item': instance.idItem,
      'id_brand': instance.idBrand,
      'id_uom': instance.idUom,
      'qty': instance.qty,
      'remarks': instance.remarks,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'item_name': instance.itemName,
      'code_item': instance.codeItem,
      'brand_name': instance.brandName,
      'uom_name': instance.uomName,
      'warehouse_name': instance.warehouseName,
    };
