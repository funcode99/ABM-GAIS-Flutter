import 'package:gais/data/model/pool_car/submit_check_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_check_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SubmitCheckModel {
  String? idPoolCar;
  int? odometer;
  int? isUsable;
  String? notes;
  List<SubmitCheckDataModel>? data;

  SubmitCheckModel(
      {
        this.idPoolCar,
        this.odometer,
        this.isUsable,
        this.data,
        this.notes,
      });

  static SubmitCheckModel fromJsonModel(Object? json) =>
      SubmitCheckModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(SubmitCheckModel model) =>
      model.toJson();

  static List<SubmitCheckModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => SubmitCheckModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [SubmitCheckModel.fromJson(jsonList)];
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
    if (list is List<SubmitCheckModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory SubmitCheckModel.fromJson(Map<String, dynamic> json) =>
      _$SubmitCheckModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitCheckModelToJson(this);
}
