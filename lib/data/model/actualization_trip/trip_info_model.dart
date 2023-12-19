import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TripInfoModel {
  dynamic id;
  String? key;
  String? origin;
  String? destination;
  String? dateDepartTransportation;
  String? dateReturnTransportation;
  dynamic sorting;
  String? textDate;
  String? noRequestTrip;
  dynamic idCityFrom;
  dynamic idCityTo;
  dynamic idZona;
  dynamic tlkRate;
  String? nameCityFrom;
  String? nameCityTo;
  String? dateDeparture;
  String? dateArrival;
  String? type;
  bool deletable;

  TripInfoModel(
      {
        this.id,
        this.key,
        this.origin,
        this.destination,
        this.dateDepartTransportation,
        this.dateReturnTransportation,
        this.sorting,
        this.textDate,
        this.noRequestTrip,
        this.idCityFrom,
        this.idCityTo,
        this.idZona,
        this.tlkRate,
        this.nameCityFrom,
        this.nameCityTo,
        this.dateDeparture,
        this.dateArrival,
        this.type,
        this.deletable = false
      });

  static TripInfoModel fromJsonModel(Object? json) =>
      TripInfoModel.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic> toJsonModel(TripInfoModel model) =>
      model.toJson();

  static List<TripInfoModel> fromJsonModelList(Object? jsonList) {
    if (jsonList == null) return [];

    if (jsonList is List) {
      return jsonList.map((json) => TripInfoModel.fromJson(json)).toList();
    }

    // We shouldn't be here
    if (jsonList is Map<String, dynamic>) {
      return [TripInfoModel.fromJson(jsonList)];
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
    if (list is List<TripInfoModel>) {
      return list.map((item) => item.toJson()).toList();
    }
    return [];
  }

  factory TripInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TripInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TripInfoModelToJson(this);

  TripInfoModel copyWith({
    String? key,
    String? origin,
    String? destination,
    String? dateDepartTransportation,
    String? dateReturnTransportation,
    dynamic sorting,
    String? textDate,
    String? noRequestTrip,
    dynamic idCityFrom,
    dynamic idCityTo,
    dynamic idZona,
    dynamic tlkRate,
    String? nameCityFrom,
    String? nameCityTo,
    String? dateDeparture,
    String? dateArrival,
    String? type,
    bool? deletable,
  }) {
    return TripInfoModel(
        key : key ?? this.key,
        origin : origin ?? this.origin,
        destination : destination ?? this.destination,
        dateDepartTransportation : dateDepartTransportation ?? this.dateDepartTransportation,
        dateReturnTransportation : dateReturnTransportation ?? this.dateReturnTransportation,
        sorting : sorting ?? this.sorting,
        textDate : textDate ?? this.textDate,
        noRequestTrip : noRequestTrip ?? this.noRequestTrip,
        idCityFrom : idCityFrom ?? this.idCityFrom,
        idCityTo : idCityTo ?? this.idCityTo,
        idZona : idZona ?? this.idZona,
        tlkRate : tlkRate ?? this.tlkRate,
        dateDeparture : dateDeparture ?? this.dateDeparture,
        dateArrival : dateArrival ?? this.dateArrival,
        type : type ?? this.type,
        deletable : deletable ?? this.deletable,
        nameCityFrom : nameCityFrom ?? this.nameCityFrom,
        nameCityTo : nameCityTo ?? this.nameCityTo,
        id: id
    );
  }
}
