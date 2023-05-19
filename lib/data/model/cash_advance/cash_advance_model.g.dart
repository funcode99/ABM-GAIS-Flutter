// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_advance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashAdvanceModel _$CashAdvanceModelFromJson(Map<String, dynamic> json) =>
    CashAdvanceModel(
      id: json['id'] as int?,
      idEmployee: json['id_employee'] as int?,
      typeCa: json['type_ca'] as String?,
      noCa: json['no_ca'] as String?,
      idRequestTrip: json['id_request_trip'] as int?,
      idCurrency: json['id_currency'] as int?,
      grandTotal: json['grand_total'] as String?,
      isPaid: json['is_paid'] as int?,
      isJournal: json['is_journal'] as int?,
      codeStatusDoc: json['code_status_doc'] as String?,
      codeStatus: json['code_status'] as String?,
      noRequestTrip: json['no_request_trip'] as String?,
      employeeName: json['employee_name'] as String?,
      snEmployee: json['sn_employee'] as String?,
      currencyName: json['currency_name'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      currencyCode: json['currency_code'] as String?,
      code: json['code'] as int?,
      status: json['status'] as String?,
      itemCount: json['item_count'] as int?,
      createdAt: json['created_at'] as String?,
      event: json['event'] as String?,
      date: json['date'] as String?,
      arrayDetail: (json['array_detail'] as List<dynamic>?)
          ?.map(
              (e) => CashAdvanceDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CashAdvanceModelToJson(CashAdvanceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_employee': instance.idEmployee,
      'type_ca': instance.typeCa,
      'no_ca': instance.noCa,
      'id_request_trip': instance.idRequestTrip,
      'id_currency': instance.idCurrency,
      'grand_total': instance.grandTotal,
      'is_paid': instance.isPaid,
      'is_journal': instance.isJournal,
      'code_status_doc': instance.codeStatusDoc,
      'code_status': instance.codeStatus,
      'no_request_trip': instance.noRequestTrip,
      'employee_name': instance.employeeName,
      'sn_employee': instance.snEmployee,
      'currency_name': instance.currencyName,
      'currency_symbol': instance.currencySymbol,
      'currency_code': instance.currencyCode,
      'code': instance.code,
      'status': instance.status,
      'item_count': instance.itemCount,
      'created_at': instance.createdAt,
      'date': instance.date,
      'event': instance.event,
      'array_detail': instance.arrayDetail,
    };
