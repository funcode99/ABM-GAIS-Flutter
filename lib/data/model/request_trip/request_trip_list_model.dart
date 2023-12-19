/// success : true
/// message : "Success Get Data"
/// data : {"current_page":1,"data":[{"id":125,"id_employee":1,"no_request_trip":"RTRIP-2023-23-06/046/RTRIP-3000/06/2023","id_document":3,"id_site":18,"notes":"tes","file":null,"id_city_to":9,"id_city_from":3,"date_departure":"2023-06-15","date_arrival":"2023-06-17","id_zona":1,"code_status_doc":0,"tlk_per_day":"1500000","total_tlk":"4500000","created_at":"2023-06-15 10:42:57","updated_at":"2023-06-15 10:42:57","employee_name":"John Doe","site_name":"Lahat, Kebur x","site_code":"LHT01","zona_name":"A","code":0,"status":"Draft","code_document":"CB","document_name":"Company Business","name_city_from":"Jakarta","name_city_to":"Tangerang","document_ready":{"purpose_of_trip":1,"traveller_guest_trip":0,"flight_trip":0,"taxi_voucher":0,"other_transportation":0,"accomodation_trip":0,"cash_advance":0}},{"id":124,"id_employee":1,"no_request_trip":"RTRIP-2023-23-06/045/RTRIP-3000/06/2023","id_document":3,"id_site":18,"notes":null,"file":null,"id_city_to":35,"id_city_from":3,"date_departure":"2023-06-15","date_arrival":"2023-06-16","id_zona":1,"code_status_doc":0,"tlk_per_day":"1500000","total_tlk":"3000000","created_at":"2023-06-15 10:30:07","updated_at":"2023-06-15 10:30:07","employee_name":"John Doe","site_name":"Lahat, Kebur x","site_code":"LHT01","zona_name":"A","code":0,"status":"Draft","code_document":"CB","document_name":"Company Business","name_city_from":"Jakarta","name_city_to":"Pangkal Pinang","document_ready":{"purpose_of_trip":1,"traveller_guest_trip":1,"flight_trip":1,"taxi_voucher":1,"other_transportation":1,"accomodation_trip":0,"cash_advance":1}},{"id":123,"id_employee":1,"no_request_trip":"RTRIP-2023-23-06/044/RTRIP-3000/06/2023","id_document":1,"id_site":18,"notes":"tt","file":"http://103.165.130.157:8086/storage/files/request_trip/UfStk8FTWzNBRNpSDqs6DZd4cbfpp3T1bZaxM0ms.jpg","id_city_to":10,"id_city_from":3,"date_departure":"2023-06-21","date_arrival":"2023-06-23","id_zona":20,"code_status_doc":1,"tlk_per_day":"9999","total_tlk":"19998","created_at":"2023-06-12 13:37:41","updated_at":"2023-06-13 15:07:41","employee_name":"John Doe","site_name":"Lahat, Kebur x","site_code":"LHT01","zona_name":null,"code":1,"status":"Waiting Approval","code_document":"SV","document_name":"Site Visit","name_city_from":"Jakarta","name_city_to":"Bekasi","document_ready":{"purpose_of_trip":1,"traveller_guest_trip":0,"flight_trip":0,"taxi_voucher":0,"other_transportation":0,"accomodation_trip":0,"cash_advance":1}},{"id":122,"id_employee":1,"no_request_trip":"RTRIP-2023-23-06/043/RTRIP-3000/06/2023","id_document":3,"id_site":18,"notes":"teee","file":null,"id_city_to":11,"id_city_from":3,"date_departure":"2023-06-13","date_arrival":"2023-06-16","id_zona":45,"code_status_doc":0,"tlk_per_day":"9999","total_tlk":"29997","created_at":"2023-06-12 13:33:38","updated_at":"2023-06-12 13:33:38","employee_name":"John Doe","site_name":"Lahat, Kebur x","site_code":"LHT01","zona_name":null,"code":0,"status":"Draft","code_document":"CB","document_name":"Company Business","name_city_from":"Jakarta","name_city_to":"Malang","document_ready":{"purpose_of_trip":1,"traveller_guest_trip":0,"flight_trip":1,"taxi_voucher":0,"other_transportation":0,"accomodation_trip":0,"cash_advance":1}},{"id":121,"id_employee":1,"no_request_trip":"RTRIP-2023-23-06/042/RTRIP-3000/06/2023","id_document":3,"id_site":18,"notes":"tes","file":null,"id_city_to":3,"id_city_from":9,"date_departure":"2023-06-14","date_arrival":"2023-06-16","id_zona":20,"code_status_doc":0,"tlk_per_day":"9999","total_tlk":"19998","created_at":"2023-06-12 13:26:23","updated_at":"2023-06-12 13:28:11","employee_name":"John Doe","site_name":"Lahat, Kebur x","site_code":"LHT01","zona_name":null,"code":0,"status":"Draft","code_document":"CB","document_name":"Company Business","name_city_from":"Tangerang","name_city_to":"Jakarta","document_ready":{"purpose_of_trip":1,"traveller_guest_trip":0,"flight_trip":0,"taxi_voucher":0,"other_transportation":0,"accomodation_trip":0,"cash_advance":1}}],"first_page_url":"/?page=1","from":1,"last_page":6,"last_page_url":"/?page=6","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"/?page=1","label":"1","active":true},{"url":"/?page=2","label":"2","active":false},{"url":"/?page=3","label":"3","active":false},{"url":"/?page=4","label":"4","active":false},{"url":"/?page=5","label":"5","active":false},{"url":"/?page=6","label":"6","active":false},{"url":"/?page=2","label":"Next &raquo;","active":false}],"next_page_url":"/?page=2","path":"/","per_page":"5","prev_page_url":null,"to":5,"total":29}

