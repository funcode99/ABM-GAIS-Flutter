import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/master/check_item/check_item_model.dart';
import 'package:gais/data/model/pool_car/data_existing_model.dart';
import 'package:gais/data/model/pool_car/submit_check_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_check_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetCheckModel {
  List<CheckItemModel>? data;
  DataExistingModel? dataExisting;

  GetCheckModel(
      {
        this.data,
        this.dataExisting,
      });

  static GetCheckModel fromJsonModel(Object? json) =>
      GetCheckModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(GetCheckModel model) =>
      model.toJson();

  static List<GetCheckModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => GetCheckModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [GetCheckModel.fromJson(jsonList)];
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
    if (list is List<GetCheckModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory GetCheckModel.fromJson(Map<String, dynamic> json) =>
      _$GetCheckModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCheckModelToJson(this);
}
