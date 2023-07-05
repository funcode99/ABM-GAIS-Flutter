/// success : true
/// message : "Success Create Data"
/// data : {"id_company":"1","id_employee_sender":"1","id_employee_receiver":"1","id_site":"1","subject":"SUB","remarks":null,"attachment":{},"created_at":"2023-07-05 16:33:43","created_by":2,"code_status_doc":0,"no_document_delivery":"2023-07-DOCDL/001/ DOCDL-07-23","m_seq":{"sequence_updated":"updated"}}

class SaveDocumentDeliveryModel {
  SaveDocumentDeliveryModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveDocumentDeliveryModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveDocumentDeliveryModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveDocumentDeliveryModel(  success: success ?? _success,
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

/// id_company : "1"
/// id_employee_sender : "1"
/// id_employee_receiver : "1"
/// id_site : "1"
/// subject : "SUB"
/// remarks : null
/// attachment : {}
/// created_at : "2023-07-05 16:33:43"
/// created_by : 2
/// code_status_doc : 0
/// no_document_delivery : "2023-07-DOCDL/001/ DOCDL-07-23"
/// m_seq : {"sequence_updated":"updated"}

class Data {
  Data({
      String? idCompany, 
      String? idEmployeeSender, 
      String? idEmployeeReceiver, 
      String? idSite, 
      String? subject, 
      dynamic remarks, 
      dynamic attachment, 
      String? createdAt, 
      num? createdBy, 
      num? codeStatusDoc, 
      String? noDocumentDelivery, 
      MSeq? mSeq,}){
    _idCompany = idCompany;
    _idEmployeeSender = idEmployeeSender;
    _idEmployeeReceiver = idEmployeeReceiver;
    _idSite = idSite;
    _subject = subject;
    _remarks = remarks;
    _attachment = attachment;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _codeStatusDoc = codeStatusDoc;
    _noDocumentDelivery = noDocumentDelivery;
    _mSeq = mSeq;
}

  Data.fromJson(dynamic json) {
    _idCompany = json['id_company'];
    _idEmployeeSender = json['id_employee_sender'];
    _idEmployeeReceiver = json['id_employee_receiver'];
    _idSite = json['id_site'];
    _subject = json['subject'];
    _remarks = json['remarks'];
    _attachment = json['attachment'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _codeStatusDoc = json['code_status_doc'];
    _noDocumentDelivery = json['no_document_delivery'];
    _mSeq = json['m_seq'] != null ? MSeq.fromJson(json['m_seq']) : null;
  }
  String? _idCompany;
  String? _idEmployeeSender;
  String? _idEmployeeReceiver;
  String? _idSite;
  String? _subject;
  dynamic _remarks;
  dynamic _attachment;
  String? _createdAt;
  num? _createdBy;
  num? _codeStatusDoc;
  String? _noDocumentDelivery;
  MSeq? _mSeq;
Data copyWith({  String? idCompany,
  String? idEmployeeSender,
  String? idEmployeeReceiver,
  String? idSite,
  String? subject,
  dynamic remarks,
  dynamic attachment,
  String? createdAt,
  num? createdBy,
  num? codeStatusDoc,
  String? noDocumentDelivery,
  MSeq? mSeq,
}) => Data(  idCompany: idCompany ?? _idCompany,
  idEmployeeSender: idEmployeeSender ?? _idEmployeeSender,
  idEmployeeReceiver: idEmployeeReceiver ?? _idEmployeeReceiver,
  idSite: idSite ?? _idSite,
  subject: subject ?? _subject,
  remarks: remarks ?? _remarks,
  attachment: attachment ?? _attachment,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  noDocumentDelivery: noDocumentDelivery ?? _noDocumentDelivery,
  mSeq: mSeq ?? _mSeq,
);
  String? get idCompany => _idCompany;
  String? get idEmployeeSender => _idEmployeeSender;
  String? get idEmployeeReceiver => _idEmployeeReceiver;
  String? get idSite => _idSite;
  String? get subject => _subject;
  dynamic get remarks => _remarks;
  dynamic get attachment => _attachment;
  String? get createdAt => _createdAt;
  num? get createdBy => _createdBy;
  num? get codeStatusDoc => _codeStatusDoc;
  String? get noDocumentDelivery => _noDocumentDelivery;
  MSeq? get mSeq => _mSeq;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_company'] = _idCompany;
    map['id_employee_sender'] = _idEmployeeSender;
    map['id_employee_receiver'] = _idEmployeeReceiver;
    map['id_site'] = _idSite;
    map['subject'] = _subject;
    map['remarks'] = _remarks;
    map['attachment'] = _attachment;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['code_status_doc'] = _codeStatusDoc;
    map['no_document_delivery'] = _noDocumentDelivery;
    if (_mSeq != null) {
      map['m_seq'] = _mSeq?.toJson();
    }
    return map;
  }

}

/// sequence_updated : "updated"

class MSeq {
  MSeq({
      String? sequenceUpdated,}){
    _sequenceUpdated = sequenceUpdated;
}

  MSeq.fromJson(dynamic json) {
    _sequenceUpdated = json['sequence_updated'];
  }
  String? _sequenceUpdated;
MSeq copyWith({  String? sequenceUpdated,
}) => MSeq(  sequenceUpdated: sequenceUpdated ?? _sequenceUpdated,
);
  String? get sequenceUpdated => _sequenceUpdated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sequence_updated'] = _sequenceUpdated;
    return map;
  }

}