import 'package:json_annotation/json_annotation.dart';

part 'management_item_atk_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ManagementItemATKModel {
  int? id;
  String? codeItem;
  String? itemName;
  int? idBrand;
  int? idUom;
  int? alertQty;
  int? currentStock;
  int? idCompany;
  int? idSite;
  int? idWarehouse;
  String? remarks;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? brandName;
  String? uomName;
  String? companyName;
  String? companyCode;
  String? siteName;
  String? siteCode;
  String? warehouseName;

  ManagementItemATKModel({
    this.id,
    this.codeItem,
    this.itemName,
    this.idBrand,
    this.idUom,
    this.alertQty,
    this.currentStock,
    this.idCompany,
    this.idSite,
    this.idWarehouse,
    this.remarks,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.brandName,
    this.uomName,
    this.companyName,
    this.companyCode,
    this.siteName,
    this.siteCode,
    this.warehouseName,
  });

  static ManagementItemATKModel fromJsonModel(Object? json) =>
      ManagementItemATKModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(ManagementItemATKModel model) =>
      model.toJson();

  static List<ManagementItemATKModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => ManagementItemATKModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [ManagementItemATKModel.fromJson(jsonList)];
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
    if (list is List<ManagementItemATKModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory ManagementItemATKModel.fromJson(Map<String, dynamic> json) =>
      _$ManagementItemATKModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManagementItemATKModelToJson(this);
}
