class UpdateActualTripModel {
  UpdateActualTripModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdateActualTripModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UpdateActualTripModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UpdateActualTripModel(  success: success ?? _success,
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
      String? noAct, 
      String? idRequestTrip, 
      String? totalTlk, 
      String? purpose, 
      String? notes, 
      num? codeStatusDoc, 
      num? createdBy, 
      num? updatedBy, 
      dynamic deletedAt, 
      num? idCompany, 
      num? idSite, 
      num? idCostCenter, 
      num? idDepartement, 
      String? createdAt, 
      String? updatedAt, 
      dynamic currentLevel, 
      num? idEmployee,}){
    _id = id;
    _noAct = noAct;
    _idRequestTrip = idRequestTrip;
    _totalTlk = totalTlk;
    _purpose = purpose;
    _notes = notes;
    _codeStatusDoc = codeStatusDoc;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _deletedAt = deletedAt;
    _idCompany = idCompany;
    _idSite = idSite;
    _idCostCenter = idCostCenter;
    _idDepartement = idDepartement;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _currentLevel = currentLevel;
    _idEmployee = idEmployee;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _noAct = json['no_act'];
    _idRequestTrip = json['id_request_trip'];
    _totalTlk = json['total_tlk'];
    _purpose = json['purpose'];
    _notes = json['notes'];
    _codeStatusDoc = json['code_status_doc'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
    _idCostCenter = json['id_cost_center'];
    _idDepartement = json['id_departement'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _currentLevel = json['current_level'];
    _idEmployee = json['id_employee'];
  }
  String? _id;
  String? _noAct;
  String? _idRequestTrip;
  String? _totalTlk;
  String? _purpose;
  String? _notes;
  num? _codeStatusDoc;
  num? _createdBy;
  num? _updatedBy;
  dynamic _deletedAt;
  num? _idCompany;
  num? _idSite;
  num? _idCostCenter;
  num? _idDepartement;
  String? _createdAt;
  String? _updatedAt;
  dynamic _currentLevel;
  num? _idEmployee;
Data copyWith({  String? id,
  String? noAct,
  String? idRequestTrip,
  String? totalTlk,
  String? purpose,
  String? notes,
  num? codeStatusDoc,
  num? createdBy,
  num? updatedBy,
  dynamic deletedAt,
  num? idCompany,
  num? idSite,
  num? idCostCenter,
  num? idDepartement,
  String? createdAt,
  String? updatedAt,
  dynamic currentLevel,
  num? idEmployee,
}) => Data(  id: id ?? _id,
  noAct: noAct ?? _noAct,
  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  totalTlk: totalTlk ?? _totalTlk,
  purpose: purpose ?? _purpose,
  notes: notes ?? _notes,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  createdBy: createdBy ?? _createdBy,
  updatedBy: updatedBy ?? _updatedBy,
  deletedAt: deletedAt ?? _deletedAt,
  idCompany: idCompany ?? _idCompany,
  idSite: idSite ?? _idSite,
  idCostCenter: idCostCenter ?? _idCostCenter,
  idDepartement: idDepartement ?? _idDepartement,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  currentLevel: currentLevel ?? _currentLevel,
  idEmployee: idEmployee ?? _idEmployee,
);
  String? get id => _id;
  String? get noAct => _noAct;
  String? get idRequestTrip => _idRequestTrip;
  String? get totalTlk => _totalTlk;
  String? get purpose => _purpose;
  String? get notes => _notes;
  num? get codeStatusDoc => _codeStatusDoc;
  num? get createdBy => _createdBy;
  num? get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  num? get idCompany => _idCompany;
  num? get idSite => _idSite;
  num? get idCostCenter => _idCostCenter;
  num? get idDepartement => _idDepartement;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get currentLevel => _currentLevel;
  num? get idEmployee => _idEmployee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['no_act'] = _noAct;
    map['id_request_trip'] = _idRequestTrip;
    map['total_tlk'] = _totalTlk;
    map['purpose'] = _purpose;
    map['notes'] = _notes;
    map['code_status_doc'] = _codeStatusDoc;
    map['created_by'] = _createdBy;
    map['updated_by'] = _updatedBy;
    map['deleted_at'] = _deletedAt;
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    map['id_cost_center'] = _idCostCenter;
    map['id_departement'] = _idDepartement;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['current_level'] = _currentLevel;
    map['id_employee'] = _idEmployee;
    return map;
  }

}