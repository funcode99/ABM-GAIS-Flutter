// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['id'] as String?,
      isViewed: json['is_viewed'] as int?,
      idDocument: json['id_document'] as String?,
      text: json['text'] as String?,
      url: json['url'] as String?,
      idDoc: json['id_doc'] as String?,
      date: json['date'] as String?,
      codeDocument: json['code_document'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_viewed': instance.isViewed,
      'id_document': instance.idDocument,
      'text': instance.text,
      'url': instance.url,
      'id_doc': instance.idDoc,
      'date': instance.date,
      'code_document': instance.codeDocument,
      'name': instance.name,
    };
