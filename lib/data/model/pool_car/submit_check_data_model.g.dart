// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_check_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitCheckDataModel _$SubmitCheckDataModelFromJson(
        Map<String, dynamic> json) =>
    SubmitCheckDataModel(
      idDetailCheck: json['id_detail_check'],
      value: json['value'],
      path: json['path'] as String?,
    );

Map<String, dynamic> _$SubmitCheckDataModelToJson(
        SubmitCheckDataModel instance) =>
    <String, dynamic>{
      'id_detail_check': instance.idDetailCheck,
      'value': instance.value,
      'path': instance.path,
    };
