/// success : true
/// message : "Success Create Menu"
/// data : {"id_employee":2,"no_request_trip":"1","code_document":"1","id_site":"1","notes":"1","id_city_from":"1","id_city_to":"1","date_departure":"01-01-2023","date_arrival":"02-01-2023","id_zona":"1","tlk_per_day":100000.12,"total_tlk":600000,"file":"public/files/request_trip/BAOdLu4VHezu2XFJOQGaV4oDwPYI4c8fEjnDOFZz.png","created_at":"2023-05-10T06:38:12.000000Z","created_by":2,"code_status":"0","updated_at":"2023-05-10T06:38:12.000000Z","id":3}

class SavePurposeOfTripModel {
  SavePurposeOfTripModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SavePurposeOfTripModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SavePurposeOfTripModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SavePurposeOfTripModel(  success: success ?? _success,
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

/// id_employee : 2
/// no_request_trip : "1"
/// code_document : "1"
/// id_site : "1"
/// notes : "1"
/// id_city_from : "1"
/// id_city_to : "1"
/// date_departure : "01-01-2023"
/// date_arrival : "02-01-2023"
/// id_zona : "1"
/// tlk_per_day : 100000.12
/// total_tlk : 600000
/// file : "public/files/request_trip/BAOdLu4VHezu2XFJOQGaV4oDwPYI4c8fEjnDOFZz.png"
/// created_at : "2023-05-10T06:38:12.000000Z"
/// created_by : 2
/// code_status : "0"
/// updated_at : "2023-05-10T06:38:12.000000Z"
/// id : 3

class Data {
  Data({
      num? idEmployee, 
      String? noRequestTrip, 
      String? codeDocument, 
      String? idSite, 
      String? notes, 
      String? idCityFrom, 
      String? idCityTo, 
      String? dateDeparture, 
      String? dateArrival, 
      String? idZona, 
      num? tlkPerDay, 
      num? totalTlk, 
      String? file, 
      String? createdAt, 
      num? createdBy, 
      String? codeStatus, 
      String? updatedAt, 
      num? id,}){
    _idEmployee = idEmployee;
    _noRequestTrip = noRequestTrip;
    _codeDocument = codeDocument;
    _idSite = idSite;
    _notes = notes;
    _idCityFrom = idCityFrom;
    _idCityTo = idCityTo;
    _dateDeparture = dateDeparture;
    _dateArrival = dateArrival;
    _idZona = idZona;
    _tlkPerDay = tlkPerDay;
    _totalTlk = totalTlk;
    _file = file;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _codeStatus = codeStatus;
    _updatedAt = updatedAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _idEmployee = json['id_employee'];
    _noRequestTrip = json['no_request_trip'];
    _codeDocument = json['code_document'];
    _idSite = json['id_site'];
    _notes = json['notes'];
    _idCityFrom = json['id_city_from'];
    _idCityTo = json['id_city_to'];
    _dateDeparture = json['date_departure'];
    _dateArrival = json['date_arrival'];
    _idZona = json['id_zona'];
    _tlkPerDay = json['tlk_per_day'];
    _totalTlk = json['total_tlk'];
    _file = json['file'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _codeStatus = json['code_status'];
    _updatedAt = json['updated_at'];
    _id = json['id'];
  }
  num? _idEmployee;
  String? _noRequestTrip;
  String? _codeDocument;
  String? _idSite;
  String? _notes;
  String? _idCityFrom;
  String? _idCityTo;
  String? _dateDeparture;
  String? _dateArrival;
  String? _idZona;
  num? _tlkPerDay;
  num? _totalTlk;
  String? _file;
  String? _createdAt;
  num? _createdBy;
  String? _codeStatus;
  String? _updatedAt;
  num? _id;
Data copyWith({  num? idEmployee,
  String? noRequestTrip,
  String? codeDocument,
  String? idSite,
  String? notes,
  String? idCityFrom,
  String? idCityTo,
  String? dateDeparture,
  String? dateArrival,
  String? idZona,
  num? tlkPerDay,
  num? totalTlk,
  String? file,
  String? createdAt,
  num? createdBy,
  String? codeStatus,
  String? updatedAt,
  num? id,
}) => Data(  idEmployee: idEmployee ?? _idEmployee,
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
  codeDocument: codeDocument ?? _codeDocument,
  idSite: idSite ?? _idSite,
  notes: notes ?? _notes,
  idCityFrom: idCityFrom ?? _idCityFrom,
  idCityTo: idCityTo ?? _idCityTo,
  dateDeparture: dateDeparture ?? _dateDeparture,
  dateArrival: dateArrival ?? _dateArrival,
  idZona: idZona ?? _idZona,
  tlkPerDay: tlkPerDay ?? _tlkPerDay,
  totalTlk: totalTlk ?? _totalTlk,
  file: file ?? _file,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  codeStatus: codeStatus ?? _codeStatus,
  updatedAt: updatedAt ?? _updatedAt,
  id: id ?? _id,
);
  num? get idEmployee => _idEmployee;
  String? get noRequestTrip => _noRequestTrip;
  String? get codeDocument => _codeDocument;
  String? get idSite => _idSite;
  String? get notes => _notes;
  String? get idCityFrom => _idCityFrom;
  String? get idCityTo => _idCityTo;
  String? get dateDeparture => _dateDeparture;
  String? get dateArrival => _dateArrival;
  String? get idZona => _idZona;
  num? get tlkPerDay => _tlkPerDay;
  num? get totalTlk => _totalTlk;
  String? get file => _file;
  String? get createdAt => _createdAt;
  num? get createdBy => _createdBy;
  String? get codeStatus => _codeStatus;
  String? get updatedAt => _updatedAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_employee'] = _idEmployee;
    map['no_request_trip'] = _noRequestTrip;
    map['code_document'] = _codeDocument;
    map['id_site'] = _idSite;
    map['notes'] = _notes;
    map['id_city_from'] = _idCityFrom;
    map['id_city_to'] = _idCityTo;
    map['date_departure'] = _dateDeparture;
    map['date_arrival'] = _dateArrival;
    map['id_zona'] = _idZona;
    map['tlk_per_day'] = _tlkPerDay;
    map['total_tlk'] = _totalTlk;
    map['file'] = _file;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['code_status'] = _codeStatus;
    map['updated_at'] = _updatedAt;
    map['id'] = _id;
    return map;
  }

}