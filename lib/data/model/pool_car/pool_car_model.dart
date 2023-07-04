import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pool_car_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PoolCarModel {
  int? id;
  int? idCar;
  int? idEmployee;
  int? idDrivers;
  int? idRequestTrip;
  String? fromDate;
  String? toDate;
  String? noPoolCar;
  int? codeStatusDoc;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? requestorName;
  String? noRequestTrip;
  String? plate;
  String? status;
  String? driverName;

  PoolCarModel(
      {
        this.id,
        this.idCar,
        this.idEmployee,
        this.idDrivers,
        this.idRequestTrip,
        this.fromDate,
        this.toDate,
        this.noPoolCar,
        this.codeStatusDoc,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.requestorName,
        this.noRequestTrip,
        this.plate,
        this.status,
        this.driverName,
      });

  static PoolCarModel fromJsonModel(Object? json) =>
      PoolCarModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(PoolCarModel model) =>
      model.toJson();

  static List<PoolCarModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => PoolCarModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [PoolCarModel.fromJson(jsonList)];
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
    if (list is List<PoolCarModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory PoolCarModel.fromJson(Map<String, dynamic> json) =>
      _$PoolCarModelFromJson(json);

  Map<String, dynamic> toJson() => _$PoolCarModelToJson(this);
}
