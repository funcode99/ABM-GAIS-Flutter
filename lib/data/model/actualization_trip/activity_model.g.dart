// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      idAct: json['id_act'],
      actDate: json['act_date'] as String?,
      activities: json['activities'] as String?,
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'id_act': instance.idAct,
      'activities': instance.activities,
      'act_date': instance.actDate,
    };
