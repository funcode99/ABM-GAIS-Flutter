import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class NotificationModel {
  String? id;
  int? isViewed;
  String? idDocument;
  String? text;
  String? url;
  String? idDoc;
  String? date;
  String? codeDocument;
  String? typeDocument;
  String? name;

  NotificationModel({
    this.id,
    this.isViewed,
    this.idDocument,
    this.text,
    this.url,
    this.idDoc,
    this.date,
    this.codeDocument,
    this.typeDocument,
    this.name,
  });

  static NotificationModel fromJsonModel(Object? json) =>
      NotificationModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(NotificationModel model) =>
      model.toJson();

  static List<NotificationModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => NotificationModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [NotificationModel.fromJson(jsonList)];
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
    if (list is List<NotificationModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}