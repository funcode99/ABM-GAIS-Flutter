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
      idMeetingRoom: json['id_meeting_room'] as int?,
      noBookingMeeting: json['no_booking_meeting'] as String?,
      title: json['title'] as String?,
      idCompany: json['id_company'] as int?,
      idSite: json['id_site'] as int?,
      idEmployee: json['id_employee'] as int?,
      remarks: json['remarks'] as String?,
      notes: json['notes'] as String?,
      startDate: json['start_date'] as String?,
      startTime: json['start_time'] as String?,
      endDate: json['end_date'] as String?,
      endTime: json['end_time'] as String?,
      floor: json['floor'] as int?,
      capacity: json['capacity'] as int?,
      session: json['session'] as String?,
      codeStatusDoc: json['code_status_doc'] as int?,
      link: json['link'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      deletedAt: json['deleted_at'] as String?,
      participant: (json['participant'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      nameMeetingRoom: json['name_meeting_room'] as String?,
      employeeName: json['employee_name'] as String?,
      companyName: json['company_name'] as String?,
      companyCode: json['company_code'] as String?,
      siteName: json['site_name'] as String?,
      siteCode: json['site_code'] as String?,
      status: json['status'] as String?,
    );

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
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt,
      'participant': instance.participant,
      'name_meeting_room': instance.nameMeetingRoom,
      'employee_name': instance.employeeName,
      'company_name': instance.companyName,
      'company_code': instance.companyCode,
      'site_name': instance.siteName,
      'site_code': instance.siteCode,
      'status': instance.status,
    };
