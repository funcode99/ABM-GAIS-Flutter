// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckItemModel _$CheckItemModelFromJson(Map<String, dynamic> json) =>
    CheckItemModel(
      idDetail: json['id_detail'] as int?,
      detailName: json['detail_name'] as String?,
      idGroup: json['id_group'] as int?,
      fillable: json['fillable'] as int?,
      idHeader: json['id_header'] as int?,
      value: json['value'] as int?,
      headerName: json['header_name'] as String?,
      isHeader: json['is_header'] as int?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => ChoiceItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckItemModelToJson(CheckItemModel instance) =>
    <String, dynamic>{
      'id_detail': instance.idDetail,
      'detail_name': instance.detailName,
      'id_group': instance.idGroup,
      'fillable': instance.fillable,
      'id_header': instance.idHeader,
      'value': instance.value,
      'header_name': instance.headerName,
      'is_header': instance.isHeader,
      'choices': instance.choices?.map((e) => e.toJson()).toList(),
    };
