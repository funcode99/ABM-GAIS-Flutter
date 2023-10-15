// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      key: json['key'] as String?,
      idAct: json['id_act'],
      id: json['id'],
      actDate: json['act_date'] as String?,
      activities: json['activities'] as String?,
      deletable: json['deletable'] as bool? ?? false,
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'id': instance.id,
      'id_act': instance.idAct,
      'activities': instance.activities,
      'act_date': instance.actDate,
      'deletable': instance.deletable,
    };
