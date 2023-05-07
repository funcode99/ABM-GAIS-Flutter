/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"id_employee":1,"no_request_trip":"1","code_document":"1","id_site":1,"notes":"1","file":"1","id_city_from":1,"id_city_to":1,"date_departure":"2023-01-01","date_arrival":"2023-02-01","id_zona":1,"code_status":0,"tlk_per_day":"100000.12","total_tlk":"600000","created_at":"2023-05-04T01:59:22.000000Z","created_by":"1","updated_at":"2023-05-04T01:59:22.000000Z","updated_by":null},{"id":2,"id_employee":1,"no_request_trip":"1","code_document":"1","id_site":1,"notes":"1","file":"1","id_city_from":1,"id_city_to":1,"date_departure":"2023-01-01","date_arrival":"2023-02-01","id_zona":1,"code_status":0,"tlk_per_day":"100000.12","total_tlk":"600000","created_at":"2023-05-04T02:44:49.000000Z","created_by":"1","updated_at":"2023-05-04T02:44:49.000000Z","updated_by":null}]

class RequestTripListModel {
  RequestTripListModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  RequestTripListModel.fromJson(dynamic json) {
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
RequestTripListModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => RequestTripListModel(  success: success ?? _success,
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

/// id : 1
/// id_employee : 1
/// no_request_trip : "1"
/// code_document : "1"
/// id_site : 1
/// notes : "1"
/// file : "1"
/// id_city_from : 1
/// id_city_to : 1
/// date_departure : "2023-01-01"
/// date_arrival : "2023-02-01"
/// id_zona : 1
/// code_status : 0
/// tlk_per_day : "100000.12"
/// total_tlk : "600000"
/// created_at : "2023-05-04T01:59:22.000000Z"
/// created_by : "1"
/// updated_at : "2023-05-04T01:59:22.000000Z"
/// updated_by : null

class Data {
  Data({
      num? id, 
      num? idEmployee, 
      String? noRequestTrip, 
      String? codeDocument, 
      num? idSite, 
      String? notes, 
      String? file, 
      num? idCityFrom, 
      num? idCityTo, 
      String? dateDeparture, 
      String? dateArrival, 
      num? idZona, 
      num? codeStatus, 
      String? tlkPerDay, 
      String? totalTlk, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy,}){
    _id = id;
    _idEmployee = idEmployee;
    _noRequestTrip = noRequestTrip;
    _codeDocument = codeDocument;
    _idSite = idSite;
    _notes = notes;
    _file = file;
    _idCityFrom = idCityFrom;
    _idCityTo = idCityTo;
    _dateDeparture = dateDeparture;
    _dateArrival = dateArrival;
    _idZona = idZona;
    _codeStatus = codeStatus;
    _tlkPerDay = tlkPerDay;
    _totalTlk = totalTlk;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idEmployee = json['id_employee'];
    _noRequestTrip = json['no_request_trip'];
    _codeDocument = json['code_document'];
    _idSite = json['id_site'];
    _notes = json['notes'];
    _file = json['file'];
    _idCityFrom = json['id_city_from'];
    _idCityTo = json['id_city_to'];
    _dateDeparture = json['date_departure'];
    _dateArrival = json['date_arrival'];
    _idZona = json['id_zona'];
    _codeStatus = json['code_status'];
    _tlkPerDay = json['tlk_per_day'];
    _totalTlk = json['total_tlk'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  num? _id;
  num? _idEmployee;
  String? _noRequestTrip;
  String? _codeDocument;
  num? _idSite;
  String? _notes;
  String? _file;
  num? _idCityFrom;
  num? _idCityTo;
  String? _dateDeparture;
  String? _dateArrival;
  num? _idZona;
  num? _codeStatus;
  String? _tlkPerDay;
  String? _totalTlk;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
Data copyWith({  num? id,
  num? idEmployee,
  String? noRequestTrip,
  String? codeDocument,
  num? idSite,
  String? notes,
  String? file,
  num? idCityFrom,
  num? idCityTo,
  String? dateDeparture,
  String? dateArrival,
  num? idZona,
  num? codeStatus,
  String? tlkPerDay,
  String? totalTlk,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
}) => Data(  id: id ?? _id,
  idEmployee: idEmployee ?? _idEmployee,
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
  codeDocument: codeDocument ?? _codeDocument,
  idSite: idSite ?? _idSite,
  notes: notes ?? _notes,
  file: file ?? _file,
  idCityFrom: idCityFrom ?? _idCityFrom,
  idCityTo: idCityTo ?? _idCityTo,
  dateDeparture: dateDeparture ?? _dateDeparture,
  dateArrival: dateArrival ?? _dateArrival,
  idZona: idZona ?? _idZona,
  codeStatus: codeStatus ?? _codeStatus,
  tlkPerDay: tlkPerDay ?? _tlkPerDay,
  totalTlk: totalTlk ?? _totalTlk,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  num? get id => _id;
  num? get idEmployee => _idEmployee;
  String? get noRequestTrip => _noRequestTrip;
  String? get codeDocument => _codeDocument;
  num? get idSite => _idSite;
  String? get notes => _notes;
  String? get file => _file;
  num? get idCityFrom => _idCityFrom;
  num? get idCityTo => _idCityTo;
  String? get dateDeparture => _dateDeparture;
  String? get dateArrival => _dateArrival;
  num? get idZona => _idZona;
  num? get codeStatus => _codeStatus;
  String? get tlkPerDay => _tlkPerDay;
  String? get totalTlk => _totalTlk;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_employee'] = _idEmployee;
    map['no_request_trip'] = _noRequestTrip;
    map['code_document'] = _codeDocument;
    map['id_site'] = _idSite;
    map['notes'] = _notes;
    map['file'] = _file;
    map['id_city_from'] = _idCityFrom;
    map['id_city_to'] = _idCityTo;
    map['date_departure'] = _dateDeparture;
    map['date_arrival'] = _dateArrival;
    map['id_zona'] = _idZona;
    map['code_status'] = _codeStatus;
    map['tlk_per_day'] = _tlkPerDay;
    map['total_tlk'] = _totalTlk;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}