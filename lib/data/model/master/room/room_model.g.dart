// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
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
      facility: json['facility'],
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
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
      'facility': instance.facility,
    };
