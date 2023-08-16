// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseDetailModel _$WarehouseDetailModelFromJson(
        Map<String, dynamic> json) =>
    WarehouseDetailModel(
      idWarehouse: json['id_warehouse'],
      warehouseName: json['warehouse_name'] as String?,
      stockAvailable: json['stock_available'],
      idItem: json['id_item'],
      idAtkRequestDetail: json['id_atk_request_detail'],
      qtyApproved: json['qty_approved'],
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$WarehouseDetailModelToJson(
        WarehouseDetailModel instance) =>
    <String, dynamic>{
      'id_warehouse': instance.idWarehouse,
      'warehouse_name': instance.warehouseName,
      'stock_available': instance.stockAvailable,
      'id_item': instance.idItem,
      'id_atk_request_detail': instance.idAtkRequestDetail,
      'qty_approved': instance.qtyApproved,
      'remarks': instance.remarks,
    };
