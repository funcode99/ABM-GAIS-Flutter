import 'package:gais/data/model/booking_meeting_room/participant_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_meeting_room_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class BookingMeetingRoomModel {
  int? no;
  int? id;
  int? idMeetingRoom;
  String? noBookingMeeting;
  String? title;
  int? idCompany;
  int? idSite;
  int? idEmployee;
  String? remarks;
  String? notes;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  int? floor;
  int? capacity;
  String? session;
  int? codeStatusDoc;
  String? link;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? deletedAt;
  List<int>? participant;
  List<ParticipantModel>? participantArray;
  String? nameMeetingRoom;
  String? employeeName;
  String? companyName;
  String? companyCode;
  String? siteName;
  String? siteCode;
  String? status;
  dynamic facility;
  dynamic external;
  dynamic isOnlineMeeting;
  dynamic isRecurrence;
  String? recurrence;
  String? reccurrence;
  String? attachment;
  String? attachmentPath;

  BookingMeetingRoomModel(
      {
        this.no,
        this.id,
        this.idMeetingRoom,
        this.noBookingMeeting,
        this.title,
        this.idCompany,
        this.idSite,
        this.idEmployee,
        this.remarks,
        this.notes,
        this.startDate,
        this.startTime,
        this.endDate,
        this.endTime,
        this.floor,
        this.capacity,
        this.session,
        this.codeStatusDoc,
        this.link,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.deletedAt,
        this.participantArray,
        this.nameMeetingRoom,
        this.employeeName,
        this.companyName,
        this.companyCode,
        this.siteName,
        this.siteCode,
        this.status,
        this.participant,
        this.facility,
        this.external,
        this.isOnlineMeeting,
        this.isRecurrence,
        this.recurrence,
        this.reccurrence,
        this.attachment,
        this.attachmentPath,
      });

  static BookingMeetingRoomModel fromJsonModel(Object? json) =>
      BookingMeetingRoomModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(BookingMeetingRoomModel model) =>
      model.toJson();

  static List<BookingMeetingRoomModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => BookingMeetingRoomModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [BookingMeetingRoomModel.fromJson(jsonList)];
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
    if (list is List<BookingMeetingRoomModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory BookingMeetingRoomModel.fromJson(Map<String, dynamic> json) =>
      _$BookingMeetingRoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingMeetingRoomModelToJson(this);
}
