class GetApprovalRequestTripModel {
  GetApprovalRequestTripModel({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetApprovalRequestTripModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _success;
  String? _message;
  Data? _data;

  GetApprovalRequestTripModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      GetApprovalRequestTripModel(
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

class Data2 {
  Data2({
    num? no,
    String? id,
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
    num? idOrigin,
    dynamic isDelegation,
    String? docCreatedAt,
    num? currentLevel,
    String? idRequestTrip,
    String? noRequestTrip,
    dynamic notesRtrip,
    dynamic file,
    dynamic fileName,
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
    String? zonaName,
    num? codeStatus,
    String? status,
    String? documentName,
  }) {
    _no = no;
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
    _idOrigin = idOrigin;
    _isDelegation = isDelegation;
    _docCreatedAt = docCreatedAt;
    _currentLevel = currentLevel;
    _idRequestTrip = idRequestTrip;
    _noRequestTrip = noRequestTrip;
    _notesRtrip = notesRtrip;
    _file = file;
    _fileName = fileName;
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

  Data2.fromJson(dynamic json) {
    _no = json['no'];
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
    _idOrigin = json['id_origin'];
    _isDelegation = json['is_delegation'];
    _docCreatedAt = json['doc_created_at'];
    _currentLevel = json['current_level'];
    _idRequestTrip = json['id_request_trip'];
    _noRequestTrip = json['no_request_trip'];
    _notesRtrip = json['notes_rtrip'];
    _file = json['file'];
    _fileName = json['file_name'];
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

  num? _no;
  String? _id;
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
  num? _idOrigin;
  dynamic _isDelegation;
  String? _docCreatedAt;
  num? _currentLevel;
  String? _idRequestTrip;
  String? _noRequestTrip;
  dynamic _notesRtrip;
  dynamic _file;
  dynamic _fileName;
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
  String? _zonaName;
  num? _codeStatus;
  String? _status;
  String? _documentName;

  Data2 copyWith({
    num? no,
    String? id,
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
    num? idOrigin,
    dynamic isDelegation,
    String? docCreatedAt,
    num? currentLevel,
    String? idRequestTrip,
    String? noRequestTrip,
    dynamic notesRtrip,
    dynamic file,
    dynamic fileName,
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
    String? zonaName,
    num? codeStatus,
    String? status,
    String? documentName,
  }) =>
      Data2(
        no: no ?? _no,
        id: id ?? _id,
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
        idOrigin: idOrigin ?? _idOrigin,
        isDelegation: isDelegation ?? _isDelegation,
        docCreatedAt: docCreatedAt ?? _docCreatedAt,
        currentLevel: currentLevel ?? _currentLevel,
        idRequestTrip: idRequestTrip ?? _idRequestTrip,
        noRequestTrip: noRequestTrip ?? _noRequestTrip,
        notesRtrip: notesRtrip ?? _notesRtrip,
        file: file ?? _file,
        fileName: fileName ?? _fileName,
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

  num? get no => _no;

  String? get id => _id;

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

  num? get idOrigin => _idOrigin;

  dynamic get isDelegation => _isDelegation;

  String? get docCreatedAt => _docCreatedAt;

  num? get currentLevel => _currentLevel;

  String? get idRequestTrip => _idRequestTrip;

  String? get noRequestTrip => _noRequestTrip;

  dynamic get notesRtrip => _notesRtrip;

  dynamic get file => _file;

  dynamic get fileName => _fileName;

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

  String? get zonaName => _zonaName;

  num? get codeStatus => _codeStatus;

  String? get status => _status;

  String? get documentName => _documentName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no'] = _no;
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
    map['id_origin'] = _idOrigin;
    map['is_delegation'] = _isDelegation;
    map['doc_created_at'] = _docCreatedAt;
    map['current_level'] = _currentLevel;
    map['id_request_trip'] = _idRequestTrip;
    map['no_request_trip'] = _noRequestTrip;
    map['notes_rtrip'] = _notesRtrip;
    map['file'] = _file;
    map['file_name'] = _fileName;
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
