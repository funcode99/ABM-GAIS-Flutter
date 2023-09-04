// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingRoomModel _$MeetingRoomModelFromJson(Map<String, dynamic> json) =>
    MeetingRoomModel(
      no: json['no'] as int?,
      id: json['id'],
      idCompany: json['id_company'] as int?,
      idSite: json['id_site'] as int?,
      nameMeetingRoom: json['name_meeting_room'] as String?,
      capacity: json['capacity'] as int?,
      floor: json['floor'] as int?,
      availableStatus: json['available_status'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'],
      updatedAt: json['updated_at'] as String?,
      updatedBy: json['updated_by'],
      deletedAt: json['deleted_at'] as String?,
      codeMeetingRoom: json['code_meeting_room'] as String?,
      companyName: json['company_name'] as String?,
      companyCode: json['company_code'] as String?,
      siteName: json['site_name'] as String?,
      siteCode: json['site_code'] as String?,
      approver: json['approver'],
      facility: json['facility'],
      isApproval: json['is_approval'] as bool?,
    );

Map<String, dynamic> _$MeetingRoomModelToJson(MeetingRoomModel instance) =>
    <String, dynamic>{
      'no': instance.no,
      'id': instance.id,
      'id_company': instance.idCompany,
      'id_site': instance.idSite,
      'name_meeting_room': instance.nameMeetingRoom,
      'capacity': instance.capacity,
      'floor': instance.floor,
      'available_status': instance.availableStatus,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt,
      'code_meeting_room': instance.codeMeetingRoom,
      'company_name': instance.companyName,
      'company_code': instance.companyCode,
      'site_name': instance.siteName,
      'site_code': instance.siteCode,
      'facility': instance.facility,
      'approver': instance.approver,
      'is_approval': instance.isApproval,
    };
