import 'package:json_annotation/json_annotation.dart';

part 'approval_log_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ApprovalLogModel {
  int? level;
  int? codeStatus;
  String? text;
  String? date;
  String? notes;

  ApprovalLogModel({
    this.codeStatus,
    this.level,
    this.text,
    this.date,
    this.notes
  });

  static ApprovalLogModel fromJsonModel(Object? json) =>
      ApprovalLogModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(ApprovalLogModel model) =>
      model.toJson();

  static List<ApprovalLogModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => ApprovalLogModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [ApprovalLogModel.fromJson(jsonList)];
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
    if (list is List<ApprovalLogModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory ApprovalLogModel.fromJson(Map<String, dynamic> json) =>
      _$ApprovalLogModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovalLogModelToJson(this);
}