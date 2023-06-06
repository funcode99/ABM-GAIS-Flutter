import 'package:json_annotation/json_annotation.dart';

part 'room_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class RoomModel {
  int? no;
  dynamic id;
  String? roomName;
  int? capacity;
  int? floor;

  RoomModel({
    this.no,
    this.id,
    this.roomName,
    this.capacity,
    this.floor
  });

  static RoomModel fromJsonModel(Object? json) =>
      RoomModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(RoomModel model) =>
      model.toJson();

  static List<RoomModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => RoomModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [RoomModel.fromJson(jsonList)];
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
    if (list is List<RoomModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}