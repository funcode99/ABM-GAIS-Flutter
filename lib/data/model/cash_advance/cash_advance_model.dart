import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cash_advance_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CashAdvanceModel {
  int? id;
  int? idEmployee;
  int? typeCa;
  String? noCa;
  int? idRequestTrip;
  int? idCurrency;
  String? grandTotal;
  int? isPaid;
  int? isJournal;
  int? codeStatusDoc;
  int? codeStatus;
  String? noRequestTrip;
  String? employeeName;
  String? snEmployee;
  String? currencyName;
  String? currencySymbol;
  String? currencyCode;
  int? code;
  String? status;
  int? itemCount;
  List<CashAdvanceDetailModel>? arrayDetail;

  CashAdvanceModel(
      {this.id,
      this.idEmployee,
      this.typeCa,
      this.noCa,
      this.idRequestTrip,
      this.idCurrency,
      this.grandTotal,
      this.isPaid,
      this.isJournal,
      this.codeStatusDoc,
      this.codeStatus,
      this.noRequestTrip,
      this.employeeName,
      this.snEmployee,
      this.currencyName,
      this.currencySymbol,
      this.currencyCode,
      this.code,
      this.status,
      this.itemCount,
      this.arrayDetail});

  /// Helper methods for genericArgumentFactories
  static CashAdvanceModel fromJsonModel(Object? json) =>
      CashAdvanceModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(CashAdvanceModel model) =>
      model.toJson();

  static List<CashAdvanceModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => CashAdvanceModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [CashAdvanceModel.fromJson(jsonList)];
    }

    // We really shouldn't be here
    throw ArgumentError.value(
        jsonList,
        'jsonList',
        'fromJsonModelList cannot handle'
            ' this JSON payload. Please add a handler for this input or use the correct '
            'helper method.');
  }

  /// Not at all comprehensive, but you get the idea
  static List<Map<String, dynamic>> toJsonModelList(Object list) {
    if (list is List<CashAdvanceModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  /// Usual json_serializable stub methods
  factory CashAdvanceModel.fromJson(Map<String, dynamic> json) =>
      _$CashAdvanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$CashAdvanceModelToJson(this);
}
