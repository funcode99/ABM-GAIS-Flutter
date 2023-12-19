// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_stock_management_item_atk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailStockManagementItemATKModel _$DetailStockManagementItemATKModelFromJson(
        Map<String, dynamic> json) =>
    DetailStockManagementItemATKModel(
      no: json['no'],
      id: json['id'],
      idWarehouse: json['id_warehouse'],
      warehouseName: json['warehouse_name'] as String?,
      currentStock: json['current_stock'],
      bookedStockWh: json['booked_stock_wh'],
      stockToApproveWh: json['stock_to_approve_wh'],
    );

Map<String, dynamic> _$DetailStockManagementItemATKModelToJson(
        DetailStockManagementItemATKModel instance) =>
    <String, dynamic>{
      'no': instance.no,
      'id': instance.id,
      'id_warehouse': instance.idWarehouse,
      'warehouse_name': instance.warehouseName,
      'current_stock': instance.currentStock,
      'booked_stock_wh': instance.bookedStockWh,
      'stock_to_approve_wh': instance.stockToApproveWh,
    };
