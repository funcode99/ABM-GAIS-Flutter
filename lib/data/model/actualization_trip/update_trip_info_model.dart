class UpdateTripInfoModel {
  UpdateTripInfoModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdateTripInfoModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UpdateTripInfoModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UpdateTripInfoModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
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
      String? idCityFrom, 
      String? idCityTo, 
      num? idZona, 
      num? tlkRate, 
      num? createdBy, 
      num? updatedBy, 
      dynamic deletedAt, 
      String? createdAt, 
      String? updatedAt,}){
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
  }
  String? _id;
  String? _idAct;
  String? _dateDeparture;
  String? _dateArrival;
  String? _idCityFrom;
  String? _idCityTo;
  dynamic _idZona;
  dynamic _tlkRate;
  num? _createdBy;
  num? _updatedBy;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  String? id,
  String? idAct,
  String? dateDeparture,
  String? dateArrival,
  String? idCityFrom,
  String? idCityTo,
  num? idZona,
  num? tlkRate,
  num? createdBy,
  num? updatedBy,
  dynamic deletedAt,
  String? createdAt,
  String? updatedAt,
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
);
  String? get id => _id;
  String? get idAct => _idAct;
  String? get dateDeparture => _dateDeparture;
  String? get dateArrival => _dateArrival;
  String? get idCityFrom => _idCityFrom;
  String? get idCityTo => _idCityTo;
  num? get idZona => _idZona;
  num? get tlkRate => _tlkRate;
  num? get createdBy => _createdBy;
  num? get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

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
    return map;
  }

}