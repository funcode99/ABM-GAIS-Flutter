import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facility_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FacilityModel extends Equatable{
  dynamic id;
  String? facilityName;

  FacilityModel({
    this.id,
    this.facilityName,
  });

  static FacilityModel fromJsonModel(Object? json) =>
      FacilityModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(FacilityModel model) =>
      model.toJson();

  static List<FacilityModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => FacilityModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [FacilityModel.fromJson(jsonList)];
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
    if (list is List<FacilityModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory FacilityModel.fromJson(Map<String, dynamic> json) =>
      _$FacilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
    id, facilityName
  ];
}