import 'package:gais/data/model/request_atk/request_atk_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_atk_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class RequestAtkModel {
  int? id;
  int? idCompany;
  int? idDepartement;
  int? idSite;
  int? idWarehouse;
  int? idEmployee;
  String? noAtkRequest;
  String? remarks;
  int? codeStatusDoc;
  String? status;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? employeeName;
  String? warehouseName;
  String? departementName;
  String? companyName;
  String? companyCode;
  String? siteName;
  String? siteCode;
  int? itemCount;
  List<RequestATKDetailModel>? arrayDetail;

  RequestAtkModel(
      {
        this.id,
        this.idCompany,
        this.idDepartement,
        this.idSite,
        this.idWarehouse,
        this.idEmployee,
        this.noAtkRequest,
        this.remarks,
        this.codeStatusDoc,
        this.status,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.employeeName,
        this.warehouseName,
        this.departementName,
        this.companyName,
        this.companyCode,
        this.siteName,
        this.siteCode,
        this.itemCount,
        this.arrayDetail,
});

  static RequestAtkModel fromJsonModel(Object? json) =>
      RequestAtkModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(RequestAtkModel model) =>
      model.toJson();

  static List<RequestAtkModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => RequestAtkModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [RequestAtkModel.fromJson(jsonList)];
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
    if (list is List<RequestAtkModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory RequestAtkModel.fromJson(Map<String, dynamic> json) =>
      _$RequestAtkModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestAtkModelToJson(this);
}
