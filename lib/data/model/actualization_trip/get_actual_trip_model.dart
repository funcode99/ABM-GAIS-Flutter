class GetActualTripModel {
  GetActualTripModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetActualTripModel.fromJson(dynamic json) {
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
GetActualTripModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetActualTripModel(  success: success ?? _success,
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

class Data {
  Data({
      num? no, 
      String? id, 
      String? noAct, 
      String? idRequestTrip, 
      num? totalTlk, 
      String? purpose, 
      String? notes, 
      num? codeStatusDoc, 
      num? createdBy, 
      dynamic updatedBy, 
      dynamic deletedAt, 
      num? idCompany, 
      num? idSite, 
      num? idCostCenter, 
      num? idDepartement, 
      String? createdAt, 
      String? updatedAt, 
      num? currentLevel, 
      num? idEmployee, 
      String? employeeName, 
      String? noRequestTrip, 
      String? status, 
      String? daysOfTrip,}){
    _no = no;
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
    _employeeName = employeeName;
    _noRequestTrip = noRequestTrip;
    _status = status;
    _daysOfTrip = daysOfTrip;
}

  Data.fromJson(dynamic json) {
    _no = json['no'];
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
    _employeeName = json['employee_name'];
    _noRequestTrip = json['no_request_trip'];
    _status = json['status'];
    _daysOfTrip = json['days_of_trip'];
  }
  num? _no;
  String? _id;
  String? _noAct;
  String? _idRequestTrip;
  num? _totalTlk;
  String? _purpose;
  String? _notes;
  num? _codeStatusDoc;
  num? _createdBy;
  dynamic _updatedBy;
  dynamic _deletedAt;
  num? _idCompany;
  num? _idSite;
  num? _idCostCenter;
  num? _idDepartement;
  String? _createdAt;
  String? _updatedAt;
  num? _currentLevel;
  num? _idEmployee;
  String? _employeeName;
  String? _noRequestTrip;
  String? _status;
  String? _daysOfTrip;
Data copyWith({  num? no,
  String? id,
  String? noAct,
  String? idRequestTrip,
  num? totalTlk,
  String? purpose,
  String? notes,
  num? codeStatusDoc,
  num? createdBy,
  dynamic updatedBy,
  dynamic deletedAt,
  num? idCompany,
  num? idSite,
  num? idCostCenter,
  num? idDepartement,
  String? createdAt,
  String? updatedAt,
  num? currentLevel,
  num? idEmployee,
  String? employeeName,
  String? noRequestTrip,
  String? status,
  String? daysOfTrip,
}) => Data(  no: no ?? _no,
  id: id ?? _id,
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
  employeeName: employeeName ?? _employeeName,
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
  status: status ?? _status,
  daysOfTrip: daysOfTrip ?? _daysOfTrip,
);
  num? get no => _no;
  String? get id => _id;
  String? get noAct => _noAct;
  String? get idRequestTrip => _idRequestTrip;
  num? get totalTlk => _totalTlk;
  String? get purpose => _purpose;
  String? get notes => _notes;
  num? get codeStatusDoc => _codeStatusDoc;
  num? get createdBy => _createdBy;
  dynamic get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  num? get idCompany => _idCompany;
  num? get idSite => _idSite;
  num? get idCostCenter => _idCostCenter;
  num? get idDepartement => _idDepartement;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get currentLevel => _currentLevel;
  num? get idEmployee => _idEmployee;
  String? get employeeName => _employeeName;
  String? get noRequestTrip => _noRequestTrip;
  String? get status => _status;
  String? get daysOfTrip => _daysOfTrip;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no'] = _no;
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
    map['employee_name'] = _employeeName;
    map['no_request_trip'] = _noRequestTrip;
    map['status'] = _status;
    map['days_of_trip'] = _daysOfTrip;
    return map;
  }

}