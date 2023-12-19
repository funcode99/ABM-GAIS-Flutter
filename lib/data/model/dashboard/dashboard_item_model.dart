import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_item_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DashboardItemModel {
  String? status;
  double? total;
  int? idRoom;
  String? type;
  String? roomName;
  String? itemName;

  DashboardItemModel(
      {
        this.status,
        this.total,
        this.idRoom,
        this.type,
        this.roomName,
        this.itemName,
      });

  factory DashboardItemModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardItemModelToJson(this);

  static DashboardItemModel fromJsonModel(Object? json) =>
      DashboardItemModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(DashboardItemModel model) =>
      model.toJson();

  static List<DashboardItemModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList
          .map((json) => DashboardItemModel.fromJson(json))
          .toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [DashboardItemModel.fromJson(jsonList)];
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
    if (list is List<DashboardItemModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }
}
