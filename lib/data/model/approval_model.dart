import 'package:json_annotation/json_annotation.dart';

part 'approval_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ApprovalModel {
  int? approvedBehalf;
  String? notes;
  bool? isRevision;

  ApprovalModel({
    this.approvedBehalf,
    this.notes,
    this.isRevision
  });

  static ApprovalModel fromJsonModel(Object? json) =>
      ApprovalModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(ApprovalModel model) =>
      model.toJson();

  static List<ApprovalModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => ApprovalModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [ApprovalModel.fromJson(jsonList)];
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
    if (list is List<ApprovalModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory ApprovalModel.fromJson(Map<String, dynamic> json) =>
      _$ApprovalModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovalModelToJson(this);
}