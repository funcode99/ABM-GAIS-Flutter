import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'actualization_trip_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ActualizationTripModel {
  int? no;
  dynamic id;
  String? noAct;
  dynamic idRequestTrip;
  int? totalTlk;
  String? purpose;
  String? notes;
  dynamic codeStatusDoc;
  dynamic createdBy;
  dynamic updatedBy;
  String? deletedAt;
  int? idCompany;
  int? idSite;
  int? idCostCenter;
  int? idDepartement;
  String? createdAt;
  String? updatedAt;
  int? currentLevel;
  dynamic idEmployee;
  String? employeeName;
  String? creator;
  List<dynamic>? noRequestTrip;
  String? status;
  dynamic daysOfTrip;
  dynamic arrayTrip;
  dynamic arrayActivities;

  ActualizationTripModel(
      {
        this.no,
        this.id,
        this.noAct,
        this.idRequestTrip,
        this.totalTlk,
        this.purpose,
        this.notes,
        this.codeStatusDoc,
        this.createdBy,
        this.updatedBy,
        this.deletedAt,
        this.idCompany,
        this.idSite,
        this.idCostCenter,
        this.idDepartement,
        this.createdAt,
        this.updatedAt,
        this.currentLevel,
        this.idEmployee,
        this.employeeName,
        this.creator,
        this.noRequestTrip,
        this.status,
        this.daysOfTrip,
        this.arrayActivities,
        this.arrayTrip,
      });

  static ActualizationTripModel fromJsonModel(Object? json) =>
      ActualizationTripModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(ActualizationTripModel model) =>
      model.toJson();

  static List<ActualizationTripModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => ActualizationTripModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [ActualizationTripModel.fromJson(jsonList)];
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
    if (list is List<ActualizationTripModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory ActualizationTripModel.fromJson(Map<String, dynamic> json) =>
      _$ActualizationTripModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActualizationTripModelToJson(this);

  ActualizationTripModel copyWith({
    int? no,
    dynamic id,
    String? noAct,
    dynamic idRequestTrip,
    int? totalTlk,
    String? purpose,
    String? notes,
    dynamic codeStatusDoc,
    dynamic createdBy,
    dynamic updatedBy,
    String? deletedAt,
    int? idCompany,
    int? idSite,
    int? idCostCenter,
    int? idDepartement,
    String? createdAt,
    String? updatedAt,
    int? currentLevel,
    dynamic idEmployee,
    String? employeeName,
    String? creator,
    List<dynamic>? noRequestTrip,
    String? status,
    dynamic daysOfTrip,
    dynamic arrayTrip,
    dynamic arrayActivities,
  }) {
    return ActualizationTripModel(
      no : no ?? this.no,
      id: id,
      noAct : noAct ?? this.noAct,
      idRequestTrip : idRequestTrip ?? this.idRequestTrip,
      totalTlk : totalTlk ?? this.totalTlk,
      purpose : purpose ?? this.purpose,
      notes : notes ?? this.notes,
      codeStatusDoc : codeStatusDoc ?? this.codeStatusDoc,
      createdBy : createdBy ?? this.createdBy,
      updatedBy : updatedBy ?? this.updatedBy,
      deletedAt : deletedAt ?? this.deletedAt,
      idCompany : idCompany ?? this.idCompany,
      idSite : idSite ?? this.idSite,
      idCostCenter : idCostCenter ?? this.idCostCenter,
      idDepartement : idDepartement ?? this.idDepartement,
      createdAt : createdAt ?? this.createdAt,
      updatedAt : updatedAt ?? this.updatedAt,
      currentLevel : currentLevel ?? this.currentLevel,
      idEmployee : idEmployee ?? this.idEmployee,
      employeeName : employeeName ?? this.employeeName,
      creator : creator ?? this.creator,
      noRequestTrip : noRequestTrip ?? this.noRequestTrip,
      status : status ?? this.status,
      daysOfTrip : daysOfTrip ?? this.daysOfTrip,
      arrayTrip : arrayTrip ?? this.arrayTrip,
      arrayActivities : arrayActivities ?? this.arrayActivities,
    );
  }
}
