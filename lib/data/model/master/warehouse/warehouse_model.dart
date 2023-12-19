import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warehouse_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WarehouseModel extends Equatable{
  final dynamic id;
  final String? warehouseName;
  final int? idCompany;
  final int? idSite;
  final String? createdAt;
  final String? createdBy;
  final String? updatedAt;
  final String? updatedBy;
  final String? companyName;
  final String? companyCode;
  final String? siteName;
  final String? siteCode;


  const WarehouseModel({
    this.id,
    this.warehouseName,
    this.idCompany,
    this.idSite,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.companyName,
    this.companyCode,
    this.siteName,
    this.siteCode,
  });


  static WarehouseModel fromJsonModel(Object? json) =>
      WarehouseModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(WarehouseModel model) =>
      model.toJson();

  static List<WarehouseModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => WarehouseModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [WarehouseModel.fromJson(jsonList)];
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
    if (list is List<WarehouseModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory WarehouseModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseModelToJson(this);

  @override
  List<Object?> get props => [
    id,
    warehouseName,
    idCompany,
    idSite,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
    companyName,
    companyCode,
    siteName,
    siteCode,
  ];
}