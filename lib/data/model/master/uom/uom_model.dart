import 'package:json_annotation/json_annotation.dart';

part 'uom_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UomModel {
  int? id;
  String? uomName;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;

  UomModel({
    this.id,
    this.uomName,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  static UomModel fromJsonModel(Object? json) =>
      UomModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(UomModel model) =>
      model.toJson();

  static List<UomModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => UomModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [UomModel.fromJson(jsonList)];
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
    if (list is List<UomModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory UomModel.fromJson(Map<String, dynamic> json) =>
      _$UomModelFromJson(json);

  Map<String, dynamic> toJson() => _$UomModelToJson(this);
}