import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status_doc_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class StatusDocModel extends Equatable{
  dynamic code;
  String? status;

  StatusDocModel({this.code, this.status});

  @override
  List<Object?> get props => [code, status];

  static StatusDocModel fromJsonModel(Object? json) =>
      StatusDocModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(StatusDocModel model) =>
      model.toJson();

  static List<StatusDocModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => StatusDocModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [StatusDocModel.fromJson(jsonList)];
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
    if (list is List<StatusDocModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory StatusDocModel.fromJson(Map<String, dynamic> json) =>
      _$StatusDocModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusDocModelToJson(this);
}