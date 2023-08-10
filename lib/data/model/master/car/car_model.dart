import 'package:json_annotation/json_annotation.dart';

part 'car_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CarModel {
  int? no;
  dynamic id;
  String? carName;
  String? plate;
  int? idCompany;
  int? idSite;
  dynamic odometer;
  String? transmisi;
  int? idDriver;
  int? status;
  int? idCarType;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  String? deletedAt;
  String? startDate;
  String? endDate;
  int? type;
  String? typeName;
  String? hullNo;
  String? registrationDate;
  String? plateDate;
  String? kirDate;
  String? stickersDate;
  String? companyCode;
  String? siteName;
  String? siteCode;
  String? typeCar;
  String? name;
  String? companyName;

  CarModel({
    this.no,
    this.id,
    this.carName,
    this.plate,
    this.idCompany,
    this.idSite,
    this.odometer,
    this.transmisi,
    this.idDriver,
    this.status,
    this.idCarType,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.startDate,
    this.endDate,
    this.type,
    this.typeName,
    this.hullNo,
    this.registrationDate,
    this.plateDate,
    this.kirDate,
    this.stickersDate,
    this.companyCode,
    this.siteName,
    this.siteCode,
    this.typeCar,
    this.name,
    this.companyName,
  });

  static CarModel fromJsonModel(Object? json) =>
      CarModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(CarModel model) =>
      model.toJson();

  static List<CarModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => CarModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [CarModel.fromJson(jsonList)];
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
    if (list is List<CarModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarModelToJson(this);
}