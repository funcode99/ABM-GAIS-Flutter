import 'package:equatable/equatable.dart';
import 'package:gais/data/model/booking_meeting_room/participant_model.dart';
import 'package:gais/data/model/master/facility/facility_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_meeting_room_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class BookingMeetingRoomModel extends Equatable{
  int? no;
  dynamic id;
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
  List<dynamic>? participant;
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

  BookingMeetingRoomModel copyWith({
    int? no,
    dynamic id,
    dynamic idMeetingRoom,
    String? noBookingMeeting,
    String? title,
    dynamic idCompany,
    dynamic idSite,
    int? idEmployee,
    String? remarks,
    String? notes,
    String? startDate,
    String? startTime,
    String? endDate,
    String? endTime,
    dynamic floor,
    dynamic capacity,
    String? session,
    int? codeStatusDoc,
    String? link,
    String? createdAt,
    String? approvedAt,
    String? rejectedAt,
    dynamic createdBy,
    dynamic isApproval,
    String? updatedAt,
    dynamic updatedBy,
    String? deletedAt,
    List<dynamic>? participant,
    List<ParticipantModel>? participantArray,
    String? nameMeetingRoom,
    String? employeeName,
    String? companyName,
    String? companyCode,
    String? siteName,
    String? siteCode,
    String? status,
    dynamic facility,
    List<FacilityModel>? facilityArray,
    dynamic external,
    dynamic isOnlineMeeting,
    dynamic isRecurrence,
    String? recurrence,
    String? reccurrence,
    String? attachment,
    String? attachmentPath,
    String? untilOcurs,
    String? nameApproved,
    String? nameRejected,
    String? nameStarted,
    String? nameEnded,
    dynamic days,
    String? durationStart,
    String? durationEnd,
    String? recurrenceStart,
    String? recurrenceEnd,
    dynamic duration,
    int? durationInMinute,
    int? position,
    int? hour,
    int? minute,
    bool? isScheduled,
  }) => BookingMeetingRoomModel(
    no : no ?? this.no,
    id : id ?? this.id,
    idMeetingRoom : idMeetingRoom ?? this.idMeetingRoom,
    noBookingMeeting : noBookingMeeting ?? this.noBookingMeeting,
    title : title ?? this.title,
    idCompany : idCompany ?? this.idCompany,
    idSite : idSite ?? this.idSite,
    idEmployee : idEmployee ?? this.idEmployee,
    isApproval : isApproval ?? this.isApproval,
    remarks : remarks ?? this.remarks,
    notes : notes ?? this.notes,
    startDate : startDate ?? this.startDate,
    startTime : startTime ?? this.startTime,
    endDate : endDate ?? this.endDate,
    endTime : endTime ?? this.endTime,
    floor : floor ?? this.floor,
    capacity : capacity ?? this.capacity,
    session : session ?? this.session,
    codeStatusDoc : codeStatusDoc ?? this.codeStatusDoc,
    link : link ?? this.link,
    createdAt : createdAt ?? this.createdAt,
    approvedAt : approvedAt ?? this.approvedAt,
    rejectedAt : rejectedAt ?? this.rejectedAt,
    createdBy : createdBy ?? this.createdBy,
    updatedAt : updatedAt ?? this.updatedAt,
    updatedBy : updatedBy ?? this.updatedBy,
    deletedAt : deletedAt ?? this.deletedAt,
    participantArray : participantArray ?? this.participantArray,
    nameMeetingRoom : nameMeetingRoom ?? this.nameMeetingRoom,
    employeeName : employeeName ?? this.employeeName,
    companyName : companyName ?? this.companyName,
    companyCode : companyCode ?? this.companyCode,
    siteName : siteName ?? this.siteName,
    siteCode : siteCode ?? this.siteCode,
    status : status ?? this.status,
    participant : participant ?? this.participant,
    facility : facility ?? this.facility,
    external : external ?? this.external,
    isOnlineMeeting : isOnlineMeeting ?? this.isOnlineMeeting,
    isRecurrence : isRecurrence ?? this.isRecurrence,
    recurrence : recurrence ?? this.recurrence,
    reccurrence : reccurrence ?? this.reccurrence,
    attachment : attachment ?? this.attachment,
    attachmentPath : attachmentPath ?? this.attachmentPath,
    untilOcurs : untilOcurs ?? this.untilOcurs,
    nameApproved : nameApproved ?? this.nameApproved,
    nameRejected : nameRejected ?? this.nameRejected,
    nameStarted : nameStarted ?? this.nameStarted,
    nameEnded : nameEnded ?? this.nameEnded,
    days : days ?? this.days,
    durationStart : durationStart ?? this.durationStart,
    durationEnd : durationEnd ?? this.durationEnd,
    recurrenceStart : recurrenceStart ?? this.recurrenceStart,
    recurrenceEnd : recurrenceEnd ?? this.recurrenceEnd,
    hour : hour ?? this.hour,
    duration : duration ?? this.duration,
    position : position ?? this.position,
    minute : minute ?? this.minute,
    durationInMinute : durationInMinute ?? this.durationInMinute,
    isScheduled : isScheduled ?? this.isScheduled,
  );
}
