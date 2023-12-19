/// success : true
/// message : "Success Get Data"
/// data : [{"id":9,"id_request_trip":15,"amount":"20000","account_name":"jhon doe","date":"2023-05-23","remarks":null,"id_departure_city":1,"id_arrival_city":1,"code_status_doc":0,"created_at":"2023-05-22 21:20:43","created_by":"2","updated_at":"2023-05-22 21:20:43","updated_by":null,"no_request_trip":"REQ/ABM/123","date_departure":"2023-05-23","date_arrival":"2023-05-23","employee_name":"Jhon Doe","code":0,"status":"Draft","name_departure_city":"Bandung","name_arrival_city":"Bandung"},{"id":7,"id_request_trip":3,"amount":"500000","account_name":"jhon doe","date":"2023-05-21","remarks":null,"id_departure_city":1,"id_arrival_city":2,"code_status_doc":0,"created_at":"2023-05-21 06:02:31","created_by":"2","updated_at":"2023-05-21 06:02:31","updated_by":null,"no_request_trip":"REQ/ABM/123","date_departure":"2023-05-21","date_arrival":"2023-05-21","employee_name":"Jhon Doe","code":0,"status":"Draft","name_departure_city":"Bandung","name_arrival_city":null},{"id":5,"id_request_trip":2,"amount":"500000","account_name":"jhon doe","date":"2023-05-20","remarks":"remarks","id_departure_city":1,"id_arrival_city":2,"code_status_doc":0,"created_at":"2023-05-20 11:36:52","created_by":"2","updated_at":"2023-05-20 12:45:07","updated_by":"2","no_request_trip":"REQ/ABM/123","date_departure":"2023-05-22","date_arrival":"2023-05-23","employee_name":"Jhon Doe","code":0,"status":"Draft","name_departure_city":"Bandung","name_arrival_city":null},{"id":1,"id_request_trip":1,"amount":"15000","account_name":"1","date":"2023-05-20","remarks":"1","id_departure_city":1,"id_arrival_city":1,"code_status_doc":1,"created_at":"2023-05-20 10:28:20","created_by":"2","updated_at":"2023-05-20 11:23:41","updated_by":"2","no_request_trip":"REQ/ABM/123","date_departure":"2023-01-01","date_arrival":"2023-02-01","employee_name":"Jhon Doe","code":1,"status":"Submit","name_departure_city":"Bandung","name_arrival_city":"Bandung"},{"id":4,"id_request_trip":1,"amount":"15000","account_name":"1","date":"2023-05-20","remarks":"1","id_departure_city":1,"id_arrival_city":1,"code_status_doc":1,"created_at":"2023-05-20 11:23:22","created_by":"2","updated_at":"2023-05-20 11:23:22","updated_by":null,"no_request_trip":"REQ/ABM/123","date_departure":"2023-01-01","date_arrival":"2023-02-01","employee_name":"Jhon Doe","code":1,"status":"Submit","name_departure_city":"Bandung","name_arrival_city":"Bandung"},{"id":3,"id_request_trip":1,"amount":"15000","account_name":"1","date":"2023-05-20","remarks":"1","id_departure_city":1,"id_arrival_city":1,"code_status_doc":1,"created_at":"2023-05-20 10:54:20","created_by":"2","updated_at":"2023-05-20 10:54:20","updated_by":null,"no_request_trip":"REQ/ABM/123","date_departure":"2023-01-01","date_arrival":"2023-02-01","employee_name":"Jhon Doe","code":1,"status":"Submit","name_departure_city":"Bandung","name_arrival_city":"Bandung"}]

