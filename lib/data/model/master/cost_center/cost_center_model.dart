import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cost_center_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CostCenterModel extends Equatable{
  int? no;
  int? id;
  String? costCenterCode;
  String? costCenterName;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;

  CostCenterModel({
    this.id,
    this.costCenterName,
    this.no,
    this.costCenterCode,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  @override
  List<Object?> get props => [
    id,
    costCenterName,
    no,
    costCenterCode,
    createdAt,
    createdBy,
    updatedAt,
    updatedBy,
  ];

  static CostCenterModel fromJsonModel(Object? json) =>
      CostCenterModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(CostCenterModel model) =>
      model.toJson();

  static List<CostCenterModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => CostCenterModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [CostCenterModel.fromJson(jsonList)];
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
    if (list is List<CostCenterModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory CostCenterModel.fromJson(Map<String, dynamic> json) =>
      _$CostCenterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CostCenterModelToJson(this);
}