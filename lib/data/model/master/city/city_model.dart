import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CityModel {
  int? no;
  int? id;
  String? cityCode;
  String? cityName;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? deletedAt;

  CityModel({
    this.no,
    this.id,
    this.cityCode,
    this.cityName,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
  });

  static CityModel fromJsonModel(Object? json) =>
      CityModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(CityModel model) =>
      model.toJson();

  static List<CityModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => CityModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [CityModel.fromJson(jsonList)];
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
    if (list is List<CityModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}