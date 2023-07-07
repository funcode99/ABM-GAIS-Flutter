import 'package:json_annotation/json_annotation.dart';

part 'approval_cash_advance_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ApprovalCashAdvanceModel {
  int? id;
  String? codeDocument;
  int? idDocument;
  int? level;
  int? idEmployee;
  int? idCompany;
  int? idSite;
  int? idMatrix;
  int? idApprovalAuth;
  dynamic approvedBy;
  dynamic approvedBehalf;
  dynamic rejectedBy;
  dynamic isApproved;
  String? notes;
  int? codeStatusDoc;
  int? isRequestTrip;
  String? codeSequence;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? deletedAt;
  int? currentLevel;
  int? itemCount;
  String? noCa;
  int? idCa;
  int? codeStatusCa;
  int? idCurrency;
  String? grandTotal;
  String? event;
  String? status;
  String? currencyName;
  String? currencySymbol;
  String? currencyCode;
  String? employeeName;
  String? noRequestTrip;

  ApprovalCashAdvanceModel(
      {
        this.id,
        this.codeDocument,
        this.idDocument,
        this.level,
        this.idEmployee,
        this.idCompany,
        this.idSite,
        this.idMatrix,
        this.idApprovalAuth,
        this.approvedBy,
        this.approvedBehalf,
        this.rejectedBy,
        this.isApproved,
        this.notes,
        this.codeStatusDoc,
        this.isRequestTrip,
        this.codeSequence,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.deletedAt,
        this.currentLevel,
        this.noCa,
        this.idCa,
        this.codeStatusCa,
        this.grandTotal,
        this.event,
        this.status,
        this.idCurrency,
        this.currencyName,
        this.currencySymbol,
        this.currencyCode,
        this.employeeName,
        this.itemCount,
        this.noRequestTrip,
      });

  static ApprovalCashAdvanceModel fromJsonModel(Object? json) =>
      ApprovalCashAdvanceModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(ApprovalCashAdvanceModel model) =>
      model.toJson();

  static List<ApprovalCashAdvanceModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => ApprovalCashAdvanceModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [ApprovalCashAdvanceModel.fromJson(jsonList)];
    }

    // We really shouldn't be here
    throw ArgumentError.value(
        jsonList,
        'jsonList',
        'fromJsonModelList cannot handle'
            ' this JSON payload. Please add a handler for this input or use the correct '
            'helper method.');
  }

  static List<Map<String, dynamic>> toJsonModelList(Object list) {
    if (list is List<ApprovalCashAdvanceModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory ApprovalCashAdvanceModel.fromJson(Map<String, dynamic> json) =>
      _$ApprovalCashAdvanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovalCashAdvanceModelToJson(this);
}
