/// success : true
/// message : "Success Get Data"
/// data : {"current_page":1,"data":[{"id":14,"id_company":1,"id_employee_sender":1,"id_employee_receiver":1,"id_site":1,"subject":"SUB","attachment":"/tmp/php934qSG","remarks":null,"code_status_doc":0,"created_at":"2023-07-05 16:33:43","created_by":"2","updated_at":"2023-07-05 16:33:43","updated_by":null,"deleted_at":null,"no_document_delivery":"2023-07-DOCDL/001/ DOCDL-07-23","sender_name":"John Doe","receiver_name":"John Doe","company_name":"PT Cipta Kridatama","company_code":"3000","site_name":null,"site_code":null,"code_document":"DOCDL","status":"Created"},{"id":13,"id_company":1,"id_employee_sender":1,"id_employee_receiver":1,"id_site":1,"subject":"SUB","attachment":null,"remarks":null,"code_status_doc":0,"created_at":"2023-07-05 16:33:00","created_by":"2","updated_at":"2023-07-05 16:33:00","updated_by":null,"deleted_at":null,"no_document_delivery":"2023-07-DOCDL/001/ DOCDL-07-23","sender_name":"John Doe","receiver_name":"John Doe","company_name":"PT Cipta Kridatama","company_code":"3000","site_name":null,"site_code":null,"code_document":"DOCDL","status":"Created"},{"id":12,"id_company":1,"id_employee_sender":1,"id_employee_receiver":1,"id_site":1,"subject":"SUB","attachment":"/tmp/phpb39LBL","remarks":null,"code_status_doc":0,"created_at":"2023-07-04 11:09:39","created_by":"2","updated_at":"2023-07-04 11:09:39","updated_by":null,"deleted_at":null,"no_document_delivery":"2023-07-DOCDL/001/ DOCDL-07-23","sender_name":"John Doe","receiver_name":"John Doe","company_name":"PT Cipta Kridatama","company_code":"3000","site_name":null,"site_code":null,"code_document":"DOCDL","status":"Created"},{"id":11,"id_company":1,"id_employee_sender":1,"id_employee_receiver":1,"id_site":1,"subject":"SUB","attachment":null,"remarks":null,"code_status_doc":0,"created_at":"2023-07-04 11:09:24","created_by":"2","updated_at":"2023-07-04 11:09:24","updated_by":null,"deleted_at":null,"no_document_delivery":"2023-07-DOCDL/001/ DOCDL-07-23","sender_name":"John Doe","receiver_name":"John Doe","company_name":"PT Cipta Kridatama","company_code":"3000","site_name":null,"site_code":null,"code_document":"DOCDL","status":"Created"},{"id":10,"id_company":1,"id_employee_sender":1,"id_employee_receiver":1,"id_site":1,"subject":"SUB","attachment":null,"remarks":null,"code_status_doc":0,"created_at":"2023-07-04 11:08:54","created_by":"2","updated_at":"2023-07-04 11:08:54","updated_by":null,"deleted_at":null,"no_document_delivery":"2023-07-DOCDL/001/ DOCDL-07-23","sender_name":"John Doe","receiver_name":"John Doe","company_name":"PT Cipta Kridatama","company_code":"3000","site_name":null,"site_code":null,"code_document":"DOCDL","status":"Created"}],"first_page_url":"http://38.47.76.138:8013/api/employee_doc_delivery/get?page=1","from":1,"last_page":3,"last_page_url":"http://38.47.76.138:8013/api/employee_doc_delivery/get?page=3","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://38.47.76.138:8013/api/employee_doc_delivery/get?page=1","label":"1","active":true},{"url":"http://38.47.76.138:8013/api/employee_doc_delivery/get?page=2","label":"2","active":false},{"url":"http://38.47.76.138:8013/api/employee_doc_delivery/get?page=3","label":"3","active":false},{"url":"http://38.47.76.138:8013/api/employee_doc_delivery/get?page=2","label":"Next &raquo;","active":false}],"next_page_url":"http://38.47.76.138:8013/api/employee_doc_delivery/get?page=2","path":"http://38.47.76.138:8013/api/employee_doc_delivery/get","per_page":"5","prev_page_url":null,"to":5,"total":14}

class GetDocumentDeliveryModel {
  GetDocumentDeliveryModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetDocumentDeliveryModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _success;
  String? _message;
  Data? _data;

  GetDocumentDeliveryModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      GetDocumentDeliveryModel(
        success: success ?? _success,
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

/// current_page : 1
/// data : [{"id":14,"id_company":1,"id_employee_sender":1,"id_employee_receiver":1,"id_site":1,"subject":"SUB","attachment":"/tmp/php934qSG","remarks":null,"code_status_doc":0,"created_at":"2023-07-05 16:33:43","created_by":"2","updated_at":"2023-07-05 16:33:43","updated_by":null,"deleted_at":null,"no_document_delivery":"2023-07-DOCDL/001/ DOCDL-07-23","sender_name":"John Doe","receiver_name":"John Doe","company_name":"PT Cipta Kridatama","company_code":"3000","site_name":null,"site_code":null,"code_document":"DOCDL","status":"Created"},{"id":13,"id_company":1,"id_employee_sender":1,"id_employee_receiver":1,"id_site":1,"subject":"SUB","attachment":null,"remarks":null,"code_status_doc":0,"created_at":"2023-07-05 16:33:00","created_by":"2","updated_at":"2023-07-05 16:33:00","updated_by":null,"deleted_at":null,"no_document_delivery":"2023-07-DOCDL/001/ DOCDL-07-23","sender_name":"John Doe","receiver_name":"John Doe","company_name":"PT Cipta Kridatama","company_code":"3000","site_name":null,"site_code":null,"code_document":"DOCDL","status":"Created"},{"id":12,"id_company":1,"id_employee_sender":1,"id_employee_receiver":1,"id_site":1,"subject":"SUB","attachment":"/tmp/phpb39LBL","remarks":null,"code_status_doc":0,"created_at":"2023-07-04 11:09:39","created_by":"2","updated_at":"2023-07-04 11:09:39","updated_by":null,"deleted_at":null,"no_document_delivery":"2023-07-DOCDL/001/ DOCDL-07-23","sender_name":"John Doe","receiver_name":"John Doe","company_name":"PT Cipta Kridatama","company_code":"3000","site_name":null,"site_code":null,"code_document":"DOCDL","status":"Created"},{"id":11,"id_company":1,"id_employee_sender":1,"id_employee_receiver":1,"id_site":1,"subject":"SUB","attachment":null,"remarks":null,"code_status_doc":0,"created_at":"2023-07-04 11:09:24","created_by":"2","updated_at":"2023-07-04 11:09:24","updated_by":null,"deleted_at":null,"no_document_delivery":"2023-07-DOCDL/001/ DOCDL-07-23","sender_name":"John Doe","receiver_name":"John Doe","company_name":"PT Cipta Kridatama","company_code":"3000","site_name":null,"site_code":null,"code_document":"DOCDL","status":"Created"},{"id":10,"id_company":1,"id_employee_sender":1,"id_employee_receiver":1,"id_site":1,"subject":"SUB","attachment":null,"remarks":null,"code_status_doc":0,"created_at":"2023-07-04 11:08:54","created_by":"2","updated_at":"2023-07-04 11:08:54","updated_by":null,"deleted_at":null,"no_document_delivery":"2023-07-DOCDL/001/ DOCDL-07-23","sender_name":"John Doe","receiver_name":"John Doe","company_name":"PT Cipta Kridatama","company_code":"3000","site_name":null,"site_code":null,"code_document":"DOCDL","status":"Created"}]
/// first_page_url : "http://38.47.76.138:8013/api/employee_doc_delivery/get?page=1"
/// from : 1
/// last_page : 3
/// last_page_url : "http://38.47.76.138:8013/api/employee_doc_delivery/get?page=3"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://38.47.76.138:8013/api/employee_doc_delivery/get?page=1","label":"1","active":true},{"url":"http://38.47.76.138:8013/api/employee_doc_delivery/get?page=2","label":"2","active":false},{"url":"http://38.47.76.138:8013/api/employee_doc_delivery/get?page=3","label":"3","active":false},{"url":"http://38.47.76.138:8013/api/employee_doc_delivery/get?page=2","label":"Next &raquo;","active":false}]
/// next_page_url : "http://38.47.76.138:8013/api/employee_doc_delivery/get?page=2"
/// path : "http://38.47.76.138:8013/api/employee_doc_delivery/get"
/// per_page : "5"
/// prev_page_url : null
/// to : 5
/// total : 14

class Data {
  Data({
    num? currentPage,
    List<Data2>? data,
    String? firstPageUrl,
    num? from,
    num? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    String? nextPageUrl,
    String? path,
    String? perPage,
    dynamic prevPageUrl,
    num? to,
    num? total,
  }) {
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
  }

  Data.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data2.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }

  num? _currentPage;
  List<Data2>? _data;
  String? _firstPageUrl;
  num? _from;
  num? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  String? _nextPageUrl;
  String? _path;
  String? _perPage;
  dynamic _prevPageUrl;
  num? _to;
  num? _total;

  Data copyWith({
    num? currentPage,
    List<Data2>? data,
    String? firstPageUrl,
    num? from,
    num? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    String? nextPageUrl,
    String? path,
    String? perPage,
    dynamic prevPageUrl,
    num? to,
    num? total,
  }) =>
      Data(
        currentPage: currentPage ?? _currentPage,
        data: data ?? _data,
        firstPageUrl: firstPageUrl ?? _firstPageUrl,
        from: from ?? _from,
        lastPage: lastPage ?? _lastPage,
        lastPageUrl: lastPageUrl ?? _lastPageUrl,
        links: links ?? _links,
        nextPageUrl: nextPageUrl ?? _nextPageUrl,
        path: path ?? _path,
        perPage: perPage ?? _perPage,
        prevPageUrl: prevPageUrl ?? _prevPageUrl,
        to: to ?? _to,
        total: total ?? _total,
      );

  num? get currentPage => _currentPage;

  List<Data2>? get data => _data;

  String? get firstPageUrl => _firstPageUrl;

  num? get from => _from;

  num? get lastPage => _lastPage;

  String? get lastPageUrl => _lastPageUrl;

  List<Links>? get links => _links;

  String? get nextPageUrl => _nextPageUrl;

  String? get path => _path;

  String? get perPage => _perPage;

  dynamic get prevPageUrl => _prevPageUrl;

  num? get to => _to;

  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }
}

