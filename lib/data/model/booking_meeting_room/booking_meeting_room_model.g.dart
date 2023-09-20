// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_meeting_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingMeetingRoomModel _$BookingMeetingRoomModelFromJson(
        Map<String, dynamic> json) =>
    BookingMeetingRoomModel(
      no: json['no'] as int?,
      id: json['id'] as int?,
      idMeetingRoom: json['id_meeting_room'],
      noBookingMeeting: json['no_booking_meeting'] as String?,
      title: json['title'] as String?,
      idCompany: json['id_company'],
      idSite: json['id_site'],
      idEmployee: json['id_employee'] as int?,
      isApproval: json['is_approval'],
      remarks: json['remarks'] as String?,
      notes: json['notes'] as String?,
      startDate: json['start_date'] as String?,
      startTime: json['start_time'] as String?,
      endDate: json['end_date'] as String?,
      endTime: json['end_time'] as String?,
      floor: json['floor'],
      capacity: json['capacity'],
      session: json['session'] as String?,
      codeStatusDoc: json['code_status_doc'] as int?,
      link: json['link'] as String?,
      createdAt: json['created_at'] as String?,
      approvedAt: json['approved_at'] as String?,
      rejectedAt: json['rejected_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      deletedAt: json['deleted_at'] as String?,
      participantArray: (json['participant_array'] as List<dynamic>?)
          ?.map((e) => ParticipantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nameMeetingRoom: json['name_meeting_room'] as String?,
      employeeName: json['employee_name'] as String?,
      companyName: json['company_name'] as String?,
      companyCode: json['company_code'] as String?,
      siteName: json['site_name'] as String?,
      siteCode: json['site_code'] as String?,
      status: json['status'] as String?,
      participant: (json['participant'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      facility: json['facility'],
      external: json['external'],
      isOnlineMeeting: json['is_online_meeting'],
      isRecurrence: json['is_recurrence'],
      recurrence: json['recurrence'] as String?,
      reccurrence: json['reccurrence'] as String?,
      attachment: json['attachment'] as String?,
      attachmentPath: json['attachment_path'] as String?,
      untilOcurs: json['until_ocurs'] as String?,
      nameApproved: json['name_approved'] as String?,
      nameRejected: json['name_rejected'] as String?,
      nameStarted: json['name_started'] as String?,
      nameEnded: json['name_ended'] as String?,
      days: json['days'],
      durationStart: json['duration_start'] as String?,
      durationEnd: json['duration_end'] as String?,
      recurrenceStart: json['recurrence_start'] as String?,
      recurrenceEnd: json['recurrence_end'] as String?,
      hour: json['hour'] as int?,
      duration: json['duration'],
      position: json['position'] as int?,
      minute: json['minute'] as int?,
      durationInMinute: json['duration_in_minute'] as int?,
      isScheduled: json['is_scheduled'] as bool?,
    )..facilityArray = (json['facility_array'] as List<dynamic>?)
        ?.map((e) => FacilityModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$BookingMeetingRoomModelToJson(
        BookingMeetingRoomModel instance) =>
    <String, dynamic>{
      'no': instance.no,
      'id': instance.id,
      'id_meeting_room': instance.idMeetingRoom,
      'no_booking_meeting': instance.noBookingMeeting,
      'title': instance.title,
      'id_company': instance.idCompany,
      'id_site': instance.idSite,
      'id_employee': instance.idEmployee,
      'remarks': instance.remarks,
      'notes': instance.notes,
      'start_date': instance.startDate,
      'start_time': instance.startTime,
      'end_date': instance.endDate,
      'end_time': instance.endTime,
      'floor': instance.floor,
      'capacity': instance.capacity,
      'session': instance.session,
      'code_status_doc': instance.codeStatusDoc,
      'link': instance.link,
      'created_at': instance.createdAt,
      'approved_at': instance.approvedAt,
      'rejected_at': instance.rejectedAt,
      'created_by': instance.createdBy,
      'is_approval': instance.isApproval,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt,
      'participant': instance.participant,
      'participant_array':
          instance.participantArray?.map((e) => e.toJson()).toList(),
      'name_meeting_room': instance.nameMeetingRoom,
      'employee_name': instance.employeeName,
      'company_name': instance.companyName,
      'company_code': instance.companyCode,
      'site_name': instance.siteName,
      'site_code': instance.siteCode,
      'status': instance.status,
      'facility': instance.facility,
      'facility_array': instance.facilityArray?.map((e) => e.toJson()).toList(),
      'external': instance.external,
      'is_online_meeting': instance.isOnlineMeeting,
      'is_recurrence': instance.isRecurrence,
      'recurrence': instance.recurrence,
      'reccurrence': instance.reccurrence,
      'attachment': instance.attachment,
      'attachment_path': instance.attachmentPath,
      'until_ocurs': instance.untilOcurs,
      'name_approved': instance.nameApproved,
      'name_rejected': instance.nameRejected,
      'name_started': instance.nameStarted,
      'name_ended': instance.nameEnded,
      'days': instance.days,
      'duration_start': instance.durationStart,
      'duration_end': instance.durationEnd,
      'recurrence_start': instance.recurrenceStart,
      'recurrence_end': instance.recurrenceEnd,
      'duration': instance.duration,
      'duration_in_minute': instance.durationInMinute,
      'position': instance.position,
      'hour': instance.hour,
      'minute': instance.minute,
      'is_scheduled': instance.isScheduled,
    };
