/// success : true
/// message : "Success Get Data"
/// data : {"current_page":1,"data":[{"id":1,"id_employee":1,"no_request_trip":"REQ/ABM/123","code_document":"SV","id_site":1,"notes":"1","file":null,"id_city_from":1,"id_city_to":1,"date_departure":"2023-01-01","date_arrival":"2023-02-01","id_zona":1,"code_status_doc":0,"tlk_per_day":"100000.12","total_tlk":"600000","created_at":"2023-05-19 12:48:41","created_by":"2","updated_at":"2023-05-19 12:48:41","updated_by":null,"employee_name":"Jhon Doe","site_name":"Surabaya","site_code":"SBY","zona_name":"A","code":0,"status":"Draft","document_name":"Site Visit","name_city_from":"Surabaya","name_city_to":"Surabaya"}],"first_page_url":"http://103.165.130.157:8086/api/request_trip/get?page=1","from":1,"last_page":1,"last_page_url":"http://103.165.130.157:8086/api/request_trip/get?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://103.165.130.157:8086/api/request_trip/get?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"http://103.165.130.157:8086/api/request_trip/get","per_page":"5","prev_page_url":null,"to":1,"total":1}

class RequestTripListModel {
  RequestTripListModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  RequestTripListModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
RequestTripListModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => RequestTripListModel(  success: success ?? _success,
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
/// data : [{"id":1,"id_employee":1,"no_request_trip":"REQ/ABM/123","code_document":"SV","id_site":1,"notes":"1","file":null,"id_city_from":1,"id_city_to":1,"date_departure":"2023-01-01","date_arrival":"2023-02-01","id_zona":1,"code_status_doc":0,"tlk_per_day":"100000.12","total_tlk":"600000","created_at":"2023-05-19 12:48:41","created_by":"2","updated_at":"2023-05-19 12:48:41","updated_by":null,"employee_name":"Jhon Doe","site_name":"Surabaya","site_code":"SBY","zona_name":"A","code":0,"status":"Draft","document_name":"Site Visit","name_city_from":"Surabaya","name_city_to":"Surabaya"}]
/// first_page_url : "http://103.165.130.157:8086/api/request_trip/get?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "http://103.165.130.157:8086/api/request_trip/get?page=1"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://103.165.130.157:8086/api/request_trip/get?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}]
/// next_page_url : null
/// path : "http://103.165.130.157:8086/api/request_trip/get"
/// per_page : "5"
/// prev_page_url : null
/// to : 1
/// total : 1

class Data {
  Data({
      num? currentPage, 
      List<Data2>? data,
      String? firstPageUrl, 
      num? from, 
      num? lastPage, 
      String? lastPageUrl, 
      List<Links>? links, 
      dynamic nextPageUrl, 
      String? path, 
      String? perPage, 
      dynamic prevPageUrl, 
      num? to, 
      num? total,}){
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
  dynamic _nextPageUrl;
  String? _path;
  String? _perPage;
  dynamic _prevPageUrl;
  num? _to;
  num? _total;
Data copyWith({  num? currentPage,
  List<Data2>? data,
  String? firstPageUrl,
  num? from,
  num? lastPage,
  String? lastPageUrl,
  List<Links>? links,
  dynamic nextPageUrl,
  String? path,
  String? perPage,
  dynamic prevPageUrl,
  num? to,
  num? total,
}) => Data(  currentPage: currentPage ?? _currentPage,
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
  dynamic get nextPageUrl => _nextPageUrl;
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
      bool? active,}){
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
Links copyWith({  dynamic url,
  String? label,
  bool? active,
}) => Links(  url: url ?? _url,
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

/// id : 1
/// id_employee : 1
/// no_request_trip : "REQ/ABM/123"
/// id_document: 1
/// code_document : "SV"
/// id_site : 1
/// notes : "1"
/// file : null
/// id_city_from : 1
/// id_city_to : 1
/// date_departure : "2023-01-01"
/// date_arrival : "2023-02-01"
/// id_zona : 1
/// code_status_doc : 0
/// tlk_per_day : "100000.12"
/// total_tlk : "600000"
/// created_at : "2023-05-19 12:48:41"
/// created_by : "2"
/// updated_at : "2023-05-19 12:48:41"
/// updated_by : null
/// employee_name : "Jhon Doe"
/// site_name : "Surabaya"
/// site_code : "SBY"
/// zona_name : "A"
/// code : 0
/// status : "Draft"
/// document_name : "Site Visit"
/// name_city_from : "Surabaya"
/// name_city_to : "Surabaya"

class Data2 {
  Data2({
      num? id, 
      num? idEmployee, 
      String? noRequestTrip,
      int? idDocument,
      String? codeDocument, 
      num? idSite, 
      String? notes, 
      dynamic file, 
      num? idCityFrom, 
      num? idCityTo, 
      String? dateDeparture, 
      String? dateArrival, 
      num? idZona, 
      num? codeStatusDoc, 
      String? tlkPerDay, 
      String? totalTlk, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      String? employeeName, 
      String? siteName, 
      String? siteCode, 
      String? zonaName, 
      num? code, 
      String? status, 
      String? documentName, 
      String? nameCityFrom, 
      String? nameCityTo,}){
    _id = id;
    _idEmployee = idEmployee;
    _noRequestTrip = noRequestTrip;
    _idDocument = idDocument;
    _codeDocument = codeDocument;
    _idSite = idSite;
    _notes = notes;
    _file = file;
    _idCityFrom = idCityFrom;
    _idCityTo = idCityTo;
    _dateDeparture = dateDeparture;
    _dateArrival = dateArrival;
    _idZona = idZona;
    _codeStatusDoc = codeStatusDoc;
    _tlkPerDay = tlkPerDay;
    _totalTlk = totalTlk;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _employeeName = employeeName;
    _siteName = siteName;
    _siteCode = siteCode;
    _zonaName = zonaName;
    _code = code;
    _status = status;
    _documentName = documentName;
    _nameCityFrom = nameCityFrom;
    _nameCityTo = nameCityTo;
}

  Data2.fromJson(dynamic json) {
    _id = json['id'];
    _idEmployee = json['id_employee'];
    _noRequestTrip = json['no_request_trip'];
    _idDocument = json['id_document'];
    _codeDocument = json['code_document'];
    _idSite = json['id_site'];
    _notes = json['notes'];
    _file = json['file'];
    _idCityFrom = json['id_city_from'];
    _idCityTo = json['id_city_to'];
    _dateDeparture = json['date_departure'];
    _dateArrival = json['date_arrival'];
    _idZona = json['id_zona'];
    _codeStatusDoc = json['code_status_doc'];
    _tlkPerDay = json['tlk_per_day'];
    _totalTlk = json['total_tlk'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _employeeName = json['employee_name'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _zonaName = json['zona_name'];
    _code = json['code'];
    _status = json['status'];
    _documentName = json['document_name'];
    _nameCityFrom = json['name_city_from'];
    _nameCityTo = json['name_city_to'];
  }
  num? _id;
  num? _idEmployee;
  String? _noRequestTrip;
  int? _idDocument;
  String? _codeDocument;
  num? _idSite;
  String? _notes;
  dynamic _file;
  num? _idCityFrom;
  num? _idCityTo;
  String? _dateDeparture;
  String? _dateArrival;
  num? _idZona;
  num? _codeStatusDoc;
  String? _tlkPerDay;
  String? _totalTlk;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  String? _employeeName;
  String? _siteName;
  String? _siteCode;
  String? _zonaName;
  num? _code;
  String? _status;
  String? _documentName;
  String? _nameCityFrom;
  String? _nameCityTo;
Data2 copyWith({  num? id,
  num? idEmployee,
  String? noRequestTrip,
  int? idDocument,
  String? codeDocument,
  num? idSite,
  String? notes,
  dynamic file,
  num? idCityFrom,
  num? idCityTo,
  String? dateDeparture,
  String? dateArrival,
  num? idZona,
  num? codeStatusDoc,
  String? tlkPerDay,
  String? totalTlk,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
  String? employeeName,
  String? siteName,
  String? siteCode,
  String? zonaName,
  num? code,
  String? status,
  String? documentName,
  String? nameCityFrom,
  String? nameCityTo,
}) => Data2(  id: id ?? _id,
  idEmployee: idEmployee ?? _idEmployee,
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
  idDocument: idDocument ?? _idDocument,
  codeDocument: codeDocument ?? _codeDocument,
  idSite: idSite ?? _idSite,
  notes: notes ?? _notes,
  file: file ?? _file,
  idCityFrom: idCityFrom ?? _idCityFrom,
  idCityTo: idCityTo ?? _idCityTo,
  dateDeparture: dateDeparture ?? _dateDeparture,
  dateArrival: dateArrival ?? _dateArrival,
  idZona: idZona ?? _idZona,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  tlkPerDay: tlkPerDay ?? _tlkPerDay,
  totalTlk: totalTlk ?? _totalTlk,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  employeeName: employeeName ?? _employeeName,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
  zonaName: zonaName ?? _zonaName,
  code: code ?? _code,
  status: status ?? _status,
  documentName: documentName ?? _documentName,
  nameCityFrom: nameCityFrom ?? _nameCityFrom,
  nameCityTo: nameCityTo ?? _nameCityTo,
);
  num? get id => _id;
  num? get idEmployee => _idEmployee;
  String? get noRequestTrip => _noRequestTrip;
  int? get idDocument => _idDocument;
  String? get codeDocument => _codeDocument;
  num? get idSite => _idSite;
  String? get notes => _notes;
  dynamic get file => _file;
  num? get idCityFrom => _idCityFrom;
  num? get idCityTo => _idCityTo;
  String? get dateDeparture => _dateDeparture;
  String? get dateArrival => _dateArrival;
  num? get idZona => _idZona;
  num? get codeStatusDoc => _codeStatusDoc;
  String? get tlkPerDay => _tlkPerDay;
  String? get totalTlk => _totalTlk;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  String? get employeeName => _employeeName;
  String? get siteName => _siteName;
  String? get siteCode => _siteCode;
  String? get zonaName => _zonaName;
  num? get code => _code;
  String? get status => _status;
  String? get documentName => _documentName;
  String? get nameCityFrom => _nameCityFrom;
  String? get nameCityTo => _nameCityTo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_employee'] = _idEmployee;
    map['no_request_trip'] = _noRequestTrip;
    map['id_document'] = _idDocument;
    map['code_document'] = _codeDocument;
    map['id_site'] = _idSite;
    map['notes'] = _notes;
    map['file'] = _file;
    map['id_city_from'] = _idCityFrom;
    map['id_city_to'] = _idCityTo;
    map['date_departure'] = _dateDeparture;
    map['date_arrival'] = _dateArrival;
    map['id_zona'] = _idZona;
    map['code_status_doc'] = _codeStatusDoc;
    map['tlk_per_day'] = _tlkPerDay;
    map['total_tlk'] = _totalTlk;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['employee_name'] = _employeeName;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['zona_name'] = _zonaName;
    map['code'] = _code;
    map['status'] = _status;
    map['document_name'] = _documentName;
    map['name_city_from'] = _nameCityFrom;
    map['name_city_to'] = _nameCityTo;
    return map;
  }

}