/// url : null
/// label : "&laquo; Previous"
/// active : false

class Links {
  Links({
    dynamic url,
    String? label,
    bool? active,
  }) {
    _url = url;
    _label = label;
    _active = active;
  }

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }

  dynamic _url;
  String? _label;
  bool? _active;

  Links copyWith({
    dynamic url,
    String? label,
    bool? active,
  }) =>
      Links(
        url: url ?? _url,
        label: label ?? _label,
        active: active ?? _active,
      );

  dynamic get url => _url;

  String? get label => _label;

  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }
}

/// id : 14
/// id_company : 1
/// id_employee_sender : 1
/// id_employee_receiver : 1
/// id_site : 1
/// subject : "SUB"
/// attachment : "/tmp/php934qSG"
/// remarks : null
/// code_status_doc : 0
/// created_at : "2023-07-05 16:33:43"
/// created_by : "2"
/// updated_at : "2023-07-05 16:33:43"
/// updated_by : null
/// deleted_at : null
/// no_document_delivery : "2023-07-DOCDL/001/ DOCDL-07-23"
/// sender_name : "John Doe"
/// receiver_name : "John Doe"
/// company_name : "PT Cipta Kridatama"
/// company_code : "3000"
/// site_name : null
/// site_code : null
/// code_document : "DOCDL"
/// status : "Created"

class Data2 {
  Data2({
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
    dynamic deletedAt,
    String? noDocumentDelivery,
    String? senderName,
    String? receiverName,
    String? companyName,
    String? companyCode,
    dynamic siteName,
    dynamic siteCode,
    String? codeDocument,
    String? status,
  }) {
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
    _senderName = senderName;
    _receiverName = receiverName;
    _companyName = companyName;
    _companyCode = companyCode;
    _siteName = siteName;
    _siteCode = siteCode;
    _codeDocument = codeDocument;
    _status = status;
  }

  Data2.fromJson(dynamic json) {
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
    _deletedAt = json['deleted_at'];
    _noDocumentDelivery = json['no_document_delivery'];
    _senderName = json['sender_name'];
    _receiverName = json['receiver_name'];
    _companyName = json['company_name'];
    _companyCode = json['company_code'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _codeDocument = json['code_document'];
    _status = json['status'];
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
  dynamic _deletedAt;
  String? _noDocumentDelivery;
  String? _senderName;
  String? _receiverName;
  String? _companyName;
  String? _companyCode;
  dynamic _siteName;
  dynamic _siteCode;
  String? _codeDocument;
  String? _status;

  Data2 copyWith({
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
    dynamic deletedAt,
    String? noDocumentDelivery,
    String? senderName,
    String? receiverName,
    String? companyName,
    String? companyCode,
    dynamic siteName,
    dynamic siteCode,
    String? codeDocument,
    String? status,
  }) =>
      Data2(
        id: id ?? _id,
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
        senderName: senderName ?? _senderName,
        receiverName: receiverName ?? _receiverName,
        companyName: companyName ?? _companyName,
        companyCode: companyCode ?? _companyCode,
        siteName: siteName ?? _siteName,
        siteCode: siteCode ?? _siteCode,
        codeDocument: codeDocument ?? _codeDocument,
        status: status ?? _status,
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

  dynamic get deletedAt => _deletedAt;

  String? get noDocumentDelivery => _noDocumentDelivery;

  String? get senderName => _senderName;

  String? get receiverName => _receiverName;

  String? get companyName => _companyName;

  String? get companyCode => _companyCode;

  dynamic get siteName => _siteName;

  dynamic get siteCode => _siteCode;

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
    map['sender_name'] = _senderName;
    map['receiver_name'] = _receiverName;
    map['company_name'] = _companyName;
    map['company_code'] = _companyCode;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['code_document'] = _codeDocument;
    map['status'] = _status;
    return map;
  }
}
