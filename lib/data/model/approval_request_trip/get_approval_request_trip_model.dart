/// success : true
/// message : "Success Get Data"
/// data : [{"id":143,"code_document":"SV","id_document":1,"level":3,"id_employee":1,"id_company":1,"id_site":18,"id_matrix":17,"id_approval_auth":4,"approved_by":null,"approved_behalf":null,"rejected_by":null,"is_approved":null,"notes":"tt","code_status_doc":1,"is_request_trip":1,"code_sequence":"RTRIP","created_at":"2023-06-12 13:38:20","created_by":null,"updated_at":"2023-06-12 13:38:20","updated_by":null,"deleted_at":null,"current_level":3,"id_request_trip":123,"no_request_trip":"RTRIP-2023-23-06/044/RTRIP-3000/06/2023","file":"http://103.165.130.157:8086/storage/files/request_trip/UfStk8FTWzNBRNpSDqs6DZd4cbfpp3T1bZaxM0ms.jpg","id_city_to":10,"id_city_from":3,"date_departure":"2023-06-21","date_arrival":"2023-06-23","id_zona":20,"code_status_rtrip":1,"tlk_per_day":"9999","total_tlk":"19998","employee_name":"John Doe","site_name":"Lahat, Kebur x","site_code":"LHT01","zona_name":null,"code_status":1,"status":"Waiting Approval","document_name":"Site Visit"}]

