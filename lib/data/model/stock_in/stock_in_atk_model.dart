import 'package:equatable/equatable.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_in_atk_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class StockInATKModel extends Equatable {
  dynamic id;
  int? idCompany;
  int? idDepartement;
  int? idSite;
  int? idWarehouse;
  int? idEmployee;
  String? noStockIn;
  String? remarks;
  dynamic codeStatusDoc;
  String? status;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? employeeName;
  String? warehouseName;
  String? departementName;
  String? companyName;
  String? companyCode;
  String? siteName;
  String? siteCode;
  int? itemCount;
  List<StockInATKDetailModel>? arrayDetail;

  StockInATKModel({
    this.id,
    this.idCompany,
    this.idDepartement,
    this.idSite,
    this.idWarehouse,
    this.idEmployee,
    this.noStockIn,
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

  factory StockInATKModel.fromJson(Map<String, dynamic> json) =>
      _$StockInATKModelFromJson(json);

  Map<String, dynamic> toJson() => _$StockInATKModelToJson(this);

  static StockInATKModel fromJsonModel(Object? json) =>
      StockInATKModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(StockInATKModel model) =>
      model.toJson();

  static List<StockInATKModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => StockInATKModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [StockInATKModel.fromJson(jsonList)];
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
    if (list is List<StockInATKModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  @override
  List<Object?> get props => [
        id,
        idCompany,
        idDepartement,
        idSite,
        idWarehouse,
        idEmployee,
        noStockIn,
        remarks,
        codeStatusDoc,
        status,
        createdAt,
        createdBy,
        updatedAt,
        updatedBy,
        employeeName,
        warehouseName,
        departementName,
        companyName,
        companyCode,
        siteName,
        siteCode,
        itemCount,
        arrayDetail,
      ];
}
