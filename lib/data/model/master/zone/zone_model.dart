import 'package:json_annotation/json_annotation.dart';

part 'zone_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ZoneModel {
  int? no;
  dynamic idZona;
  String? zonaName;

  ZoneModel({
    this.no,
    this.idZona,
    this.zonaName,
  });

  static ZoneModel fromJsonModel(Object? json) =>
      ZoneModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(ZoneModel model) =>
      model.toJson();

  static List<ZoneModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => ZoneModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [ZoneModel.fromJson(jsonList)];
    }

    // We really shouldn't be here
    throw ArgumentError.value(
        jsonList,
        'jsonList',
        'fromJsonModelList cannot handle'
            ' this JSON payload. Please add a handler for this input or use the correct '
            'helper method.');
  }

  static List<Map<String, dynamic>> toJsonModelList(Object list) {
    if (list is List<ZoneModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory ZoneModel.fromJson(Map<String, dynamic> json) =>
      _$ZoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$ZoneModelToJson(this);
}