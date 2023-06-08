/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"code_document":"SV","id_document":112,"level":1,"id_employee":5,"id_company":1,"id_site":38,"id_matrix":17,"id_approval_auth":2,"approved_by":null,"approved_behalf":null,"rejected_by":null,"is_approved":null,"notes":null,"code_status_doc":1,"is_request_trip":1,"code_sequence":"RTRIP","created_at":"2023-06-08 04:53:53","created_by":null,"updated_at":"2023-06-08 04:53:53","updated_by":null,"deleted_at":null,"current_level":1}]

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

/// id : 1
/// code_document : "SV"
/// id_document : 112
/// level : 1
/// id_employee : 5
/// id_company : 1
/// id_site : 38
/// id_matrix : 17
/// id_approval_auth : 2
/// approved_by : null
/// approved_behalf : null
/// rejected_by : null
/// is_approved : null
/// notes : null
/// code_status_doc : 1
/// is_request_trip : 1
/// code_sequence : "RTRIP"
/// created_at : "2023-06-08 04:53:53"
/// created_by : null
/// updated_at : "2023-06-08 04:53:53"
/// updated_by : null
/// deleted_at : null
/// current_level : 1

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
      dynamic notes, 
      num? codeStatusDoc, 
      num? isRequestTrip, 
      String? codeSequence, 
      String? createdAt, 
      dynamic createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      dynamic deletedAt, 
      num? currentLevel,}){
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
  dynamic _notes;
  num? _codeStatusDoc;
  num? _isRequestTrip;
  String? _codeSequence;
  String? _createdAt;
  dynamic _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  dynamic _deletedAt;
  num? _currentLevel;
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
  dynamic notes,
  num? codeStatusDoc,
  num? isRequestTrip,
  String? codeSequence,
  String? createdAt,
  dynamic createdBy,
  String? updatedAt,
  dynamic updatedBy,
  dynamic deletedAt,
  num? currentLevel,
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
  dynamic get notes => _notes;
  num? get codeStatusDoc => _codeStatusDoc;
  num? get isRequestTrip => _isRequestTrip;
  String? get codeSequence => _codeSequence;
  String? get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  num? get currentLevel => _currentLevel;

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
    return map;
  }

}