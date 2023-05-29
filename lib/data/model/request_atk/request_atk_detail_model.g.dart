// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_atk_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestATKDetailModel _$RequestATKDetailModelFromJson(
        Map<String, dynamic> json) =>
    RequestATKDetailModel(
      key: json['key'] as String?,
      id: json['id'] as int?,
      idWarehouse: json['id_warehouse'] as int?,
      idAtkRequest: json['id_atk_request'] as int?,
      idItem: json['id_item'] as int?,
      qty: json['qty'] as int?,
      remarks: json['remarks'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'] as String?,
      itemName: json['item_name'] as String?,
      codeItem: json['code_item'] as String?,
      brandName: json['brand_name'] as String?,
      uomName: json['uom_name'] as String?,
      warehouseName: json['warehouse_name'] as String?,
    );

Map<String, dynamic> _$RequestATKDetailModelToJson(
        RequestATKDetailModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'id': instance.id,
      'id_atk_request': instance.idAtkRequest,
      'id_item': instance.idItem,
      'id_warehouse': instance.idWarehouse,
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
