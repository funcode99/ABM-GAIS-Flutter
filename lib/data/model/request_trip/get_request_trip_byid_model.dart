class GetRequestTripByidModel {
  GetRequestTripByidModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetRequestTripByidModel.fromJson(dynamic json) {
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
GetRequestTripByidModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetRequestTripByidModel(  success: success ?? _success,
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

class Data {
  Data({
      String? id,
      dynamic idEmployee,
      String? noRequestTrip,
      String? codeDocument,
      num? idSite,
      String? notes,
      String? file,
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
      dynamic deletedAt,
      dynamic currentLevel,
      dynamic isClaim,
      num? idCompany,
      num? idDepartement,
      num? idCostCenter,
      String? fileName,
      String? numberDa,
      String? employeeName,
      String? snEmployee,
      String? siteName,
      String? siteCode,
      String? zonaName,
      num? code,
      String? status,
      num? idDocument,
      String? documentName,
      String? nameCityFrom,
      String? nameCityTo,}){
    _id = id;
    _idEmployee = idEmployee;
    _noRequestTrip = noRequestTrip;
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
    _deletedAt = deletedAt;
    _currentLevel = currentLevel;
    _isClaim = isClaim;
    _idCompany = idCompany;
    _idDepartement = idDepartement;
    _idCostCenter = idCostCenter;
    _fileName = fileName;
    _numberDa = numberDa;
    _employeeName = employeeName;
    _snEmployee = snEmployee;
    _siteName = siteName;
    _siteCode = siteCode;
    _zonaName = zonaName;
    _code = code;
    _status = status;
    _idDocument = idDocument;
    _documentName = documentName;
    _nameCityFrom = nameCityFrom;
    _nameCityTo = nameCityTo;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idEmployee = json['id_employee'];
    _noRequestTrip = json['no_request_trip'];
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
    _deletedAt = json['deleted_at'];
    _currentLevel = json['current_level'];
    _isClaim = json['is_claim'];
    _idCompany = json['id_company'];
    _idDepartement = json['id_departement'];
    _idCostCenter = json['id_cost_center'];
    _fileName = json['file_name'];
    _numberDa = json['number_da'];
    _employeeName = json['employee_name'];
    _snEmployee = json['sn_employee'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _zonaName = json['zona_name'];
    _code = json['code'];
    _status = json['status'];
    _idDocument = json['id_document'];
    _documentName = json['document_name'];
    _nameCityFrom = json['name_city_from'];
    _nameCityTo = json['name_city_to'];
  }
  String? _id;
  dynamic _idEmployee;
  String? _noRequestTrip;
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
  dynamic _deletedAt;
  dynamic _currentLevel;
  dynamic _isClaim;
  num? _idCompany;
  num? _idDepartement;
  num? _idCostCenter;
  String? _fileName;
  String? _numberDa;
  String? _employeeName;
  String? _snEmployee;
  String? _siteName;
  String? _siteCode;
  String? _zonaName;
  num? _code;
  String? _status;
  num? _idDocument;
  String? _documentName;
  String? _nameCityFrom;
  String? _nameCityTo;
Data copyWith({  String? id,
  dynamic idEmployee,
  String? noRequestTrip,
  String? codeDocument,
  num? idSite,
  String? notes,
  String? file,
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
  dynamic deletedAt,
  dynamic currentLevel,
  dynamic isClaim,
  num? idCompany,
  num? idDepartement,
  num? idCostCenter,
  String? fileName,
  String? numberDa,
  String? employeeName,
  String? snEmployee,
  String? siteName,
  String? siteCode,
  String? zonaName,
  num? code,
  String? status,
  num? idDocument,
  String? documentName,
  String? nameCityFrom,
  String? nameCityTo,
}) => Data(  id: id ?? _id,
  idEmployee: idEmployee ?? _idEmployee,
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
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
  deletedAt: deletedAt ?? _deletedAt,
  currentLevel: currentLevel ?? _currentLevel,
  isClaim: isClaim ?? _isClaim,
  idCompany: idCompany ?? _idCompany,
  idDepartement: idDepartement ?? _idDepartement,
  idCostCenter: idCostCenter ?? _idCostCenter,
  fileName: fileName ?? _fileName,
  numberDa: numberDa ?? _numberDa,
  employeeName: employeeName ?? _employeeName,
  snEmployee: snEmployee ?? _snEmployee,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
  zonaName: zonaName ?? _zonaName,
  code: code ?? _code,
  status: status ?? _status,
  idDocument: idDocument ?? _idDocument,
  documentName: documentName ?? _documentName,
  nameCityFrom: nameCityFrom ?? _nameCityFrom,
  nameCityTo: nameCityTo ?? _nameCityTo,
);
  String? get id => _id;
  dynamic get idEmployee => _idEmployee;
  String? get noRequestTrip => _noRequestTrip;
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
  dynamic get deletedAt => _deletedAt;
  dynamic get currentLevel => _currentLevel;
  dynamic get isClaim => _isClaim;
  num? get idCompany => _idCompany;
  num? get idDepartement => _idDepartement;
  num? get idCostCenter => _idCostCenter;
  String? get fileName => _fileName;
  String? get numberDa => _numberDa;
  String? get employeeName => _employeeName;
  String? get snEmployee => _snEmployee;
  String? get siteName => _siteName;
  String? get siteCode => _siteCode;
  String? get zonaName => _zonaName;
  num? get code => _code;
  String? get status => _status;
  num? get idDocument => _idDocument;
  String? get documentName => _documentName;
  String? get nameCityFrom => _nameCityFrom;
  String? get nameCityTo => _nameCityTo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_employee'] = _idEmployee;
    map['no_request_trip'] = _noRequestTrip;
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
    map['deleted_at'] = _deletedAt;
    map['current_level'] = _currentLevel;
    map['is_claim'] = _isClaim;
    map['id_company'] = _idCompany;
    map['id_departement'] = _idDepartement;
    map['id_cost_center'] = _idCostCenter;
    map['file_name'] = _fileName;
    map['number_da'] = _numberDa;
    map['employee_name'] = _employeeName;
    map['sn_employee'] = _snEmployee;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['zona_name'] = _zonaName;
    map['code'] = _code;
    map['status'] = _status;
    map['id_document'] = _idDocument;
    map['document_name'] = _documentName;
    map['name_city_from'] = _nameCityFrom;
    map['name_city_to'] = _nameCityTo;
    return map;
  }

}