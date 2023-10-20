import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ActivityModel {
  String? key;
  dynamic id;
  dynamic idAct;
  String? activities;
  String? actDate;
  bool deletable;

  ActivityModel(
      {
        this.key,
        this.idAct,
        this.id,
        this.actDate,
        this.activities,
        this.deletable = false,
      });

  static ActivityModel fromJsonModel(Object? json) =>
      ActivityModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(ActivityModel model) =>
      model.toJson();

  static List<ActivityModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => ActivityModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [ActivityModel.fromJson(jsonList)];
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
    if (list is List<ActivityModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);

  ActivityModel copyWith({
    String? key,
    String? activities,
    String? actDate,
    bool? deletable,
  }) {
    return ActivityModel(
      key: key ?? this.key,
      actDate: actDate ?? this.actDate,
      activities: activities ?? this.activities,
      deletable: deletable ?? this.deletable,
      idAct: idAct,
      id: id
    );
  }

}
