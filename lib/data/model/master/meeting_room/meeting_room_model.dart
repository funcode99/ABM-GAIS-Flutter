import 'package:json_annotation/json_annotation.dart';

part 'meeting_room_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MeetingRoomModel {
  int? no;
  dynamic id;
  int? idCompany;
  int? idSite;
  String? nameMeetingRoom;
  int? capacity;
  int? floor;
  String? availableStatus;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? deletedAt;
  String? codeMeetingRoom;
  String? companyName;
  String? companyCode;
  String? siteName;
  String? siteCode;

  MeetingRoomModel({
    this.no,
    this.id,
    this.idCompany,
    this.idSite,
    this.nameMeetingRoom,
    this.capacity,
    this.floor,
    this.availableStatus,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.codeMeetingRoom,
    this.companyName,
    this.companyCode,
    this.siteName,
    this.siteCode,
  });

  static MeetingRoomModel fromJsonModel(Object? json) =>
      MeetingRoomModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(MeetingRoomModel model) =>
      model.toJson();

  static List<MeetingRoomModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => MeetingRoomModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [MeetingRoomModel.fromJson(jsonList)];
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
    if (list is List<MeetingRoomModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory MeetingRoomModel.fromJson(Map<String, dynamic> json) =>
      _$MeetingRoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingRoomModelToJson(this);
}