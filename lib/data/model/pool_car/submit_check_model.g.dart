// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitCheckModel _$SubmitCheckModelFromJson(Map<String, dynamic> json) =>
    SubmitCheckModel(
      idPoolCar: json['id_pool_car'],
      odometer: json['odometer'],
      isUsable: json['is_usable'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SubmitCheckDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$SubmitCheckModelToJson(SubmitCheckModel instance) =>
    <String, dynamic>{
      'id_pool_car': instance.idPoolCar,
      'odometer': instance.odometer,
      'is_usable': instance.isUsable,
      'notes': instance.notes,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
