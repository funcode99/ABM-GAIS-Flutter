import 'package:json_annotation/json_annotation.dart';

part 'participant_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ParticipantModel {
  int? idEmployee;
  String? employeeName;
  String? email;

  ParticipantModel(
      {
        this.idEmployee,
        this.email,
        this.employeeName,
      });

  static ParticipantModel fromJsonModel(Object? json) =>
      ParticipantModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(ParticipantModel model) =>
      model.toJson();

  static List<ParticipantModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => ParticipantModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [ParticipantModel.fromJson(jsonList)];
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
    if (list is List<ParticipantModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory ParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantModelToJson(this);
}
