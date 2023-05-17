// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_advance_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashAdvanceDetailModel _$CashAdvanceDetailModelFromJson(
        Map<String, dynamic> json) =>
    CashAdvanceDetailModel(
      id: json['id'] as int?,
      idCa: json['id_ca'] as int?,
      idItemCa: json['id_item_ca'] as int?,
      frequency: json['frequency'] as int?,
      nominal: json['nominal'] as String?,
      total: json['total'] as String?,
    );

Map<String, dynamic> _$CashAdvanceDetailModelToJson(
        CashAdvanceDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_ca': instance.idCa,
      'id_item_ca': instance.idItemCa,
      'frequency': instance.frequency,
      'nominal': instance.nominal,
      'total': instance.total,
    };
