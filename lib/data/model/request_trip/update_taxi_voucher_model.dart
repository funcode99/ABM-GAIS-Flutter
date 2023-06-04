/// success : true
/// message : "Success Update Data"
/// data : {"id":1,"id_request_trip":"1","amount":15000,"account_name":"1","date":"2023-05-20","remarks":"1","id_departure_city":"1","id_arrival_city":"1","code_status_doc":0,"created_at":"2023-05-20T10:28:20.000000Z","created_by":"2","updated_at":"2023-05-20T11:23:41.000000Z","updated_by":2}

class UpdateTaxiVoucherModel {
  UpdateTaxiVoucherModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdateTaxiVoucherModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UpdateTaxiVoucherModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UpdateTaxiVoucherModel(  success: success ?? _success,
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

/// id : 1
/// id_request_trip : "1"
/// amount : 15000
/// account_name : "1"
/// date : "2023-05-20"
/// remarks : "1"
/// id_departure_city : "1"
/// id_arrival_city : "1"
/// code_status_doc : 0
/// created_at : "2023-05-20T10:28:20.000000Z"
/// created_by : "2"
/// updated_at : "2023-05-20T11:23:41.000000Z"
/// updated_by : 2

class Data {
  Data({
      num? id, 
      String? idRequestTrip, 
      num? amount, 
      String? accountName, 
      String? date, 
      String? remarks, 
      String? idDepartureCity, 
      String? idArrivalCity, 
      num? codeStatusDoc, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      num? updatedBy,}){
    _id = id;
    _idRequestTrip = idRequestTrip;
    _amount = amount;
    _accountName = accountName;
    _date = date;
    _remarks = remarks;
    _idDepartureCity = idDepartureCity;
    _idArrivalCity = idArrivalCity;
    _codeStatusDoc = codeStatusDoc;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idRequestTrip = json['id_request_trip'];
    _amount = json['amount'];
    _accountName = json['account_name'];
    _date = json['date'];
    _remarks = json['remarks'];
    _idDepartureCity = json['id_departure_city'];
    _idArrivalCity = json['id_arrival_city'];
    _codeStatusDoc = json['code_status_doc'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  num? _id;
  String? _idRequestTrip;
  num? _amount;
  String? _accountName;
  String? _date;
  String? _remarks;
  String? _idDepartureCity;
  String? _idArrivalCity;
  num? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  num? _updatedBy;
Data copyWith({  num? id,
  String? idRequestTrip,
  num? amount,
  String? accountName,
  String? date,
  String? remarks,
  String? idDepartureCity,
  String? idArrivalCity,
  num? codeStatusDoc,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  num? updatedBy,
}) => Data(  id: id ?? _id,
  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  amount: amount ?? _amount,
  accountName: accountName ?? _accountName,
  date: date ?? _date,
  remarks: remarks ?? _remarks,
  idDepartureCity: idDepartureCity ?? _idDepartureCity,
  idArrivalCity: idArrivalCity ?? _idArrivalCity,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  num? get id => _id;
  String? get idRequestTrip => _idRequestTrip;
  num? get amount => _amount;
  String? get accountName => _accountName;
  String? get date => _date;
  String? get remarks => _remarks;
  String? get idDepartureCity => _idDepartureCity;
  String? get idArrivalCity => _idArrivalCity;
  num? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  num? get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_request_trip'] = _idRequestTrip;
    map['amount'] = _amount;
    map['account_name'] = _accountName;
    map['date'] = _date;
    map['remarks'] = _remarks;
    map['id_departure_city'] = _idDepartureCity;
    map['id_arrival_city'] = _idArrivalCity;
    map['code_status_doc'] = _codeStatusDoc;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}