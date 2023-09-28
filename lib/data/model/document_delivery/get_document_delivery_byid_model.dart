/// success : true
/// message : "Success Get Data"
/// data : [{"id":32,"id_company":1,"id_employee_sender":1,"id_employee_receiver":37,"id_site":18,"subject":"tes 21","attachment":"http://38.47.76.138:8013/storage/files/document_delivery/p75naN9kV12IjYkl99VSkzUw8cVHOjbPQMoEZkG3.pdf","remarks":"cek remarks21","code_status_doc":0,"created_at":"2023-07-09 23:47:59","created_by":"2","updated_at":"2023-07-10 00:08:35","updated_by":"2","deleted_at":null,"no_document_delivery":"2023-07-DOCDL/010/ DOCDL-07-23","id_company_receiver":1,"id_site_receiver":44,"sender_name":"John Doe","receiver_name":"Eka Sherry","name_company_sender":"PT Cipta Kridatama","code_company_sender":"3000","name_site_sender":"Lahat, Kebur x","code_site_sender":"LHT01","name_company_receiver":"PT Cipta Kridatama","code_company_receiver":"3000","name_site_receiver":"Jakarta, Cilandak","code_site_receiver":"KYB01","code_document":"DOCDL","status":"Created"}]

class GetDocumentDeliveryByidModel {
  GetDocumentDeliveryByidModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetDocumentDeliveryByidModel.fromJson(dynamic json) {
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
GetDocumentDeliveryByidModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetDocumentDeliveryByidModel(  success: success ?? _success,
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

/// id : 32
/// id_company : 1
/// id_employee_sender : 1
/// id_employee_receiver : 37
/// id_site : 18
/// subject : "tes 21"
/// attachment : "http://38.47.76.138:8013/storage/files/document_delivery/p75naN9kV12IjYkl99VSkzUw8cVHOjbPQMoEZkG3.pdf"
/// remarks : "cek remarks21"
/// code_status_doc : 0
/// created_at : "2023-07-09 23:47:59"
/// created_by : "2"
/// updated_at : "2023-07-10 00:08:35"
/// updated_by : "2"
/// deleted_at : null
/// no_document_delivery : "2023-07-DOCDL/010/ DOCDL-07-23"
/// id_company_receiver : 1
/// id_site_receiver : 44
/// sender_name : "John Doe"
/// receiver_name : "Eka Sherry"
/// name_company_sender : "PT Cipta Kridatama"
/// code_company_sender : "3000"
/// name_site_sender : "Lahat, Kebur x"
/// code_site_sender : "LHT01"
/// name_company_receiver : "PT Cipta Kridatama"
/// code_company_receiver : "3000"
/// name_site_receiver : "Jakarta, Cilandak"
/// code_site_receiver : "KYB01"
/// code_document : "DOCDL"
/// status : "Created"

class Data {
  Data({
      num? id, 
      num? idCompany, 
      num? idEmployeeSender, 
      num? idEmployeeReceiver, 
      num? idSite, 
      String? subject, 
      String? attachment, 
      String? remarks, 
      num? codeStatusDoc, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      String? updatedBy, 
      dynamic deletedAt, 
      String? noDocumentDelivery, 
      num? idCompanyReceiver, 
      num? idSiteReceiver,
      String? nameCreated,
      String? nameUpdated,
      String? nameReceived,
      String? nameDelivering,
      String? nameDelivered,
      String? nameCancelled,
      String? receivedAt,
      String? deliveringAt,
      String? deliveredAt,
      String? cancelledAt,
      String? senderName,
      String? receiverName,
      String? nameCompanySender, 
      String? codeCompanySender, 
      String? nameSiteSender, 
      String? codeSiteSender, 
      String? nameCompanyReceiver, 
      String? codeCompanyReceiver, 
      String? nameSiteReceiver, 
      String? codeSiteReceiver, 
      String? codeDocument, 
      String? status,}){
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
    _deletedAt = deletedAt;
    _noDocumentDelivery = noDocumentDelivery;
    _idCompanyReceiver = idCompanyReceiver;
    _idSiteReceiver = idSiteReceiver;
    _nameCreated = nameCreated;
    _nameUpdated = nameUpdated;
    _nameReceived = nameReceived;
    _nameDelivering = nameDelivering;
    _nameDelivered = nameDelivered;
    _nameCancelled = nameCancelled;
    _receivedAt = receivedAt;
    _deliveringAt = deliveringAt;
    _deliveredAt = deliveredAt;
    _cancelledAt = cancelledAt;
    _senderName = senderName;
    _receiverName = receiverName;
    _nameCompanySender = nameCompanySender;
    _codeCompanySender = codeCompanySender;
    _nameSiteSender = nameSiteSender;
    _codeSiteSender = codeSiteSender;
    _nameCompanyReceiver = nameCompanyReceiver;
    _codeCompanyReceiver = codeCompanyReceiver;
    _nameSiteReceiver = nameSiteReceiver;
    _codeSiteReceiver = codeSiteReceiver;
    _codeDocument = codeDocument;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idCompany = json['id_company'];
    _idEmployeeSender = json['id_employee_sender'];
    _idEmployeeReceiver = json['id_employee_receiver'];
    _idSite = json['id_site'];
    _subject = json['subject'];
    _attachment = json['attachment'].toString();
    _remarks = json['remarks'];
    _codeStatusDoc = json['code_status_doc'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    _noDocumentDelivery = json['no_document_delivery'];
    _idCompanyReceiver = json['id_company_receiver'];
    _idSiteReceiver = json['id_site_receiver'];
    _nameCreated = json['name_created'];
    _nameUpdated = json['name_updated'];
    _nameReceived = json['name_received'];
    _nameDelivering = json['name_delivering'];
    _nameDelivered = json['name_delivered'];
    _nameCancelled = json['name_cancelled'];
    _receivedAt = json['received_at'];
    _deliveringAt = json['delivering_at'];
    _deliveredAt = json['delivered_at'];
    _cancelledAt = json['cancelled_at'];
    _senderName = json['sender_name'];
    _receiverName = json['receiver_name'];
    _nameCompanySender = json['name_company_sender'];
    _codeCompanySender = json['code_company_sender'];
    _nameSiteSender = json['name_site_sender'];
    _codeSiteSender = json['code_site_sender'];
    _nameCompanyReceiver = json['name_company_receiver'];
    _codeCompanyReceiver = json['code_company_receiver'];
    _nameSiteReceiver = json['name_site_receiver'];
    _codeSiteReceiver = json['code_site_receiver'];
    _codeDocument = json['code_document'];
    _status = json['status'];
  }
  dynamic _id;
  num? _idCompany;
  num? _idEmployeeSender;
  num? _idEmployeeReceiver;
  num? _idSite;
  String? _subject;
  String? _attachment;
  String? _remarks;
  num? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  String? _updatedBy;
  dynamic _deletedAt;
  String? _noDocumentDelivery;
  num? _idCompanyReceiver;
  num? _idSiteReceiver;
  String? _nameCreated;
  String? _nameUpdated;
  String? _nameReceived;
  String? _nameDelivering;
  String? _nameDelivered;
  String? _nameCancelled;
  String? _receivedAt;
  String? _deliveringAt;
  String? _deliveredAt;
  String? _cancelledAt;
  String? _senderName;
  String? _receiverName;
  String? _nameCompanySender;
  String? _codeCompanySender;
  String? _nameSiteSender;
  String? _codeSiteSender;
  String? _nameCompanyReceiver;
  String? _codeCompanyReceiver;
  String? _nameSiteReceiver;
  String? _codeSiteReceiver;
  String? _codeDocument;
  String? _status;
Data copyWith({  num? id,
  num? idCompany,
  num? idEmployeeSender,
  num? idEmployeeReceiver,
  num? idSite,
  String? subject,
  String? attachment,
  String? remarks,
  num? codeStatusDoc,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  String? updatedBy,
  dynamic deletedAt,
  String? noDocumentDelivery,
  num? idCompanyReceiver,
  num? idSiteReceiver,
  String? nameCreated,
  String? nameUpdated,
  String? nameReceived,
  String? nameDelivering,
  String? nameDelivered,
  String? nameCancelled,
  String? receivedAt,
  String? deliveringAt,
  String? deliveredAt,
  String? cancelledAt,
  String? senderName,
  String? receiverName,
  String? nameCompanySender,
  String? codeCompanySender,
  String? nameSiteSender,
  String? codeSiteSender,
  String? nameCompanyReceiver,
  String? codeCompanyReceiver,
  String? nameSiteReceiver,
  String? codeSiteReceiver,
  String? codeDocument,
  String? status,
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
  deletedAt: deletedAt ?? _deletedAt,
  noDocumentDelivery: noDocumentDelivery ?? _noDocumentDelivery,
  idCompanyReceiver: idCompanyReceiver ?? _idCompanyReceiver,
  idSiteReceiver: idSiteReceiver ?? _idSiteReceiver,
  nameCreated: nameCreated ?? _nameCreated,
  nameUpdated: nameUpdated ?? _nameUpdated,
  nameReceived: nameReceived ?? _nameReceived,
  nameDelivering: nameDelivering ?? _nameDelivering,
  nameDelivered: nameDelivered ?? _nameDelivered,
  nameCancelled: nameCancelled ?? _nameCancelled,
  receivedAt: receivedAt ?? _receivedAt,
  deliveringAt: deliveringAt ?? _deliveringAt,
  deliveredAt: deliveredAt ?? _deliveredAt,
  cancelledAt: cancelledAt ?? _cancelledAt,
  senderName: senderName ?? _senderName,
  receiverName: receiverName ?? _receiverName,
  nameCompanySender: nameCompanySender ?? _nameCompanySender,
  codeCompanySender: codeCompanySender ?? _codeCompanySender,
  nameSiteSender: nameSiteSender ?? _nameSiteSender,
  codeSiteSender: codeSiteSender ?? _codeSiteSender,
  nameCompanyReceiver: nameCompanyReceiver ?? _nameCompanyReceiver,
  codeCompanyReceiver: codeCompanyReceiver ?? _codeCompanyReceiver,
  nameSiteReceiver: nameSiteReceiver ?? _nameSiteReceiver,
  codeSiteReceiver: codeSiteReceiver ?? _codeSiteReceiver,
  codeDocument: codeDocument ?? _codeDocument,
  status: status ?? _status,
);
  dynamic get id => _id;
  num? get idCompany => _idCompany;
  num? get idEmployeeSender => _idEmployeeSender;
  num? get idEmployeeReceiver => _idEmployeeReceiver;
  num? get idSite => _idSite;
  String? get subject => _subject;
  String? get attachment => _attachment;
  String? get remarks => _remarks;
  num? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  String? get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  String? get noDocumentDelivery => _noDocumentDelivery;
  num? get idCompanyReceiver => _idCompanyReceiver;
  num? get idSiteReceiver => _idSiteReceiver;
  String? get nameCreated => _nameCreated;
  String? get nameUpdated => _nameUpdated;
  String? get nameReceived => _nameReceived;
  String? get nameDelivering => _nameDelivering;
  String? get nameDelivered => _nameDelivered;
  String? get nameCancelled => _nameCancelled;
  String? get receivedAt => _receivedAt;
  String? get deliveringAt => _deliveringAt;
  String? get deliveredAt => _deliveredAt;
  String? get cancelledAt => _cancelledAt;
  String? get senderName => _senderName;
  String? get receiverName => _receiverName;
  String? get nameCompanySender => _nameCompanySender;
  String? get codeCompanySender => _codeCompanySender;
  String? get nameSiteSender => _nameSiteSender;
  String? get codeSiteSender => _codeSiteSender;
  String? get nameCompanyReceiver => _nameCompanyReceiver;
  String? get codeCompanyReceiver => _codeCompanyReceiver;
  String? get nameSiteReceiver => _nameSiteReceiver;
  String? get codeSiteReceiver => _codeSiteReceiver;
  String? get codeDocument => _codeDocument;
  String? get status => _status;

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
    map['deleted_at'] = _deletedAt;
    map['no_document_delivery'] = _noDocumentDelivery;
    map['id_company_receiver'] = _idCompanyReceiver;
    map['id_site_receiver'] = _idSiteReceiver;
    map['name_created'] = _nameCreated;
    map['name_updated'] = _nameUpdated;
    map['name_received'] = _nameReceived;
    map['name_delivering'] = _nameDelivering;
    map['name_delivered'] = _nameDelivered;
    map['name_cancelled'] = _nameCancelled;
    map['received_at'] = _receivedAt;
    map['delivering_at'] = _deliveringAt;
    map['delivered_at'] = _deliveredAt;
    map['cancelled_at'] = _cancelledAt;
    map['sender_name'] = _senderName;
    map['receiver_name'] = _receiverName;
    map['name_company_sender'] = _nameCompanySender;
    map['code_company_sender'] = _codeCompanySender;
    map['name_site_sender'] = _nameSiteSender;
    map['code_site_sender'] = _codeSiteSender;
    map['name_company_receiver'] = _nameCompanyReceiver;
    map['code_company_receiver'] = _codeCompanyReceiver;
    map['name_site_receiver'] = _nameSiteReceiver;
    map['code_site_receiver'] = _codeSiteReceiver;
    map['code_document'] = _codeDocument;
    map['status'] = _status;
    return map;
  }

}