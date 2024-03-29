import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_in_atk_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class StockInATKDetailModel extends Equatable {
  String? key;
  dynamic id;
  dynamic idStockIn;
  int? idWarehouse;
  int? idItem;
  int? idBrand;
  int? idUom;
  int? qty;
  String? remarks;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? itemName;
  String? codeItem;
  String? brandName;
  String? uomName;
  String? warehouseName;

  StockInATKDetailModel({
    this.key,
    this.id,
    this.idStockIn,
    this.idWarehouse,
    this.idItem,
    this.idBrand,
    this.idUom,
    this.qty,
    this.remarks,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.itemName,
    this.codeItem,
    this.brandName,
    this.uomName,
    this.warehouseName,
  });

  factory StockInATKDetailModel.fromJson(Map<String, dynamic> json) =>
      _$StockInATKDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$StockInATKDetailModelToJson(this);

  static StockInATKDetailModel fromJsonModel(Object? json) =>
      StockInATKDetailModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(StockInATKDetailModel model) =>
      model.toJson();

  static List<StockInATKDetailModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList
          .map((json) => StockInATKDetailModel.fromJson(json))
          .toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [StockInATKDetailModel.fromJson(jsonList)];
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
    if (list is List<StockInATKDetailModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  @override
  List<Object?> get props => [
        key,
        id,
        idStockIn,
        idWarehouse,
        idItem,
        qty,
        remarks,
        createdAt,
        createdBy,
        updatedAt,
        updatedBy,
        itemName,
        codeItem,
        brandName,
        uomName,
        warehouseName,
      ];
}
