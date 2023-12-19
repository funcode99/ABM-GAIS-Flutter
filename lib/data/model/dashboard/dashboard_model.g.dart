// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      statusTrip: (json['status_trip'] as List<dynamic>?)
          ?.map((e) => DashboardItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tripPurpose: (json['trip_purpose'] as List<dynamic>?)
          ?.map((e) => DashboardItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meetingRoom: (json['meeting_room'] as List<dynamic>?)
          ?.map((e) => DashboardItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      stockInOut: (json['stock_in_out'] as List<dynamic>?)
          ?.map((e) => DashboardItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      atkRequest: (json['atk_request'] as List<dynamic>?)
          ?.map((e) => DashboardItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookMeetingUsed: (json['book_meeting_used'] as List<dynamic>?)
          ?.map((e) => DashboardItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'status_trip': instance.statusTrip?.map((e) => e.toJson()).toList(),
      'trip_purpose': instance.tripPurpose?.map((e) => e.toJson()).toList(),
      'meeting_room': instance.meetingRoom?.map((e) => e.toJson()).toList(),
      'stock_in_out': instance.stockInOut?.map((e) => e.toJson()).toList(),
      'book_meeting_used':
          instance.bookMeetingUsed?.map((e) => e.toJson()).toList(),
      'atk_request': instance.atkRequest?.map((e) => e.toJson()).toList(),
    };
