import 'package:json_annotation/json_annotation.dart';

part 'driver_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DriverModel {
  dynamic id;
  String? username;
  String? name;
  int? idCompany;
  int? idSite;
  String? email;

  DriverModel({
    this.id,
    this.username,
    this.name,
    this.idCompany,
    this.idSite,
    this.email,
  });

  static DriverModel fromJsonModel(Object? json) =>
      DriverModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(DriverModel model) =>
      model.toJson();

  static List<DriverModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => DriverModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [DriverModel.fromJson(jsonList)];
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
    if (list is List<DriverModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory DriverModel.fromJson(Map<String, dynamic> json) =>
      _$DriverModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverModelToJson(this);
}