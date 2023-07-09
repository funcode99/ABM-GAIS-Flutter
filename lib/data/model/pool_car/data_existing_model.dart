import 'package:json_annotation/json_annotation.dart';

part 'data_existing_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DataExistingModel {
  int? isUsable;
  int? odometer;
  String? notes;

  DataExistingModel(
      {
        this.odometer,
        this.isUsable,
        this.notes,
      });

  static DataExistingModel fromJsonModel(Object? json) =>
      DataExistingModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(DataExistingModel model) =>
      model.toJson();

  static List<DataExistingModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => DataExistingModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [DataExistingModel.fromJson(jsonList)];
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
    if (list is List<DataExistingModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory DataExistingModel.fromJson(Map<String, dynamic> json) =>
      _$DataExistingModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataExistingModelToJson(this);
}
