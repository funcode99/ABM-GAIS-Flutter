/// success : true
/// message : "Success Get Data"
/// data : [{"id":23,"id_company":1,"id_employee_sender":2,"id_employee_receiver":1,"id_site":1,"subject":"doc1","attachment":"/tmp/phpePGECp","remarks":null,"code_status_doc":0,"created_at":"2023-06-07 08:18:28","created_by":"1","updated_at":"2023-06-07 08:18:28","updated_by":null,"company_name":"PT Cipta Kridatama","company_code":"3000","site_name":null,"site_code":null}]

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

/// id : 23
/// id_company : 1
/// id_employee_sender : 2
/// id_employee_receiver : 1
/// id_site : 1
/// subject : "doc1"
/// attachment : "/tmp/phpePGECp"
/// remarks : null
/// code_status_doc : 0
/// created_at : "2023-06-07 08:18:28"
/// created_by : "1"
/// updated_at : "2023-06-07 08:18:28"
/// updated_by : null
/// company_name : "PT Cipta Kridatama"
/// company_code : "3000"
/// site_name : null
/// site_code : null

class Data {
  Data({
      num? id, 
      num? idCompany, 
      num? idEmployeeSender, 
      num? idEmployeeReceiver, 
      num? idSite, 
      String? subject, 
      String? attachment, 
      dynamic remarks, 
      num? codeStatusDoc, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      String? companyName, 
      String? companyCode, 
      dynamic siteName, 
      dynamic siteCode,}){
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
    _companyName = companyName;
    _companyCode = companyCode;
    _siteName = siteName;
    _siteCode = siteCode;
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
    _companyName = json['company_name'];
    _companyCode = json['company_code'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
  }
  num? _id;
  num? _idCompany;
  num? _idEmployeeSender;
  num? _idEmployeeReceiver;
  num? _idSite;
  String? _subject;
  String? _attachment;
  dynamic _remarks;
  num? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  String? _companyName;
  String? _companyCode;
  dynamic _siteName;
  dynamic _siteCode;
Data copyWith({  num? id,
  num? idCompany,
  num? idEmployeeSender,
  num? idEmployeeReceiver,
  num? idSite,
  String? subject,
  String? attachment,
  dynamic remarks,
  num? codeStatusDoc,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
  String? companyName,
  String? companyCode,
  dynamic siteName,
  dynamic siteCode,
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
  companyName: companyName ?? _companyName,
  companyCode: companyCode ?? _companyCode,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
);
  num? get id => _id;
  num? get idCompany => _idCompany;
  num? get idEmployeeSender => _idEmployeeSender;
  num? get idEmployeeReceiver => _idEmployeeReceiver;
  num? get idSite => _idSite;
  String? get subject => _subject;
  String? get attachment => _attachment;
  dynamic get remarks => _remarks;
  num? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  String? get companyName => _companyName;
  String? get companyCode => _companyCode;
  dynamic get siteName => _siteName;
  dynamic get siteCode => _siteCode;

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
    map['company_name'] = _companyName;
    map['company_code'] = _companyCode;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    return map;
  }

}