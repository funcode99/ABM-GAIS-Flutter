import 'package:json_annotation/json_annotation.dart';

part 'choice_item_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ChoiceItemModel {
  int? value;
  String? text;
  bool? attachable;


  ChoiceItemModel({
    this.value,
    this.text,
    this.attachable
  });

  static ChoiceItemModel fromJsonModel(Object? json) =>
      ChoiceItemModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(ChoiceItemModel model) =>
      model.toJson();

  static List<ChoiceItemModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => ChoiceItemModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [ChoiceItemModel.fromJson(jsonList)];
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
    if (list is List<ChoiceItemModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory ChoiceItemModel.fromJson(Map<String, dynamic> json) =>
      _$ChoiceItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceItemModelToJson(this);
}