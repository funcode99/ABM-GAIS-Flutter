// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_advance_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashAdvanceDetailModel _$CashAdvanceDetailModelFromJson(
        Map<String, dynamic> json) =>
    CashAdvanceDetailModel(
      id: json['id'] as String?,
      key: json['key'] as String?,
      idCa: json['id_ca'] as String?,
      idItemCa: json['id_item_ca'] as int?,
      frequency: json['frequency'] as int?,
      nominal: json['nominal'] as String?,
      itemName: json['item_name'] as String?,
      namaItem: json['nama_item'] as String?,
      remarks: json['remarks'] as String?,
      idCostCenter: json['id_cost_center'] as int?,
      costCenterName: json['cost_center_name'] as String?,
      costCenterCode: json['cost_center_code'] as String?,
      total: json['total'] as String?,
    );

Map<String, dynamic> _$CashAdvanceDetailModelToJson(
        CashAdvanceDetailModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'id': instance.id,
      'id_ca': instance.idCa,
      'id_item_ca': instance.idItemCa,
      'id_cost_center': instance.idCostCenter,
      'frequency': instance.frequency,
      'nominal': instance.nominal,
      'total': instance.total,
      'item_name': instance.itemName,
      'nama_item': instance.namaItem,
      'remarks': instance.remarks,
      'cost_center_name': instance.costCenterName,
      'cost_center_code': instance.costCenterCode,
    };
