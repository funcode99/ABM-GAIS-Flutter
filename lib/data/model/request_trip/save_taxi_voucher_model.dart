/// success : true
/// message : "Success Create Menu"
/// data : {"id_request_trip":"1","amount":15000,"account_name":"1","remarks":"1","id_departure_city":"1","id_arrival_city":"1","created_at":"2023-05-13T21:24:08.000000Z","created_by":2,"code_status_doc":"0","updated_at":"2023-05-13T21:24:08.000000Z","id":1}

class SaveTaxiVoucherModel {
  SaveTaxiVoucherModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveTaxiVoucherModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveTaxiVoucherModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveTaxiVoucherModel(  success: success ?? _success,
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

/// id_request_trip : "1"
/// amount : 15000
/// account_name : "1"
/// remarks : "1"
/// id_departure_city : "1"
/// id_arrival_city : "1"
/// created_at : "2023-05-13T21:24:08.000000Z"
/// created_by : 2
/// code_status_doc : "0"
/// updated_at : "2023-05-13T21:24:08.000000Z"
/// id : 1

class Data {
  Data({
      String? idRequestTrip, 
      num? amount, 
      String? accountName, 
      String? remarks, 
      String? idDepartureCity, 
      String? idArrivalCity, 
      String? createdAt, 
      num? createdBy, 
      String? codeStatusDoc,
      String? updatedAt, 
      num? id,}){
    _idRequestTrip = idRequestTrip;
    _amount = amount;
    _accountName = accountName;
    _remarks = remarks;
    _idDepartureCity = idDepartureCity;
    _idArrivalCity = idArrivalCity;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _codeStatusDoc = codeStatusDoc;
    _updatedAt = updatedAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _idRequestTrip = json['id_request_trip'];
    _amount = json['amount'];
    _accountName = json['account_name'];
    _remarks = json['remarks'];
    _idDepartureCity = json['id_departure_city'];
    _idArrivalCity = json['id_arrival_city'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _codeStatusDoc = json['code_status_doc'];
    _updatedAt = json['updated_at'];
    _id = json['id'];
  }
  String? _idRequestTrip;
  num? _amount;
  String? _accountName;
  String? _remarks;
  String? _idDepartureCity;
  String? _idArrivalCity;
  String? _createdAt;
  num? _createdBy;
  String? _codeStatusDoc;
  String? _updatedAt;
  dynamic _id;
Data copyWith({  String? idRequestTrip,
  num? amount,
  String? accountName,
  String? remarks,
  String? idDepartureCity,
  String? idArrivalCity,
  String? createdAt,
  num? createdBy,
  String? codeStatusDoc,
  String? updatedAt,
  num? id,
}) => Data(  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  amount: amount ?? _amount,
  accountName: accountName ?? _accountName,
  remarks: remarks ?? _remarks,
  idDepartureCity: idDepartureCity ?? _idDepartureCity,
  idArrivalCity: idArrivalCity ?? _idArrivalCity,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  updatedAt: updatedAt ?? _updatedAt,
  id: id ?? _id,
);
  String? get idRequestTrip => _idRequestTrip;
  num? get amount => _amount;
  String? get accountName => _accountName;
  String? get remarks => _remarks;
  String? get idDepartureCity => _idDepartureCity;
  String? get idArrivalCity => _idArrivalCity;
  String? get createdAt => _createdAt;
  num? get createdBy => _createdBy;
  String? get codeStatusDoc => _codeStatusDoc;
  String? get updatedAt => _updatedAt;
  dynamic get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_request_trip'] = _idRequestTrip;
    map['amount'] = _amount;
    map['account_name'] = _accountName;
    map['remarks'] = _remarks;
    map['id_departure_city'] = _idDepartureCity;
    map['id_arrival_city'] = _idArrivalCity;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['code_status_doc'] = _codeStatusDoc;
    map['updated_at'] = _updatedAt;
    map['id'] = _id;
    return map;
  }

}