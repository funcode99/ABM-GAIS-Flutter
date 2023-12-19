// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardItemModel _$DashboardItemModelFromJson(Map<String, dynamic> json) =>
    DashboardItemModel(
      status: json['status'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      idRoom: json['id_room'] as int?,
      type: json['type'] as String?,
      roomName: json['room_name'] as String?,
      itemName: json['item_name'] as String?,
    );

Map<String, dynamic> _$DashboardItemModelToJson(DashboardItemModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'total': instance.total,
      'id_room': instance.idRoom,
      'type': instance.type,
      'room_name': instance.roomName,
      'item_name': instance.itemName,
    };
