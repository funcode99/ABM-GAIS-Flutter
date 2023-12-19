// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripInfoModel _$TripInfoModelFromJson(Map<String, dynamic> json) =>
    TripInfoModel(
      id: json['id'],
      key: json['key'] as String?,
      origin: json['origin'] as String?,
      destination: json['destination'] as String?,
      dateDepartTransportation: json['date_depart_transportation'] as String?,
      dateReturnTransportation: json['date_return_transportation'] as String?,
      sorting: json['sorting'],
      textDate: json['text_date'] as String?,
      noRequestTrip: json['no_request_trip'] as String?,
      idCityFrom: json['id_city_from'],
      idCityTo: json['id_city_to'],
      idZona: json['id_zona'],
      tlkRate: json['tlk_rate'],
      nameCityFrom: json['name_city_from'] as String?,
      nameCityTo: json['name_city_to'] as String?,
      dateDeparture: json['date_departure'] as String?,
      dateArrival: json['date_arrival'] as String?,
      type: json['type'] as String?,
      deletable: json['deletable'] as bool? ?? false,
    );

Map<String, dynamic> _$TripInfoModelToJson(TripInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'origin': instance.origin,
      'destination': instance.destination,
      'date_depart_transportation': instance.dateDepartTransportation,
      'date_return_transportation': instance.dateReturnTransportation,
      'sorting': instance.sorting,
      'text_date': instance.textDate,
      'no_request_trip': instance.noRequestTrip,
      'id_city_from': instance.idCityFrom,
      'id_city_to': instance.idCityTo,
      'id_zona': instance.idZona,
      'tlk_rate': instance.tlkRate,
      'name_city_from': instance.nameCityFrom,
      'name_city_to': instance.nameCityTo,
      'date_departure': instance.dateDeparture,
      'date_arrival': instance.dateArrival,
      'type': instance.type,
      'deletable': instance.deletable,
    };
