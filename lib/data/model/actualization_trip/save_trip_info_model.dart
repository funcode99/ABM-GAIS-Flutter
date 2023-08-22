class SaveTripInfoModel {
  SaveTripInfoModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveTripInfoModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveTripInfoModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveTripInfoModel(  success: success ?? _success,
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
      String? idAct, 
      String? dateDeparture, 
      String? dateArrival, 
      String? idCityFrom, 
      String? idCityTo, 
      String? idZona, 
      String? tlkRate, 
      num? createdBy, 
      String? id, 
      String? updatedAt, 
      String? createdAt,}){
    _idAct = idAct;
    _dateDeparture = dateDeparture;
    _dateArrival = dateArrival;
    _idCityFrom = idCityFrom;
    _idCityTo = idCityTo;
    _idZona = idZona;
    _tlkRate = tlkRate;
    _createdBy = createdBy;
    _id = id;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _idAct = json['id_act'];
    _dateDeparture = json['date_departure'];
    _dateArrival = json['date_arrival'];
    _idCityFrom = json['id_city_from'];
    _idCityTo = json['id_city_to'];
    _idZona = json['id_zona'];
    _tlkRate = json['tlk_rate'];
    _createdBy = json['created_by'];
    _id = json['id'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }
  String? _idAct;
  String? _dateDeparture;
  String? _dateArrival;
  String? _idCityFrom;
  String? _idCityTo;
  String? _idZona;
  String? _tlkRate;
  num? _createdBy;
  String? _id;
  String? _updatedAt;
  String? _createdAt;
Data copyWith({  String? idAct,
  String? dateDeparture,
  String? dateArrival,
  String? idCityFrom,
  String? idCityTo,
  String? idZona,
  String? tlkRate,
  num? createdBy,
  String? id,
  String? updatedAt,
  String? createdAt,
}) => Data(  idAct: idAct ?? _idAct,
  dateDeparture: dateDeparture ?? _dateDeparture,
  dateArrival: dateArrival ?? _dateArrival,
  idCityFrom: idCityFrom ?? _idCityFrom,
  idCityTo: idCityTo ?? _idCityTo,
  idZona: idZona ?? _idZona,
  tlkRate: tlkRate ?? _tlkRate,
  createdBy: createdBy ?? _createdBy,
  id: id ?? _id,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
);
  String? get idAct => _idAct;
  String? get dateDeparture => _dateDeparture;
  String? get dateArrival => _dateArrival;
  String? get idCityFrom => _idCityFrom;
  String? get idCityTo => _idCityTo;
  String? get idZona => _idZona;
  String? get tlkRate => _tlkRate;
  num? get createdBy => _createdBy;
  String? get id => _id;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_act'] = _idAct;
    map['date_departure'] = _dateDeparture;
    map['date_arrival'] = _dateArrival;
    map['id_city_from'] = _idCityFrom;
    map['id_city_to'] = _idCityTo;
    map['id_zona'] = _idZona;
    map['tlk_rate'] = _tlkRate;
    map['created_by'] = _createdBy;
    map['id'] = _id;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }

}