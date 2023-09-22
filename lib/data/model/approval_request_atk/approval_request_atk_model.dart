import 'package:json_annotation/json_annotation.dart';

part 'approval_request_atk_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ApprovalRequestATKModel {
  int? no;
  dynamic id;
  int? idCompany;
  int? idSite;
  int? idEmployee;
  String? noAtkRequest;
  String? remarks;
  int? codeStatusDoc;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? deletedAt;
  String? employeeName;
  String? companyName;
  String? companyCode;
  String? siteName;
  String? siteCode;
  String? status;
  int? itemCount;

  ApprovalRequestATKModel(
      {
        this.no,
        this.id,
        this.idCompany,
        this.idSite,
        this.idEmployee,
        this.noAtkRequest,
        this.remarks,
        this.codeStatusDoc,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.deletedAt,
        this.employeeName,
        this.companyName,
        this.companyCode,
        this.siteName,
        this.siteCode,
        this.status,
        this.itemCount,
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