class GetTaxiVoucherModel {
  GetTaxiVoucherModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetTaxiVoucherModel.fromJson(dynamic json) {
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
GetTaxiVoucherModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetTaxiVoucherModel(  success: success ?? _success,
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

/// id : 9
/// id_request_trip : 15
/// amount : "20000"
/// account_name : "jhon doe"
/// date : "2023-05-23"
/// remarks : null
/// id_departure_city : 1
/// id_arrival_city : 1
/// code_status_doc : 0
/// created_at : "2023-05-22 21:20:43"
/// created_by : "2"
/// updated_at : "2023-05-22 21:20:43"
/// updated_by : null
/// no_request_trip : "REQ/ABM/123"
/// date_departure : "2023-05-23"
/// date_arrival : "2023-05-23"
/// employee_name : "Jhon Doe"
/// code : 0
/// status : "Draft"
/// name_departure_city : "Bandung"
/// name_arrival_city : "Bandung"

class Data {
  Data({
      num? id, 
      num? idRequestTrip, 
      String? amount, 
      String? accountName, 
      String? date, 
      dynamic remarks, 
      num? idDepartureCity, 
      num? idArrivalCity, 
      num? codeStatusDoc, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      String? noRequestTrip, 
      String? dateDeparture, 
      String? dateArrival, 
      String? employeeName, 
      num? code, 
      String? status, 
      String? nameDepartureCity, 
      String? nameArrivalCity,}){
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
    _noRequestTrip = noRequestTrip;
    _dateDeparture = dateDeparture;
    _dateArrival = dateArrival;
    _employeeName = employeeName;
    _code = code;
    _status = status;
    _nameDepartureCity = nameDepartureCity;
    _nameArrivalCity = nameArrivalCity;
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
    _noRequestTrip = json['no_request_trip'];
    _dateDeparture = json['date_departure'];
    _dateArrival = json['date_arrival'];
    _employeeName = json['employee_name'];
    _code = json['code'];
    _status = json['status'];
    _nameDepartureCity = json['name_departure_city'];
    _nameArrivalCity = json['name_arrival_city'];
  }
  dynamic _id;
  dynamic _idRequestTrip;
  String? _amount;
  String? _accountName;
  String? _date;
  dynamic _remarks;
  num? _idDepartureCity;
  num? _idArrivalCity;
  num? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  String? _noRequestTrip;
  String? _dateDeparture;
  String? _dateArrival;
  String? _employeeName;
  num? _code;
  String? _status;
  String? _nameDepartureCity;
  String? _nameArrivalCity;
Data copyWith({  num? id,
  num? idRequestTrip,
  String? amount,
  String? accountName,
  String? date,
  dynamic remarks,
  num? idDepartureCity,
  num? idArrivalCity,
  num? codeStatusDoc,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
  String? noRequestTrip,
  String? dateDeparture,
  String? dateArrival,
  String? employeeName,
  num? code,
  String? status,
  String? nameDepartureCity,
  String? nameArrivalCity,
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
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
  dateDeparture: dateDeparture ?? _dateDeparture,
  dateArrival: dateArrival ?? _dateArrival,
  employeeName: employeeName ?? _employeeName,
  code: code ?? _code,
  status: status ?? _status,
  nameDepartureCity: nameDepartureCity ?? _nameDepartureCity,
  nameArrivalCity: nameArrivalCity ?? _nameArrivalCity,
);
  dynamic get id => _id;
  dynamic get idRequestTrip => _idRequestTrip;
  String? get amount => _amount;
  String? get accountName => _accountName;
  String? get date => _date;
  dynamic get remarks => _remarks;
  num? get idDepartureCity => _idDepartureCity;
  num? get idArrivalCity => _idArrivalCity;
  num? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  String? get noRequestTrip => _noRequestTrip;
  String? get dateDeparture => _dateDeparture;
  String? get dateArrival => _dateArrival;
  String? get employeeName => _employeeName;
  num? get code => _code;
  String? get status => _status;
  String? get nameDepartureCity => _nameDepartureCity;
  String? get nameArrivalCity => _nameArrivalCity;

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
    map['no_request_trip'] = _noRequestTrip;
    map['date_departure'] = _dateDeparture;
    map['date_arrival'] = _dateArrival;
    map['employee_name'] = _employeeName;
    map['code'] = _code;
    map['status'] = _status;
    map['name_departure_city'] = _nameDepartureCity;
    map['name_arrival_city'] = _nameArrivalCity;
    return map;
  }

}