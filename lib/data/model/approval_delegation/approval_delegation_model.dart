import 'package:gais/data/model/booking_meeting_room/participant_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'approval_delegation_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ApprovalDelegationModel {
  int? no;
  int? id;
  dynamic idEmployeeTo;
  dynamic idEmployee;
  String? delegator;
  String? delegateTo;
  String? notes;
  String? startDate;
  String? endDate;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? deletedAt;

  ApprovalDelegationModel(
      {
        this.no,
        this.id,
        this.idEmployee,
        this.idEmployeeTo,
        this.delegator,
        this.delegateTo,
        this.notes,
        this.startDate,
        this.endDate,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.deletedAt,
      });

  static ApprovalDelegationModel fromJsonModel(Object? json) =>
      ApprovalDelegationModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(ApprovalDelegationModel model) =>
      model.toJson();

  static List<ApprovalDelegationModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => ApprovalDelegationModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [ApprovalDelegationModel.fromJson(jsonList)];
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
    if (list is List<ApprovalDelegationModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory ApprovalDelegationModel.fromJson(Map<String, dynamic> json) =>
      _$ApprovalDelegationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovalDelegationModelToJson(this);
}
