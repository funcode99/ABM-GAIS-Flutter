import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'approval_request_atk_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ApprovalRequestATKModel {
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

  ApprovalRequestATKModel(
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

  static ApprovalRequestATKModel fromJsonModel(Object? json) =>
      ApprovalRequestATKModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(ApprovalRequestATKModel model) =>
      model.toJson();

  static List<ApprovalRequestATKModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => ApprovalRequestATKModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [ApprovalRequestATKModel.fromJson(jsonList)];
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
    if (list is List<ApprovalRequestATKModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory ApprovalRequestATKModel.fromJson(Map<String, dynamic> json) =>
      _$ApprovalRequestATKModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovalRequestATKModelToJson(this);
}
