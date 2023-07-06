import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_check_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SubmitCheckDataModel {
  int? idDetailCheck;
  int? value;

  SubmitCheckDataModel(
      {
        this.idDetailCheck,
        this.value,
      });

  static SubmitCheckDataModel fromJsonModel(Object? json) =>
      SubmitCheckDataModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(SubmitCheckDataModel model) =>
      model.toJson();

  static List<SubmitCheckDataModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => SubmitCheckDataModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [SubmitCheckDataModel.fromJson(jsonList)];
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
    if (list is List<SubmitCheckDataModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory SubmitCheckDataModel.fromJson(Map<String, dynamic> json) =>
      _$SubmitCheckDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitCheckDataModelToJson(this);
}
