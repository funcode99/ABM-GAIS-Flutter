/// success : true
/// message : "Success Update Data"
/// data : {"id":81,"id_employee":"1","no_request_trip":"RTRIP-2023-23-06/018/TRV-3000/06/2023","code_document":"1","id_site":"1","notes":"1","file":"http://103.165.130.157:8086/storage/files/request_trip/fVWHzEjbwseSUcU19aGvZXM3aql0lqpP1gwKLM0p.png","id_city_from":"1","id_city_to":"1","date_departure":"01-01-2023","date_arrival":"02-01-2023","id_zona":"1","code_status_doc":0,"tlk_per_day":100000.12,"total_tlk":1,"created_at":"2023-06-02T00:52:44.000000Z","created_by":"2","updated_at":"2023-06-02T10:10:59.000000Z","updated_by":1}

class UpdatePurposeOfTripModel {
  UpdatePurposeOfTripModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdatePurposeOfTripModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UpdatePurposeOfTripModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UpdatePurposeOfTripModel(  success: success ?? _success,
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

/// id : 81
/// id_employee : "1"
/// no_request_trip : "RTRIP-2023-23-06/018/TRV-3000/06/2023"
/// code_document : "1"
/// id_site : "1"
/// notes : "1"
/// file : "http://103.165.130.157:8086/storage/files/request_trip/fVWHzEjbwseSUcU19aGvZXM3aql0lqpP1gwKLM0p.png"
/// id_city_from : "1"
/// id_city_to : "1"
/// date_departure : "01-01-2023"
/// date_arrival : "02-01-2023"
/// id_zona : "1"
/// code_status_doc : 0
/// tlk_per_day : 100000.12
/// total_tlk : 1
/// created_at : "2023-06-02T00:52:44.000000Z"
/// created_by : "2"
/// updated_at : "2023-06-02T10:10:59.000000Z"
/// updated_by : 1

class Data {
  Data({
      num? id, 
      String? idEmployee, 
      String? noRequestTrip, 
      String? codeDocument, 
      String? idSite, 
      String? notes, 
      String? file, 
      String? idCityFrom, 
      String? idCityTo, 
      String? dateDeparture, 
      String? dateArrival, 
      String? idZona, 
      num? codeStatusDoc, 
      num? tlkPerDay, 
      num? totalTlk, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      num? updatedBy,}){
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
    _codeStatusDoc = codeStatusDoc;
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
    _codeStatusDoc = json['code_status_doc'];
    _tlkPerDay = json['tlk_per_day'];
    _totalTlk = json['total_tlk'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  num? _id;
  String? _idEmployee;
  String? _noRequestTrip;
  String? _codeDocument;
  String? _idSite;
  String? _notes;
  String? _file;
  String? _idCityFrom;
  String? _idCityTo;
  String? _dateDeparture;
  String? _dateArrival;
  String? _idZona;
  num? _codeStatusDoc;
  num? _tlkPerDay;
  num? _totalTlk;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  num? _updatedBy;
Data copyWith({  num? id,
  String? idEmployee,
  String? noRequestTrip,
  String? codeDocument,
  String? idSite,
  String? notes,
  String? file,
  String? idCityFrom,
  String? idCityTo,
  String? dateDeparture,
  String? dateArrival,
  String? idZona,
  num? codeStatusDoc,
  num? tlkPerDay,
  num? totalTlk,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  num? updatedBy,
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
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  tlkPerDay: tlkPerDay ?? _tlkPerDay,
  totalTlk: totalTlk ?? _totalTlk,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  num? get id => _id;
  String? get idEmployee => _idEmployee;
  String? get noRequestTrip => _noRequestTrip;
  String? get codeDocument => _codeDocument;
  String? get idSite => _idSite;
  String? get notes => _notes;
  String? get file => _file;
  String? get idCityFrom => _idCityFrom;
  String? get idCityTo => _idCityTo;
  String? get dateDeparture => _dateDeparture;
  String? get dateArrival => _dateArrival;
  String? get idZona => _idZona;
  num? get codeStatusDoc => _codeStatusDoc;
  num? get tlkPerDay => _tlkPerDay;
  num? get totalTlk => _totalTlk;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  num? get updatedBy => _updatedBy;

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
    map['code_status_doc'] = _codeStatusDoc;
    map['tlk_per_day'] = _tlkPerDay;
    map['total_tlk'] = _totalTlk;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}