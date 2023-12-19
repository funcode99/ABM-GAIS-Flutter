class GetTripInfoByactualidModel {
  GetTripInfoByactualidModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetTripInfoByactualidModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<Data>? _data;
GetTripInfoByactualidModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetTripInfoByactualidModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      String? id, 
      String? idAct, 
      String? dateDeparture, 
      String? dateArrival, 
      num? idCityFrom, 
      num? idCityTo, 
      num? idZona, 
      num? tlkRate, 
      num? createdBy, 
      dynamic updatedBy, 
      dynamic deletedAt, 
      String? createdAt, 
      String? updatedAt, 
      String? zonaName, 
      String? nameCityFrom, 
      String? nameCityTo,}){
    _id = id;
    _idAct = idAct;
    _dateDeparture = dateDeparture;
    _dateArrival = dateArrival;
    _idCityFrom = idCityFrom;
    _idCityTo = idCityTo;
    _idZona = idZona;
    _tlkRate = tlkRate;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _zonaName = zonaName;
    _nameCityFrom = nameCityFrom;
    _nameCityTo = nameCityTo;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idAct = json['id_act'];
    _dateDeparture = json['date_departure'];
    _dateArrival = json['date_arrival'];
    _idCityFrom = json['id_city_from'];
    _idCityTo = json['id_city_to'];
    _idZona = json['id_zona'];
    _tlkRate = json['tlk_rate'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _zonaName = json['zona_name'];
    _nameCityFrom = json['name_city_from'];
    _nameCityTo = json['name_city_to'];
  }
  String? _id;
  String? _idAct;
  String? _dateDeparture;
  String? _dateArrival;
  num? _idCityFrom;
  num? _idCityTo;
  num? _idZona;
  num? _tlkRate;
  num? _createdBy;
  dynamic _updatedBy;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  String? _zonaName;
  String? _nameCityFrom;
  String? _nameCityTo;
Data copyWith({  String? id,
  String? idAct,
  String? dateDeparture,
  String? dateArrival,
  num? idCityFrom,
  num? idCityTo,
  num? idZona,
  num? tlkRate,
  num? createdBy,
  dynamic updatedBy,
  dynamic deletedAt,
  String? createdAt,
  String? updatedAt,
  String? zonaName,
  String? nameCityFrom,
  String? nameCityTo,
}) => Data(  id: id ?? _id,
  idAct: idAct ?? _idAct,
  dateDeparture: dateDeparture ?? _dateDeparture,
  dateArrival: dateArrival ?? _dateArrival,
  idCityFrom: idCityFrom ?? _idCityFrom,
  idCityTo: idCityTo ?? _idCityTo,
  idZona: idZona ?? _idZona,
  tlkRate: tlkRate ?? _tlkRate,
  createdBy: createdBy ?? _createdBy,
  updatedBy: updatedBy ?? _updatedBy,
  deletedAt: deletedAt ?? _deletedAt,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  zonaName: zonaName ?? _zonaName,
  nameCityFrom: nameCityFrom ?? _nameCityFrom,
  nameCityTo: nameCityTo ?? _nameCityTo,
);
  String? get id => _id;
  String? get idAct => _idAct;
  String? get dateDeparture => _dateDeparture;
  String? get dateArrival => _dateArrival;
  num? get idCityFrom => _idCityFrom;
  num? get idCityTo => _idCityTo;
  num? get idZona => _idZona;
  num? get tlkRate => _tlkRate;
  num? get createdBy => _createdBy;
  dynamic get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get zonaName => _zonaName;
  String? get nameCityFrom => _nameCityFrom;
  String? get nameCityTo => _nameCityTo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_act'] = _idAct;
    map['date_departure'] = _dateDeparture;
    map['date_arrival'] = _dateArrival;
    map['id_city_from'] = _idCityFrom;
    map['id_city_to'] = _idCityTo;
    map['id_zona'] = _idZona;
    map['tlk_rate'] = _tlkRate;
    map['created_by'] = _createdBy;
    map['updated_by'] = _updatedBy;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['zona_name'] = _zonaName;
    map['name_city_from'] = _nameCityFrom;
    map['name_city_to'] = _nameCityTo;
    return map;
  }

}