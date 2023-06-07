// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      no: json['no'] as int?,
      id: json['id'],
      roomName: json['room_name'] as String?,
      capacity: json['capacity'] as int?,
      floor: json['floor'] as int?,
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'no': instance.no,
      'id': instance.id,
      'room_name': instance.roomName,
      'capacity': instance.capacity,
      'floor': instance.floor,
    };