class RequestTripListModel {
  RequestTripListModel({
    bool? success,
    String? message,
    Data? data,
  }) {
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

  RequestTripListModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      RequestTripListModel(
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
/// data : [{"id":125,"id_employee":1,"no_request_trip":"RTRIP-2023-23-06/046/RTRIP-3000/06/2023","id_document":3,"id_site":18,"notes":"tes","file":null,"id_city_to":9,"id_city_from":3,"date_departure":"2023-06-15","date_arrival":"2023-06-17","id_zona":1,"code_status_doc":0,"tlk_per_day":"1500000","total_tlk":"4500000","created_at":"2023-06-15 10:42:57","updated_at":"2023-06-15 10:42:57","employee_name":"John Doe","site_name":"Lahat, Kebur x","site_code":"LHT01","zona_name":"A","code":0,"status":"Draft","code_document":"CB","document_name":"Company Business","name_city_from":"Jakarta","name_city_to":"Tangerang","document_ready":{"purpose_of_trip":1,"traveller_guest_trip":0,"flight_trip":0,"taxi_voucher":0,"other_transportation":0,"accomodation_trip":0,"cash_advance":0}},{"id":124,"id_employee":1,"no_request_trip":"RTRIP-2023-23-06/045/RTRIP-3000/06/2023","id_document":3,"id_site":18,"notes":null,"file":null,"id_city_to":35,"id_city_from":3,"date_departure":"2023-06-15","date_arrival":"2023-06-16","id_zona":1,"code_status_doc":0,"tlk_per_day":"1500000","total_tlk":"3000000","created_at":"2023-06-15 10:30:07","updated_at":"2023-06-15 10:30:07","employee_name":"John Doe","site_name":"Lahat, Kebur x","site_code":"LHT01","zona_name":"A","code":0,"status":"Draft","code_document":"CB","document_name":"Company Business","name_city_from":"Jakarta","name_city_to":"Pangkal Pinang","document_ready":{"purpose_of_trip":1,"traveller_guest_trip":1,"flight_trip":1,"taxi_voucher":1,"other_transportation":1,"accomodation_trip":0,"cash_advance":1}},{"id":123,"id_employee":1,"no_request_trip":"RTRIP-2023-23-06/044/RTRIP-3000/06/2023","id_document":1,"id_site":18,"notes":"tt","file":"http://103.165.130.157:8086/storage/files/request_trip/UfStk8FTWzNBRNpSDqs6DZd4cbfpp3T1bZaxM0ms.jpg","id_city_to":10,"id_city_from":3,"date_departure":"2023-06-21","date_arrival":"2023-06-23","id_zona":20,"code_status_doc":1,"tlk_per_day":"9999","total_tlk":"19998","created_at":"2023-06-12 13:37:41","updated_at":"2023-06-13 15:07:41","employee_name":"John Doe","site_name":"Lahat, Kebur x","site_code":"LHT01","zona_name":null,"code":1,"status":"Waiting Approval","code_document":"SV","document_name":"Site Visit","name_city_from":"Jakarta","name_city_to":"Bekasi","document_ready":{"purpose_of_trip":1,"traveller_guest_trip":0,"flight_trip":0,"taxi_voucher":0,"other_transportation":0,"accomodation_trip":0,"cash_advance":1}},{"id":122,"id_employee":1,"no_request_trip":"RTRIP-2023-23-06/043/RTRIP-3000/06/2023","id_document":3,"id_site":18,"notes":"teee","file":null,"id_city_to":11,"id_city_from":3,"date_departure":"2023-06-13","date_arrival":"2023-06-16","id_zona":45,"code_status_doc":0,"tlk_per_day":"9999","total_tlk":"29997","created_at":"2023-06-12 13:33:38","updated_at":"2023-06-12 13:33:38","employee_name":"John Doe","site_name":"Lahat, Kebur x","site_code":"LHT01","zona_name":null,"code":0,"status":"Draft","code_document":"CB","document_name":"Company Business","name_city_from":"Jakarta","name_city_to":"Malang","document_ready":{"purpose_of_trip":1,"traveller_guest_trip":0,"flight_trip":1,"taxi_voucher":0,"other_transportation":0,"accomodation_trip":0,"cash_advance":1}},{"id":121,"id_employee":1,"no_request_trip":"RTRIP-2023-23-06/042/RTRIP-3000/06/2023","id_document":3,"id_site":18,"notes":"tes","file":null,"id_city_to":3,"id_city_from":9,"date_departure":"2023-06-14","date_arrival":"2023-06-16","id_zona":20,"code_status_doc":0,"tlk_per_day":"9999","total_tlk":"19998","created_at":"2023-06-12 13:26:23","updated_at":"2023-06-12 13:28:11","employee_name":"John Doe","site_name":"Lahat, Kebur x","site_code":"LHT01","zona_name":null,"code":0,"status":"Draft","code_document":"CB","document_name":"Company Business","name_city_from":"Tangerang","name_city_to":"Jakarta","document_ready":{"purpose_of_trip":1,"traveller_guest_trip":0,"flight_trip":0,"taxi_voucher":0,"other_transportation":0,"accomodation_trip":0,"cash_advance":1}}]
/// first_page_url : "/?page=1"
/// from : 1
/// last_page : 6
/// last_page_url : "/?page=6"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"/?page=1","label":"1","active":true},{"url":"/?page=2","label":"2","active":false},{"url":"/?page=3","label":"3","active":false},{"url":"/?page=4","label":"4","active":false},{"url":"/?page=5","label":"5","active":false},{"url":"/?page=6","label":"6","active":false},{"url":"/?page=2","label":"Next &raquo;","active":false}]
/// next_page_url : "/?page=2"
/// path : "/"
/// per_page : "5"
/// prev_page_url : null
/// to : 5
/// total : 29

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

/// id : 125
/// id_employee : 1
/// no_request_trip : "RTRIP-2023-23-06/046/RTRIP-3000/06/2023"
/// id_document : 3
/// id_site : 18
/// notes : "tes"
/// file : null
/// id_city_to : 9
/// id_city_from : 3
/// date_departure : "2023-06-15"
/// date_arrival : "2023-06-17"
/// id_zona : 1
/// code_status_doc : 0
/// tlk_per_day : "1500000"
/// total_tlk : "4500000"
/// created_at : "2023-06-15 10:42:57"
/// updated_at : "2023-06-15 10:42:57"
/// employee_name : "John Doe"
/// site_name : "Lahat, Kebur x"
/// site_code : "LHT01"
/// zona_name : "A"
/// code : 0
/// status : "Draft"
/// code_document : "CB"
/// document_name : "Company Business"
/// name_city_from : "Jakarta"
/// name_city_to : "Tangerang"
/// document_ready : {"purpose_of_trip":1,"traveller_guest_trip":0,"flight_trip":0,"taxi_voucher":0,"other_transportation":0,"accomodation_trip":0,"cash_advance":0}

class Data2 {
  Data2({
    num? id,
    num? idEmployee,
    String? noRequestTrip,
    num? idDocument,
    num? idSite,
    String? notes,
    dynamic file,
    num? idCityTo,
    num? idCityFrom,
    String? dateDeparture,
    String? dateArrival,
    num? idZona,
    num? codeStatusDoc,
    String? tlkPerDay,
    String? totalTlk,
    String? createdAt,
    String? updatedAt,
    String? employeeName,
    String? siteName,
    String? siteCode,
    String? zonaName,
    num? code,
    String? status,
    String? codeDocument,
    String? documentName,
    String? nameCityFrom,
    String? nameCityTo,
    DocumentReady? documentReady,
  }) {
    _id = id;
    _idEmployee = idEmployee;
    _noRequestTrip = noRequestTrip;
    _idDocument = idDocument;
    _idSite = idSite;
    _notes = notes;
    _file = file;
    _idCityTo = idCityTo;
    _idCityFrom = idCityFrom;
    _dateDeparture = dateDeparture;
    _dateArrival = dateArrival;
    _idZona = idZona;
    _codeStatusDoc = codeStatusDoc;
    _tlkPerDay = tlkPerDay;
    _totalTlk = totalTlk;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _employeeName = employeeName;
    _siteName = siteName;
    _siteCode = siteCode;
    _zonaName = zonaName;
    _code = code;
    _status = status;
    _codeDocument = codeDocument;
    _documentName = documentName;
    _nameCityFrom = nameCityFrom;
    _nameCityTo = nameCityTo;
    _documentReady = documentReady;
  }

  Data2.fromJson(dynamic json) {
    _id = json['id'];
    _idEmployee = json['id_employee'];
    _noRequestTrip = json['no_request_trip'];
    _idDocument = json['id_document'];
    _idSite = json['id_site'];
    _notes = json['notes'];
    _file = json['file'];
    _idCityTo = json['id_city_to'];
    _idCityFrom = json['id_city_from'];
    _dateDeparture = json['date_departure'];
    _dateArrival = json['date_arrival'];
    _idZona = json['id_zona'];
    _codeStatusDoc = json['code_status_doc'];
    _tlkPerDay = json['tlk_per_day'];
    _totalTlk = json['total_tlk'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _employeeName = json['employee_name'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _zonaName = json['zona_name'];
    _code = json['code'];
    _status = json['status'];
    _codeDocument = json['code_document'];
    _documentName = json['document_name'];
    _nameCityFrom = json['name_city_from'];
    _nameCityTo = json['name_city_to'];
    _documentReady = json['document_ready'] != null ? DocumentReady.fromJson(json['document_ready']) : null;
  }

  dynamic _id;
  num? _idEmployee;
  String? _noRequestTrip;
  num? _idDocument;
  num? _idSite;
  String? _notes;
  dynamic _file;
  num? _idCityTo;
  num? _idCityFrom;
  String? _dateDeparture;
  String? _dateArrival;
  num? _idZona;
  num? _codeStatusDoc;
  String? _tlkPerDay;
  String? _totalTlk;
  String? _createdAt;
  String? _updatedAt;
  String? _employeeName;
  String? _siteName;
  String? _siteCode;
  String? _zonaName;
  num? _code;
  String? _status;
  String? _codeDocument;
  String? _documentName;
  String? _nameCityFrom;
  String? _nameCityTo;
  DocumentReady? _documentReady;

  Data2 copyWith({
    num? id,
    num? idEmployee,
    String? noRequestTrip,
    num? idDocument,
    num? idSite,
    String? notes,
    dynamic file,
    num? idCityTo,
    num? idCityFrom,
    String? dateDeparture,
    String? dateArrival,
    num? idZona,
    num? codeStatusDoc,
    String? tlkPerDay,
    String? totalTlk,
    String? createdAt,
    String? updatedAt,
    String? employeeName,
    String? siteName,
    String? siteCode,
    String? zonaName,
    num? code,
    String? status,
    String? codeDocument,
    String? documentName,
    String? nameCityFrom,
    String? nameCityTo,
    DocumentReady? documentReady,
  }) =>
      Data2(
        id: id ?? _id,
        idEmployee: idEmployee ?? _idEmployee,
        noRequestTrip: noRequestTrip ?? _noRequestTrip,
        idDocument: idDocument ?? _idDocument,
        idSite: idSite ?? _idSite,
        notes: notes ?? _notes,
        file: file ?? _file,
        idCityTo: idCityTo ?? _idCityTo,
        idCityFrom: idCityFrom ?? _idCityFrom,
        dateDeparture: dateDeparture ?? _dateDeparture,
        dateArrival: dateArrival ?? _dateArrival,
        idZona: idZona ?? _idZona,
        codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
        tlkPerDay: tlkPerDay ?? _tlkPerDay,
        totalTlk: totalTlk ?? _totalTlk,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        employeeName: employeeName ?? _employeeName,
        siteName: siteName ?? _siteName,
        siteCode: siteCode ?? _siteCode,
        zonaName: zonaName ?? _zonaName,
        code: code ?? _code,
        status: status ?? _status,
        codeDocument: codeDocument ?? _codeDocument,
        documentName: documentName ?? _documentName,
        nameCityFrom: nameCityFrom ?? _nameCityFrom,
        nameCityTo: nameCityTo ?? _nameCityTo,
        documentReady: documentReady ?? _documentReady,
      );

  dynamic get id => _id;

  num? get idEmployee => _idEmployee;

  String? get noRequestTrip => _noRequestTrip;

  num? get idDocument => _idDocument;

  num? get idSite => _idSite;

  String? get notes => _notes;

  dynamic get file => _file;

  num? get idCityTo => _idCityTo;

  num? get idCityFrom => _idCityFrom;

  String? get dateDeparture => _dateDeparture;

  String? get dateArrival => _dateArrival;

  num? get idZona => _idZona;

  num? get codeStatusDoc => _codeStatusDoc;

  String? get tlkPerDay => _tlkPerDay;

  String? get totalTlk => _totalTlk;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get employeeName => _employeeName;

  String? get siteName => _siteName;

  String? get siteCode => _siteCode;

  String? get zonaName => _zonaName;

  num? get code => _code;

  String? get status => _status;

  String? get codeDocument => _codeDocument;

  String? get documentName => _documentName;

  String? get nameCityFrom => _nameCityFrom;

  String? get nameCityTo => _nameCityTo;

  DocumentReady? get documentReady => _documentReady;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_employee'] = _idEmployee;
    map['no_request_trip'] = _noRequestTrip;
    map['id_document'] = _idDocument;
    map['id_site'] = _idSite;
    map['notes'] = _notes;
    map['file'] = _file;
    map['id_city_to'] = _idCityTo;
    map['id_city_from'] = _idCityFrom;
    map['date_departure'] = _dateDeparture;
    map['date_arrival'] = _dateArrival;
    map['id_zona'] = _idZona;
    map['code_status_doc'] = _codeStatusDoc;
    map['tlk_per_day'] = _tlkPerDay;
    map['total_tlk'] = _totalTlk;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['employee_name'] = _employeeName;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['zona_name'] = _zonaName;
    map['code'] = _code;
    map['status'] = _status;
    map['code_document'] = _codeDocument;
    map['document_name'] = _documentName;
    map['name_city_from'] = _nameCityFrom;
    map['name_city_to'] = _nameCityTo;
    if (_documentReady != null) {
      map['document_ready'] = _documentReady?.toJson();
    }
    return map;
  }
}

/// purpose_of_trip : 1
/// traveller_guest_trip : 0
/// flight_trip : 0
/// taxi_voucher : 0
/// other_transportation : 0
/// accomodation_trip : 0
/// cash_advance : 0

class DocumentReady {
  DocumentReady({
    num? purposeOfTrip,
    num? travellerGuestTrip,
    num? flightTrip,
    num? taxiVoucher,
    num? otherTransportation,
    num? accomodationTrip,
    num? cashAdvance,
    num? trainTrip,
    num? transportation,
  }) {
    _purposeOfTrip = purposeOfTrip;
    _travellerGuestTrip = travellerGuestTrip;
    _flightTrip = flightTrip;
    _taxiVoucher = taxiVoucher;
    _otherTransportation = otherTransportation;
    _accomodationTrip = accomodationTrip;
    _cashAdvance = cashAdvance;
    _trainTrip = trainTrip;
    _transportation = transportation;
  }

  DocumentReady.fromJson(dynamic json) {
    _purposeOfTrip = json['purpose_of_trip'];
    _travellerGuestTrip = json['traveller_guest_trip'];
    _flightTrip = json['flight_trip'];
    _taxiVoucher = json['taxi_voucher'];
    _otherTransportation = json['other_transportation'];
    _accomodationTrip = json['accomodation_trip'];
    _cashAdvance = json['cash_advance'];
    _trainTrip = json['train_trip'];
    _transportation = json['transportation'];
  }

  num? _purposeOfTrip;
  num? _travellerGuestTrip;
  num? _flightTrip;
  num? _taxiVoucher;
  num? _otherTransportation;
  num? _accomodationTrip;
  num? _cashAdvance;
  num? _trainTrip;
  num? _transportation;

  DocumentReady copyWith({
    num? purposeOfTrip,
    num? travellerGuestTrip,
    num? flightTrip,
    num? taxiVoucher,
    num? otherTransportation,
    num? accomodationTrip,
    num? cashAdvance,
    num? trainTrip,
    num? transportation,
  }) =>
      DocumentReady(
        purposeOfTrip: purposeOfTrip ?? _purposeOfTrip,
        travellerGuestTrip: travellerGuestTrip ?? _travellerGuestTrip,
        flightTrip: flightTrip ?? _flightTrip,
        taxiVoucher: taxiVoucher ?? _taxiVoucher,
        otherTransportation: otherTransportation ?? _otherTransportation,
        accomodationTrip: accomodationTrip ?? _accomodationTrip,
        cashAdvance: cashAdvance ?? _cashAdvance,
        trainTrip: trainTrip ?? _trainTrip,
        transportation: transportation ?? _transportation,
      );

  num? get purposeOfTrip => _purposeOfTrip;

  num? get travellerGuestTrip => _travellerGuestTrip;

  num? get flightTrip => _flightTrip;

  num? get taxiVoucher => _taxiVoucher;

  num? get otherTransportation => _otherTransportation;

  num? get accomodationTrip => _accomodationTrip;

  num? get cashAdvance => _cashAdvance;

  num? get trainTrip => _trainTrip;

  num? get transportation => _transportation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['purpose_of_trip'] = _purposeOfTrip;
    map['traveller_guest_trip'] = _travellerGuestTrip;
    map['flight_trip'] = _flightTrip;
    map['taxi_voucher'] = _taxiVoucher;
    map['other_transportation'] = _otherTransportation;
    map['accomodation_trip'] = _accomodationTrip;
    map['cash_advance'] = _cashAdvance;
    map['train_trip'] = _trainTrip;
    map['transportation'] = _transportation;
    return map;
  }
}
