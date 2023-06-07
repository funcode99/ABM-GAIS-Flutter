/// success : true
/// message : "Success Update Data"
/// data : {"id":23,"id_company":"1","id_employee_sender":"1","id_employee_receiver":"1","id_site":"1","subject":"SUB","attachment":{},"remarks":"note","code_status_doc":"2","created_at":"2023-06-07T08:18:28.000000Z","created_by":"1","updated_at":"2023-06-07T09:43:33.000000Z","updated_by":2}

class UpdateDocumentDeliveryModel {
  UpdateDocumentDeliveryModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdateDocumentDeliveryModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UpdateDocumentDeliveryModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UpdateDocumentDeliveryModel(  success: success ?? _success,
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

/// id : 23
/// id_company : "1"
/// id_employee_sender : "1"
/// id_employee_receiver : "1"
/// id_site : "1"
/// subject : "SUB"
/// attachment : {}
/// remarks : "note"
/// code_status_doc : "2"
/// created_at : "2023-06-07T08:18:28.000000Z"
/// created_by : "1"
/// updated_at : "2023-06-07T09:43:33.000000Z"
/// updated_by : 2

class Data {
  Data({
      num? id, 
      String? idCompany, 
      String? idEmployeeSender, 
      String? idEmployeeReceiver, 
      String? idSite, 
      String? subject, 
      dynamic attachment, 
      String? remarks, 
      String? codeStatusDoc, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      num? updatedBy,}){
    _id = id;
    _idCompany = idCompany;
    _idEmployeeSender = idEmployeeSender;
    _idEmployeeReceiver = idEmployeeReceiver;
    _idSite = idSite;
    _subject = subject;
    _attachment = attachment;
    _remarks = remarks;
    _codeStatusDoc = codeStatusDoc;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idCompany = json['id_company'];
    _idEmployeeSender = json['id_employee_sender'];
    _idEmployeeReceiver = json['id_employee_receiver'];
    _idSite = json['id_site'];
    _subject = json['subject'];
    _attachment = json['attachment'];
    _remarks = json['remarks'];
    _codeStatusDoc = json['code_status_doc'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  num? _id;
  String? _idCompany;
  String? _idEmployeeSender;
  String? _idEmployeeReceiver;
  String? _idSite;
  String? _subject;
  dynamic _attachment;
  String? _remarks;
  String? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  num? _updatedBy;
Data copyWith({  num? id,
  String? idCompany,
  String? idEmployeeSender,
  String? idEmployeeReceiver,
  String? idSite,
  String? subject,
  dynamic attachment,
  String? remarks,
  String? codeStatusDoc,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  num? updatedBy,
}) => Data(  id: id ?? _id,
  idCompany: idCompany ?? _idCompany,
  idEmployeeSender: idEmployeeSender ?? _idEmployeeSender,
  idEmployeeReceiver: idEmployeeReceiver ?? _idEmployeeReceiver,
  idSite: idSite ?? _idSite,
  subject: subject ?? _subject,
  attachment: attachment ?? _attachment,
  remarks: remarks ?? _remarks,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  num? get id => _id;
  String? get idCompany => _idCompany;
  String? get idEmployeeSender => _idEmployeeSender;
  String? get idEmployeeReceiver => _idEmployeeReceiver;
  String? get idSite => _idSite;
  String? get subject => _subject;
  dynamic get attachment => _attachment;
  String? get remarks => _remarks;
  String? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  num? get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_company'] = _idCompany;
    map['id_employee_sender'] = _idEmployeeSender;
    map['id_employee_receiver'] = _idEmployeeReceiver;
    map['id_site'] = _idSite;
    map['subject'] = _subject;
    map['attachment'] = _attachment;
    map['remarks'] = _remarks;
    map['code_status_doc'] = _codeStatusDoc;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}