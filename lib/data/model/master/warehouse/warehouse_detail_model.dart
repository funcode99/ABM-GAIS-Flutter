import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warehouse_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WarehouseDetailModel extends Equatable{
  final dynamic id;
  final dynamic idWarehouse;
  final String? warehouseName;
  final dynamic stockAvailable;
  final dynamic idItem;
  final dynamic idAtkRequestDetail;
  final dynamic qtyApproved;
  final String? remarks;
  final int? maxValue;



  const WarehouseDetailModel({
    this.id,
    this.idWarehouse,
    this.warehouseName,
    this.stockAvailable,
    this.idItem,
    this.idAtkRequestDetail,
    this.qtyApproved,
    this.remarks,
    this.maxValue,
  });


  static WarehouseDetailModel fromJsonModel(Object? json) =>
      WarehouseDetailModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(WarehouseDetailModel model) =>
      model.toJson();

  static List<WarehouseDetailModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => WarehouseDetailModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [WarehouseDetailModel.fromJson(jsonList)];
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
    if (list is List<WarehouseDetailModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory WarehouseDetailModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseDetailModelToJson(this);

  @override
  List<Object?> get props => [
    idWarehouse,
    warehouseName,
    stockAvailable,
  ];
}