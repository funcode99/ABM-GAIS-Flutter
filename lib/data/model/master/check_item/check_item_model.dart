import 'package:gais/data/model/master/check_item/choice_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_item_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CheckItemModel {
  int? idDetail;
  String? detailName;
  int? idGroup;
  int? fillable;
  int? idHeader;
  int? value;
  String? headerName;
  int? isHeader;
  List<ChoiceItemModel>? choices;

  CheckItemModel({
    this.idDetail,
    this.detailName,
    this.idGroup,
    this.fillable,
    this.idHeader,
    this.value,
    this.headerName,
    this.isHeader,
    this.choices,
  });

  static CheckItemModel fromJsonModel(Object? json) =>
      CheckItemModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(CheckItemModel model) =>
      model.toJson();

  static List<CheckItemModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => CheckItemModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [CheckItemModel.fromJson(jsonList)];
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
    if (list is List<CheckItemModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory CheckItemModel.fromJson(Map<String, dynamic> json) =>
      _$CheckItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckItemModelToJson(this);
}