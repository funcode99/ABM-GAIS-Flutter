import 'package:equatable/equatable.dart';
import 'package:gais/data/model/booking_meeting_room/participant_model.dart';
import 'package:gais/data/model/master/facility/facility_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_meeting_room_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class BookingMeetingRoomModel extends Equatable{
  int? no;
  int? id;
  dynamic idMeetingRoom;
  String? noBookingMeeting;
  String? title;
  dynamic idCompany;
  dynamic idSite;
  int? idEmployee;
  String? remarks;
  String? notes;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  dynamic floor;
  dynamic capacity;
  String? session;
  int? codeStatusDoc;
  String? link;
  String? createdAt;
  String? approvedAt;
  String? rejectedAt;
  dynamic createdBy;
  dynamic isApproval;
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
  List<FacilityModel>? facilityArray;
  dynamic external;
  dynamic isOnlineMeeting;
  dynamic isRecurrence;
  String? recurrence;
  String? reccurrence;
  String? attachment;
  String? attachmentPath;
  String? untilOcurs;
  String? nameApproved;
  String? nameRejected;
  String? nameStarted;
  String? nameEnded;
  dynamic days;
  String? durationStart;
  String? durationEnd;
  String? recurrenceStart;
  String? recurrenceEnd;
  dynamic duration;
  int? durationInMinute;
  int? position;
  int? hour;
  int? minute;
  bool? isScheduled;

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
        this.isApproval,
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
        this.approvedAt,
        this.rejectedAt,
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
        this.untilOcurs,
        this.nameApproved,
        this.nameRejected,
        this.nameStarted,
        this.nameEnded,
        this.days,
        this.durationStart,
        this.durationEnd,
        this.recurrenceStart,
        this.recurrenceEnd,
        this.hour,
        this.duration,
        this.position,
        this.minute,
        this.durationInMinute,
        this.isScheduled,
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

  @override
  // TODO: implement props
  List<Object?> get props => [
      no,
      id,
      idMeetingRoom,
      noBookingMeeting,
      title,
      idCompany,
      idSite,
      idEmployee,
      remarks,
      notes,
      startDate,
      startTime,
      endDate,
      endTime,
      floor,
      capacity,
      session,
      codeStatusDoc,
      link,
      createdAt,
      approvedAt,
      rejectedAt,
      createdBy,
      isApproval,
      updatedAt,
      updatedBy,
      deletedAt,
      participant,
      participantArray,
      nameMeetingRoom,
      employeeName,
      companyName,
      companyCode,
      siteName,
      siteCode,
      status,
      facility,
      facilityArray,
      external,
      isOnlineMeeting,
      isRecurrence,
      recurrence,
      reccurrence,
      attachment,
      attachmentPath,
      untilOcurs,
      nameApproved,
      nameRejected,
      nameStarted,
      nameEnded,
      days,
      durationStart,
      durationEnd,
      recurrenceStart,
      recurrenceEnd,
      duration,
      durationInMinute,
      position,
      hour,
      minute,
      isScheduled,
  ];
}
