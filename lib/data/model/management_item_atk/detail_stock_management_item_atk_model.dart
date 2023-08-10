import 'package:json_annotation/json_annotation.dart';

part 'detail_stock_management_item_atk_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DetailStockManagementItemATKModel {
  dynamic no;
  dynamic id;
  dynamic idWarehouse;
  String? warehouseName;
  dynamic currentStock;
  dynamic bookedStockWh;
  dynamic stockToApproveWh;

  DetailStockManagementItemATKModel({
    this.no,
    this.id,
    this.idWarehouse,
    this.warehouseName,
    this.currentStock,
    this.bookedStockWh,
    this.stockToApproveWh,
  });

  static DetailStockManagementItemATKModel fromJsonModel(Object? json) =>
      DetailStockManagementItemATKModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(DetailStockManagementItemATKModel model) =>
      model.toJson();

  static List<DetailStockManagementItemATKModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => DetailStockManagementItemATKModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [DetailStockManagementItemATKModel.fromJson(jsonList)];
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
    if (list is List<DetailStockManagementItemATKModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory DetailStockManagementItemATKModel.fromJson(Map<String, dynamic> json) =>
      _$DetailStockManagementItemATKModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailStockManagementItemATKModelToJson(this);
}
