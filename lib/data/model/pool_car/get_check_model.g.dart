// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCheckModel _$GetCheckModelFromJson(Map<String, dynamic> json) =>
    GetCheckModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CheckItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataExisting: json['data_existing'] == null
          ? null
          : DataExistingModel.fromJson(
              json['data_existing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCheckModelToJson(GetCheckModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'data_existing': instance.dataExisting?.toJson(),
    };
