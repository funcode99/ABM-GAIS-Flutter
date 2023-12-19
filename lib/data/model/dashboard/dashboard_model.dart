import 'package:equatable/equatable.dart';
import 'package:gais/data/model/dashboard/dashboard_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DashboardModel {
  List<DashboardItemModel>? statusTrip;
  List<DashboardItemModel>? tripPurpose;
  List<DashboardItemModel>? meetingRoom;
  List<DashboardItemModel>? stockInOut;
  List<DashboardItemModel>? bookMeetingUsed;
  List<DashboardItemModel>? atkRequest;

  DashboardModel(
      {
        this.statusTrip,
        this.tripPurpose,
        this.meetingRoom,
        this.stockInOut,
        this.atkRequest,
        this.bookMeetingUsed,
      });

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);

  static DashboardModel fromJsonModel(Object? json) =>
      DashboardModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(DashboardModel model) =>
      model.toJson();

  static List<DashboardModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList
          .map((json) => DashboardModel.fromJson(json))
          .toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [DashboardModel.fromJson(jsonList)];
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
    if (list is List<DashboardModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }
}
