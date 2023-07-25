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

class Data {
  Data({
      String? idEmployee, 
      String? codeDocument, 
      String? idSite, 
      String? notes, 
      String? idCityFrom, 
      String? idCityTo, 
      String? dateDeparture, 
      String? dateArrival, 
      String? idZona, 
      double? tlkPerDay, 
      int? totalTlk, 
      int? idCompany, 
      int? idDepartement, 
      int? idCostCenter, 
      String? createdAt, 
      int? createdBy, 
      String? noRequestTrip, 
      String? codeStatusDoc, 
      String? id, 
      String? updatedAt,}){
    _idEmployee = idEmployee;
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
    _idCompany = idCompany;
    _idDepartement = idDepartement;
    _idCostCenter = idCostCenter;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _noRequestTrip = noRequestTrip;
    _codeStatusDoc = codeStatusDoc;
    _id = id;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _idEmployee = json['id_employee'];
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
    _idCompany = json['id_company'];
    _idDepartement = json['id_departement'];
    _idCostCenter = json['id_cost_center'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _noRequestTrip = json['no_request_trip'];
    _codeStatusDoc = json['code_status_doc'];
    _id = json['id'];
    _updatedAt = json['updated_at'];
  }
  String? _idEmployee;
  String? _codeDocument;
  String? _idSite;
  String? _notes;
  String? _idCityFrom;
  String? _idCityTo;
  String? _dateDeparture;
  String? _dateArrival;
  String? _idZona;
  dynamic _tlkPerDay;
  int? _totalTlk;
  int? _idCompany;
  int? _idDepartement;
  int? _idCostCenter;
  String? _createdAt;
  int? _createdBy;
  String? _noRequestTrip;
  String? _codeStatusDoc;
  String? _id;
  String? _updatedAt;
Data copyWith({  String? idEmployee,
  String? codeDocument,
  String? idSite,
  String? notes,
  String? idCityFrom,
  String? idCityTo,
  String? dateDeparture,
  String? dateArrival,
  String? idZona,
  double? tlkPerDay,
  int? totalTlk,
  int? idCompany,
  int? idDepartement,
  int? idCostCenter,
  String? createdAt,
  int? createdBy,
  String? noRequestTrip,
  String? codeStatusDoc,
  String? id,
  String? updatedAt,
}) => Data(  idEmployee: idEmployee ?? _idEmployee,
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
  idCompany: idCompany ?? _idCompany,
  idDepartement: idDepartement ?? _idDepartement,
  idCostCenter: idCostCenter ?? _idCostCenter,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  id: id ?? _id,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get idEmployee => _idEmployee;
  String? get codeDocument => _codeDocument;
  String? get idSite => _idSite;
  String? get notes => _notes;
  String? get idCityFrom => _idCityFrom;
  String? get idCityTo => _idCityTo;
  String? get dateDeparture => _dateDeparture;
  String? get dateArrival => _dateArrival;
  String? get idZona => _idZona;
  double? get tlkPerDay => _tlkPerDay;
  int? get totalTlk => _totalTlk;
  int? get idCompany => _idCompany;
  int? get idDepartement => _idDepartement;
  int? get idCostCenter => _idCostCenter;
  String? get createdAt => _createdAt;
  int? get createdBy => _createdBy;
  String? get noRequestTrip => _noRequestTrip;
  String? get codeStatusDoc => _codeStatusDoc;
  String? get id => _id;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_employee'] = _idEmployee;
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
    map['id_company'] = _idCompany;
    map['id_departement'] = _idDepartement;
    map['id_cost_center'] = _idCostCenter;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['no_request_trip'] = _noRequestTrip;
    map['code_status_doc'] = _codeStatusDoc;
    map['id'] = _id;
    map['updated_at'] = _updatedAt;
    return map;
  }

}