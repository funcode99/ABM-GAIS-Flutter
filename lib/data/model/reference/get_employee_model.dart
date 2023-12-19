class GetEmployeeModel {
  GetEmployeeModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetEmployeeModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetEmployeeModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetEmployeeModel(  success: success ?? _success,
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
      int? currentPage, 
      List<Data2>? data,
      String? firstPageUrl, 
      int? from, 
      int? lastPage, 
      String? lastPageUrl, 
      List<Links>? links, 
      String? nextPageUrl, 
      String? path, 
      String? perPage, 
      dynamic prevPageUrl, 
      int? to, 
      int? total,}){
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
  int? _currentPage;
  List<Data2>? _data;
  String? _firstPageUrl;
  int? _from;
  int? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  String? _nextPageUrl;
  String? _path;
  String? _perPage;
  dynamic _prevPageUrl;
  int? _to;
  int? _total;
Data copyWith({  int? currentPage,
  List<Data2>? data,
  String? firstPageUrl,
  int? from,
  int? lastPage,
  String? lastPageUrl,
  List<Links>? links,
  String? nextPageUrl,
  String? path,
  String? perPage,
  dynamic prevPageUrl,
  int? to,
  int? total,
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
  int? get currentPage => _currentPage;
  List<Data2>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  int? get from => _from;
  int? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  List<Links>? get links => _links;
  String? get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  String? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  int? get to => _to;
  int? get total => _total;

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

class Data2 {
  Data2({
      int? no, 
      int? id, 
      String? employeeName, 
      String? phoneNumber, 
      String? snEmployee, 
      String? email, 
      String? nik, 
      String? dob, 
      String? startDate, 
      String? endDate, 
      String? jenkel, 
      int? idDepartment, 
      int? idCompany, 
      int? idSite, 
      dynamic foto, 
      dynamic fotoPath, 
      dynamic createdAt, 
      dynamic createdBy, 
      dynamic updatedAt, 
      dynamic updatedBy, 
      dynamic deletedAt, 
      String? snAtasan1, 
      String? snAtasan2, 
      dynamic isRegistered, 
      int? idCostCenter, 
      dynamic isTerminated, 
      dynamic positionCode, 
      dynamic positionLevel, 
      dynamic positionTittle, 
      String? idJobBand, 
      dynamic l1, 
      dynamic l2, 
      dynamic l3, 
      dynamic l4, 
      dynamic l5, 
      dynamic l6, 
      String? companyCode, 
      String? siteName, 
      String? siteCode, 
      String? departementName, 
      String? costCenterName, 
      String? costCenterCode, 
      String? companyName,}){
    _no = no;
    _id = id;
    _employeeName = employeeName;
    _phoneNumber = phoneNumber;
    _snEmployee = snEmployee;
    _email = email;
    _nik = nik;
    _dob = dob;
    _startDate = startDate;
    _endDate = endDate;
    _jenkel = jenkel;
    _idDepartment = idDepartment;
    _idCompany = idCompany;
    _idSite = idSite;
    _foto = foto;
    _fotoPath = fotoPath;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _deletedAt = deletedAt;
    _snAtasan1 = snAtasan1;
    _snAtasan2 = snAtasan2;
    _isRegistered = isRegistered;
    _idCostCenter = idCostCenter;
    _isTerminated = isTerminated;
    _positionCode = positionCode;
    _positionLevel = positionLevel;
    _positionTittle = positionTittle;
    _idJobBand = idJobBand;
    _l1 = l1;
    _l2 = l2;
    _l3 = l3;
    _l4 = l4;
    _l5 = l5;
    _l6 = l6;
    _companyCode = companyCode;
    _siteName = siteName;
    _siteCode = siteCode;
    _departementName = departementName;
    _costCenterName = costCenterName;
    _costCenterCode = costCenterCode;
    _companyName = companyName;
}

  Data2.fromJson(dynamic json) {
    _no = json['no'];
    _id = json['id'];
    _employeeName = json['employee_name'];
    _phoneNumber = json['phone_number'];
    _snEmployee = json['sn_employee'];
    _email = json['email'];
    _nik = json['nik'];
    _dob = json['dob'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _jenkel = json['jenkel'];
    _idDepartment = json['id_department'];
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
    _foto = json['foto'];
    _fotoPath = json['foto_path'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    _snAtasan1 = json['sn_atasan_1'];
    _snAtasan2 = json['sn_atasan_2'];
    _isRegistered = json['is_registered'];
    _idCostCenter = json['id_cost_center'];
    _isTerminated = json['is_terminated'];
    _positionCode = json['position_code'];
    _positionLevel = json['position_level'];
    _positionTittle = json['position_tittle'];
    _idJobBand = json['id_job_band'];
    _l1 = json['L1'];
    _l2 = json['L2'];
    _l3 = json['L3'];
    _l4 = json['L4'];
    _l5 = json['L5'];
    _l6 = json['L6'];
    _companyCode = json['company_code'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _departementName = json['departement_name'];
    _costCenterName = json['cost_center_name'];
    _costCenterCode = json['cost_center_code'];
    _companyName = json['company_name'];
  }
  int? _no;
  int? _id;
  String? _employeeName;
  String? _phoneNumber;
  String? _snEmployee;
  String? _email;
  String? _nik;
  String? _dob;
  String? _startDate;
  String? _endDate;
  String? _jenkel;
  int? _idDepartment;
  int? _idCompany;
  int? _idSite;
  dynamic _foto;
  dynamic _fotoPath;
  dynamic _createdAt;
  dynamic _createdBy;
  dynamic _updatedAt;
  dynamic _updatedBy;
  dynamic _deletedAt;
  String? _snAtasan1;
  String? _snAtasan2;
  dynamic _isRegistered;
  int? _idCostCenter;
  dynamic _isTerminated;
  dynamic _positionCode;
  dynamic _positionLevel;
  dynamic _positionTittle;
  String? _idJobBand;
  dynamic _l1;
  dynamic _l2;
  dynamic _l3;
  dynamic _l4;
  dynamic _l5;
  dynamic _l6;
  String? _companyCode;
  String? _siteName;
  String? _siteCode;
  String? _departementName;
  String? _costCenterName;
  String? _costCenterCode;
  String? _companyName;
Data2 copyWith({  int? no,
  int? id,
  String? employeeName,
  String? phoneNumber,
  String? snEmployee,
  String? email,
  String? nik,
  String? dob,
  String? startDate,
  String? endDate,
  String? jenkel,
  int? idDepartment,
  int? idCompany,
  int? idSite,
  dynamic foto,
  dynamic fotoPath,
  dynamic createdAt,
  dynamic createdBy,
  dynamic updatedAt,
  dynamic updatedBy,
  dynamic deletedAt,
  String? snAtasan1,
  String? snAtasan2,
  dynamic isRegistered,
  int? idCostCenter,
  dynamic isTerminated,
  dynamic positionCode,
  dynamic positionLevel,
  dynamic positionTittle,
  String? idJobBand,
  dynamic l1,
  dynamic l2,
  dynamic l3,
  dynamic l4,
  dynamic l5,
  dynamic l6,
  String? companyCode,
  String? siteName,
  String? siteCode,
  String? departementName,
  String? costCenterName,
  String? costCenterCode,
  String? companyName,
}) => Data2(  no: no ?? _no,
  id: id ?? _id,
  employeeName: employeeName ?? _employeeName,
  phoneNumber: phoneNumber ?? _phoneNumber,
  snEmployee: snEmployee ?? _snEmployee,
  email: email ?? _email,
  nik: nik ?? _nik,
  dob: dob ?? _dob,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  jenkel: jenkel ?? _jenkel,
  idDepartment: idDepartment ?? _idDepartment,
  idCompany: idCompany ?? _idCompany,
  idSite: idSite ?? _idSite,
  foto: foto ?? _foto,
  fotoPath: fotoPath ?? _fotoPath,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  deletedAt: deletedAt ?? _deletedAt,
  snAtasan1: snAtasan1 ?? _snAtasan1,
  snAtasan2: snAtasan2 ?? _snAtasan2,
  isRegistered: isRegistered ?? _isRegistered,
  idCostCenter: idCostCenter ?? _idCostCenter,
  isTerminated: isTerminated ?? _isTerminated,
  positionCode: positionCode ?? _positionCode,
  positionLevel: positionLevel ?? _positionLevel,
  positionTittle: positionTittle ?? _positionTittle,
  idJobBand: idJobBand ?? _idJobBand,
  l1: l1 ?? _l1,
  l2: l2 ?? _l2,
  l3: l3 ?? _l3,
  l4: l4 ?? _l4,
  l5: l5 ?? _l5,
  l6: l6 ?? _l6,
  companyCode: companyCode ?? _companyCode,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
  departementName: departementName ?? _departementName,
  costCenterName: costCenterName ?? _costCenterName,
  costCenterCode: costCenterCode ?? _costCenterCode,
  companyName: companyName ?? _companyName,
);
  int? get no => _no;
  int? get id => _id;
  String? get employeeName => _employeeName;
  String? get phoneNumber => _phoneNumber;
  String? get snEmployee => _snEmployee;
  String? get email => _email;
  String? get nik => _nik;
  String? get dob => _dob;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get jenkel => _jenkel;
  int? get idDepartment => _idDepartment;
  int? get idCompany => _idCompany;
  int? get idSite => _idSite;
  dynamic get foto => _foto;
  dynamic get fotoPath => _fotoPath;
  dynamic get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  String? get snAtasan1 => _snAtasan1;
  String? get snAtasan2 => _snAtasan2;
  dynamic get isRegistered => _isRegistered;
  int? get idCostCenter => _idCostCenter;
  dynamic get isTerminated => _isTerminated;
  dynamic get positionCode => _positionCode;
  dynamic get positionLevel => _positionLevel;
  dynamic get positionTittle => _positionTittle;
  String? get idJobBand => _idJobBand;
  dynamic get l1 => _l1;
  dynamic get l2 => _l2;
  dynamic get l3 => _l3;
  dynamic get l4 => _l4;
  dynamic get l5 => _l5;
  dynamic get l6 => _l6;
  String? get companyCode => _companyCode;
  String? get siteName => _siteName;
  String? get siteCode => _siteCode;
  String? get departementName => _departementName;
  String? get costCenterName => _costCenterName;
  String? get costCenterCode => _costCenterCode;
  String? get companyName => _companyName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no'] = _no;
    map['id'] = _id;
    map['employee_name'] = _employeeName;
    map['phone_number'] = _phoneNumber;
    map['sn_employee'] = _snEmployee;
    map['email'] = _email;
    map['nik'] = _nik;
    map['dob'] = _dob;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['jenkel'] = _jenkel;
    map['id_department'] = _idDepartment;
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    map['foto'] = _foto;
    map['foto_path'] = _fotoPath;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['deleted_at'] = _deletedAt;
    map['sn_atasan_1'] = _snAtasan1;
    map['sn_atasan_2'] = _snAtasan2;
    map['is_registered'] = _isRegistered;
    map['id_cost_center'] = _idCostCenter;
    map['is_terminated'] = _isTerminated;
    map['position_code'] = _positionCode;
    map['position_level'] = _positionLevel;
    map['position_tittle'] = _positionTittle;
    map['id_job_band'] = _idJobBand;
    map['L1'] = _l1;
    map['L2'] = _l2;
    map['L3'] = _l3;
    map['L4'] = _l4;
    map['L5'] = _l5;
    map['L6'] = _l6;
    map['company_code'] = _companyCode;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['departement_name'] = _departementName;
    map['cost_center_name'] = _costCenterName;
    map['cost_center_code'] = _costCenterCode;
    map['company_name'] = _companyName;
    return map;
  }

}