class GetApprovalRequestTripModel {
  GetApprovalRequestTripModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetApprovalRequestTripModel.fromJson(dynamic json) {
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
GetApprovalRequestTripModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetApprovalRequestTripModel(  success: success ?? _success,
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

/// id : 143
/// code_document : "SV"
/// id_document : 1
/// level : 3
/// id_employee : 1
/// id_company : 1
/// id_site : 18
/// id_matrix : 17
/// id_approval_auth : 4
/// approved_by : null
/// approved_behalf : null
/// rejected_by : null
/// is_approved : null
/// notes : "tt"
/// code_status_doc : 1
/// is_request_trip : 1
/// code_sequence : "RTRIP"
/// created_at : "2023-06-12 13:38:20"
/// created_by : null
/// updated_at : "2023-06-12 13:38:20"
/// updated_by : null
/// deleted_at : null
/// current_level : 3
/// id_request_trip : 123
/// no_request_trip : "RTRIP-2023-23-06/044/RTRIP-3000/06/2023"
/// file : "http://103.165.130.157:8086/storage/files/request_trip/UfStk8FTWzNBRNpSDqs6DZd4cbfpp3T1bZaxM0ms.jpg"
/// id_city_to : 10
/// id_city_from : 3
/// date_departure : "2023-06-21"
/// date_arrival : "2023-06-23"
/// id_zona : 20
/// code_status_rtrip : 1
/// tlk_per_day : "9999"
/// total_tlk : "19998"
/// employee_name : "John Doe"
/// site_name : "Lahat, Kebur x"
/// site_code : "LHT01"
/// zona_name : null
/// code_status : 1
/// status : "Waiting Approval"
/// document_name : "Site Visit"

class Data {
  Data({
      num? id, 
      String? codeDocument, 
      num? idDocument, 
      num? level, 
      num? idEmployee, 
      num? idCompany, 
      num? idSite, 
      num? idMatrix, 
      num? idApprovalAuth, 
      dynamic approvedBy, 
      dynamic approvedBehalf, 
      dynamic rejectedBy, 
      dynamic isApproved, 
      String? notes, 
      num? codeStatusDoc, 
      num? isRequestTrip, 
      String? codeSequence, 
      String? createdAt, 
      dynamic createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      dynamic deletedAt, 
      num? currentLevel, 
      num? idRequestTrip, 
      String? noRequestTrip, 
      String? file, 
      num? idCityTo, 
      num? idCityFrom, 
      String? dateDeparture, 
      String? dateArrival, 
      num? idZona, 
      num? codeStatusRtrip, 
      String? tlkPerDay, 
      String? totalTlk, 
      String? employeeName, 
      String? siteName, 
      String? siteCode, 
      dynamic zonaName, 
      num? codeStatus, 
      String? status, 
      String? documentName,}){
    _id = id;
    _codeDocument = codeDocument;
    _idDocument = idDocument;
    _level = level;
    _idEmployee = idEmployee;
    _idCompany = idCompany;
    _idSite = idSite;
    _idMatrix = idMatrix;
    _idApprovalAuth = idApprovalAuth;
    _approvedBy = approvedBy;
    _approvedBehalf = approvedBehalf;
    _rejectedBy = rejectedBy;
    _isApproved = isApproved;
    _notes = notes;
    _codeStatusDoc = codeStatusDoc;
    _isRequestTrip = isRequestTrip;
    _codeSequence = codeSequence;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _deletedAt = deletedAt;
    _currentLevel = currentLevel;
    _idRequestTrip = idRequestTrip;
    _noRequestTrip = noRequestTrip;
    _file = file;
    _idCityTo = idCityTo;
    _idCityFrom = idCityFrom;
    _dateDeparture = dateDeparture;
    _dateArrival = dateArrival;
    _idZona = idZona;
    _codeStatusRtrip = codeStatusRtrip;
    _tlkPerDay = tlkPerDay;
    _totalTlk = totalTlk;
    _employeeName = employeeName;
    _siteName = siteName;
    _siteCode = siteCode;
    _zonaName = zonaName;
    _codeStatus = codeStatus;
    _status = status;
    _documentName = documentName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _codeDocument = json['code_document'];
    _idDocument = json['id_document'];
    _level = json['level'];
    _idEmployee = json['id_employee'];
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
    _idMatrix = json['id_matrix'];
    _idApprovalAuth = json['id_approval_auth'];
    _approvedBy = json['approved_by'];
    _approvedBehalf = json['approved_behalf'];
    _rejectedBy = json['rejected_by'];
    _isApproved = json['is_approved'];
    _notes = json['notes'];
    _codeStatusDoc = json['code_status_doc'];
    _isRequestTrip = json['is_request_trip'];
    _codeSequence = json['code_sequence'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    _currentLevel = json['current_level'];
    _idRequestTrip = json['id_request_trip'];
    _noRequestTrip = json['no_request_trip'];
    _file = json['file'];
    _idCityTo = json['id_city_to'];
    _idCityFrom = json['id_city_from'];
    _dateDeparture = json['date_departure'];
    _dateArrival = json['date_arrival'];
    _idZona = json['id_zona'];
    _codeStatusRtrip = json['code_status_rtrip'];
    _tlkPerDay = json['tlk_per_day'];
    _totalTlk = json['total_tlk'];
    _employeeName = json['employee_name'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _zonaName = json['zona_name'];
    _codeStatus = json['code_status'];
    _status = json['status'];
    _documentName = json['document_name'];
  }
  num? _id;
  String? _codeDocument;
  num? _idDocument;
  num? _level;
  num? _idEmployee;
  num? _idCompany;
  num? _idSite;
  num? _idMatrix;
  num? _idApprovalAuth;
  dynamic _approvedBy;
  dynamic _approvedBehalf;
  dynamic _rejectedBy;
  dynamic _isApproved;
  String? _notes;
  num? _codeStatusDoc;
  num? _isRequestTrip;
  String? _codeSequence;
  String? _createdAt;
  dynamic _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  dynamic _deletedAt;
  num? _currentLevel;
  num? _idRequestTrip;
  String? _noRequestTrip;
  String? _file;
  num? _idCityTo;
  num? _idCityFrom;
  String? _dateDeparture;
  String? _dateArrival;
  num? _idZona;
  num? _codeStatusRtrip;
  String? _tlkPerDay;
  String? _totalTlk;
  String? _employeeName;
  String? _siteName;
  String? _siteCode;
  dynamic _zonaName;
  num? _codeStatus;
  String? _status;
  String? _documentName;
Data copyWith({  num? id,
  String? codeDocument,
  num? idDocument,
  num? level,
  num? idEmployee,
  num? idCompany,
  num? idSite,
  num? idMatrix,
  num? idApprovalAuth,
  dynamic approvedBy,
  dynamic approvedBehalf,
  dynamic rejectedBy,
  dynamic isApproved,
  String? notes,
  num? codeStatusDoc,
  num? isRequestTrip,
  String? codeSequence,
  String? createdAt,
  dynamic createdBy,
  String? updatedAt,
  dynamic updatedBy,
  dynamic deletedAt,
  num? currentLevel,
  num? idRequestTrip,
  String? noRequestTrip,
  String? file,
  num? idCityTo,
  num? idCityFrom,
  String? dateDeparture,
  String? dateArrival,
  num? idZona,
  num? codeStatusRtrip,
  String? tlkPerDay,
  String? totalTlk,
  String? employeeName,
  String? siteName,
  String? siteCode,
  dynamic zonaName,
  num? codeStatus,
  String? status,
  String? documentName,
}) => Data(  id: id ?? _id,
  codeDocument: codeDocument ?? _codeDocument,
  idDocument: idDocument ?? _idDocument,
  level: level ?? _level,
  idEmployee: idEmployee ?? _idEmployee,
  idCompany: idCompany ?? _idCompany,
  idSite: idSite ?? _idSite,
  idMatrix: idMatrix ?? _idMatrix,
  idApprovalAuth: idApprovalAuth ?? _idApprovalAuth,
  approvedBy: approvedBy ?? _approvedBy,
  approvedBehalf: approvedBehalf ?? _approvedBehalf,
  rejectedBy: rejectedBy ?? _rejectedBy,
  isApproved: isApproved ?? _isApproved,
  notes: notes ?? _notes,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  isRequestTrip: isRequestTrip ?? _isRequestTrip,
  codeSequence: codeSequence ?? _codeSequence,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  deletedAt: deletedAt ?? _deletedAt,
  currentLevel: currentLevel ?? _currentLevel,
  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
  file: file ?? _file,
  idCityTo: idCityTo ?? _idCityTo,
  idCityFrom: idCityFrom ?? _idCityFrom,
  dateDeparture: dateDeparture ?? _dateDeparture,
  dateArrival: dateArrival ?? _dateArrival,
  idZona: idZona ?? _idZona,
  codeStatusRtrip: codeStatusRtrip ?? _codeStatusRtrip,
  tlkPerDay: tlkPerDay ?? _tlkPerDay,
  totalTlk: totalTlk ?? _totalTlk,
  employeeName: employeeName ?? _employeeName,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
  zonaName: zonaName ?? _zonaName,
  codeStatus: codeStatus ?? _codeStatus,
  status: status ?? _status,
  documentName: documentName ?? _documentName,
);
  num? get id => _id;
  String? get codeDocument => _codeDocument;
  num? get idDocument => _idDocument;
  num? get level => _level;
  num? get idEmployee => _idEmployee;
  num? get idCompany => _idCompany;
  num? get idSite => _idSite;
  num? get idMatrix => _idMatrix;
  num? get idApprovalAuth => _idApprovalAuth;
  dynamic get approvedBy => _approvedBy;
  dynamic get approvedBehalf => _approvedBehalf;
  dynamic get rejectedBy => _rejectedBy;
  dynamic get isApproved => _isApproved;
  String? get notes => _notes;
  num? get codeStatusDoc => _codeStatusDoc;
  num? get isRequestTrip => _isRequestTrip;
  String? get codeSequence => _codeSequence;
  String? get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  num? get currentLevel => _currentLevel;
  num? get idRequestTrip => _idRequestTrip;
  String? get noRequestTrip => _noRequestTrip;
  String? get file => _file;
  num? get idCityTo => _idCityTo;
  num? get idCityFrom => _idCityFrom;
  String? get dateDeparture => _dateDeparture;
  String? get dateArrival => _dateArrival;
  num? get idZona => _idZona;
  num? get codeStatusRtrip => _codeStatusRtrip;
  String? get tlkPerDay => _tlkPerDay;
  String? get totalTlk => _totalTlk;
  String? get employeeName => _employeeName;
  String? get siteName => _siteName;
  String? get siteCode => _siteCode;
  dynamic get zonaName => _zonaName;
  num? get codeStatus => _codeStatus;
  String? get status => _status;
  String? get documentName => _documentName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code_document'] = _codeDocument;
    map['id_document'] = _idDocument;
    map['level'] = _level;
    map['id_employee'] = _idEmployee;
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    map['id_matrix'] = _idMatrix;
    map['id_approval_auth'] = _idApprovalAuth;
    map['approved_by'] = _approvedBy;
    map['approved_behalf'] = _approvedBehalf;
    map['rejected_by'] = _rejectedBy;
    map['is_approved'] = _isApproved;
    map['notes'] = _notes;
    map['code_status_doc'] = _codeStatusDoc;
    map['is_request_trip'] = _isRequestTrip;
    map['code_sequence'] = _codeSequence;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['deleted_at'] = _deletedAt;
    map['current_level'] = _currentLevel;
    map['id_request_trip'] = _idRequestTrip;
    map['no_request_trip'] = _noRequestTrip;
    map['file'] = _file;
    map['id_city_to'] = _idCityTo;
    map['id_city_from'] = _idCityFrom;
    map['date_departure'] = _dateDeparture;
    map['date_arrival'] = _dateArrival;
    map['id_zona'] = _idZona;
    map['code_status_rtrip'] = _codeStatusRtrip;
    map['tlk_per_day'] = _tlkPerDay;
    map['total_tlk'] = _totalTlk;
    map['employee_name'] = _employeeName;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['zona_name'] = _zonaName;
    map['code_status'] = _codeStatus;
    map['status'] = _status;
    map['document_name'] = _documentName;
    return map;
  }

}