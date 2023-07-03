/// success : true
/// message : "Success Get Data"
/// data : [{"id":8,"employee_name":"Atasan Langsung - Sofyan","phone_number":"08654321678","sn_employee":"654321","email":"AL@mail.com","nik":"1234123412341234123","dob":"1991-01-01 00:00:00","start_date":"1991-01-01 00:00:00","end_date":"1991-01-01 00:00:00","jenkel":"L","id_department":1,"id_company":1,"id_site":18,"foto":null,"foto_path":null,"created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"deleted_at":null,"sn_atasan_1":null,"sn_atasan_2":null,"is_registered":null,"id_cost_center":null,"is_terminated":null,"position_code":null,"position_level":null,"position_tittle":null,"id_job_band":1,"band_job_name":"A","id_users":8,"site_name":"Lahat, Kebur x","site_code":"LHT01","company_name":"PT Cipta Kridatama","company_code":"3000","company_logo_path":"http://38.47.76.138:8013/storage/files/company/tDmg9U1JS9B6e3sCnX6eGgNk6o4HhmRGh2mFLnsy.png","cost_center_name":null,"cost_center_code":null,"group_company_code":"MVC","group_company_name":"MVC","group_company_logo":"mvc.png","group_company_logo_path":"http://38.47.76.138:8013/storage/files/group_company/xctsQEdTjKg8TnPhNRePxie7boyRUyCpQxY7ToYZ.png","hotel_fare":"15000","meals_rate":"25000","id_flight_class":63,"flight_class":"First Class","tlk_rate":[{"tlk":"120000","zona_name":"A"},{"tlk":"10000","zona_name":"B"}]}]

class EmployeeInfoModel {
  EmployeeInfoModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  EmployeeInfoModel.fromJson(dynamic json) {
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
EmployeeInfoModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => EmployeeInfoModel(  success: success ?? _success,
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

/// id : 8
/// employee_name : "Atasan Langsung - Sofyan"
/// phone_number : "08654321678"
/// sn_employee : "654321"
/// email : "AL@mail.com"
/// nik : "1234123412341234123"
/// dob : "1991-01-01 00:00:00"
/// start_date : "1991-01-01 00:00:00"
/// end_date : "1991-01-01 00:00:00"
/// jenkel : "L"
/// id_department : 1
/// id_company : 1
/// id_site : 18
/// foto : null
/// foto_path : null
/// created_at : null
/// created_by : null
/// updated_at : null
/// updated_by : null
/// deleted_at : null
/// sn_atasan_1 : null
/// sn_atasan_2 : null
/// is_registered : null
/// id_cost_center : null
/// is_terminated : null
/// position_code : null
/// position_level : null
/// position_tittle : null
/// id_job_band : 1
/// band_job_name : "A"
/// id_users : 8
/// site_name : "Lahat, Kebur x"
/// site_code : "LHT01"
/// company_name : "PT Cipta Kridatama"
/// company_code : "3000"
/// company_logo_path : "http://38.47.76.138:8013/storage/files/company/tDmg9U1JS9B6e3sCnX6eGgNk6o4HhmRGh2mFLnsy.png"
/// cost_center_name : null
/// cost_center_code : null
/// group_company_code : "MVC"
/// group_company_name : "MVC"
/// group_company_logo : "mvc.png"
/// group_company_logo_path : "http://38.47.76.138:8013/storage/files/group_company/xctsQEdTjKg8TnPhNRePxie7boyRUyCpQxY7ToYZ.png"
/// hotel_fare : "15000"
/// meals_rate : "25000"
/// id_flight_class : 63
/// flight_class : "First Class"
/// tlk_rate : [{"tlk":"120000","zona_name":"A"},{"tlk":"10000","zona_name":"B"}]

class Data {
  Data({
      num? id, 
      String? employeeName, 
      String? phoneNumber, 
      String? snEmployee, 
      String? email, 
      String? nik, 
      String? dob, 
      String? startDate, 
      String? endDate, 
      String? jenkel, 
      num? idDepartment, 
      num? idCompany, 
      num? idSite, 
      dynamic foto, 
      dynamic fotoPath, 
      dynamic createdAt, 
      dynamic createdBy, 
      dynamic updatedAt, 
      dynamic updatedBy, 
      dynamic deletedAt, 
      dynamic snAtasan1, 
      dynamic snAtasan2, 
      dynamic isRegistered, 
      dynamic idCostCenter, 
      dynamic isTerminated, 
      dynamic positionCode, 
      dynamic positionLevel, 
      dynamic positionTittle, 
      num? idJobBand, 
      String? bandJobName, 
      num? idUsers, 
      String? siteName, 
      String? siteCode, 
      String? companyName, 
      String? companyCode, 
      String? companyLogoPath, 
      dynamic costCenterName, 
      dynamic costCenterCode, 
      String? groupCompanyCode, 
      String? groupCompanyName, 
      String? groupCompanyLogo, 
      String? groupCompanyLogoPath, 
      String? hotelFare, 
      String? mealsRate, 
      num? idFlightClass, 
      String? flightClass, 
      List<TlkRate>? tlkRate,}){
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
    _bandJobName = bandJobName;
    _idUsers = idUsers;
    _siteName = siteName;
    _siteCode = siteCode;
    _companyName = companyName;
    _companyCode = companyCode;
    _companyLogoPath = companyLogoPath;
    _costCenterName = costCenterName;
    _costCenterCode = costCenterCode;
    _groupCompanyCode = groupCompanyCode;
    _groupCompanyName = groupCompanyName;
    _groupCompanyLogo = groupCompanyLogo;
    _groupCompanyLogoPath = groupCompanyLogoPath;
    _hotelFare = hotelFare;
    _mealsRate = mealsRate;
    _idFlightClass = idFlightClass;
    _flightClass = flightClass;
    _tlkRate = tlkRate;
}

  Data.fromJson(dynamic json) {
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
    _bandJobName = json['band_job_name'];
    _idUsers = json['id_users'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _companyName = json['company_name'];
    _companyCode = json['company_code'];
    _companyLogoPath = json['company_logo_path'];
    _costCenterName = json['cost_center_name'];
    _costCenterCode = json['cost_center_code'];
    _groupCompanyCode = json['group_company_code'];
    _groupCompanyName = json['group_company_name'];
    _groupCompanyLogo = json['group_company_logo'];
    _groupCompanyLogoPath = json['group_company_logo_path'];
    _hotelFare = json['hotel_fare'];
    _mealsRate = json['meals_rate'];
    _idFlightClass = json['id_flight_class'];
    _flightClass = json['flight_class'];
    if (json['tlk_rate'] != null) {
      _tlkRate = [];
      json['tlk_rate'].forEach((v) {
        _tlkRate?.add(TlkRate.fromJson(v));
      });
    }
  }
  num? _id;
  String? _employeeName;
  String? _phoneNumber;
  String? _snEmployee;
  String? _email;
  String? _nik;
  String? _dob;
  String? _startDate;
  String? _endDate;
  String? _jenkel;
  num? _idDepartment;
  num? _idCompany;
  num? _idSite;
  dynamic _foto;
  dynamic _fotoPath;
  dynamic _createdAt;
  dynamic _createdBy;
  dynamic _updatedAt;
  dynamic _updatedBy;
  dynamic _deletedAt;
  dynamic _snAtasan1;
  dynamic _snAtasan2;
  dynamic _isRegistered;
  dynamic _idCostCenter;
  dynamic _isTerminated;
  dynamic _positionCode;
  dynamic _positionLevel;
  dynamic _positionTittle;
  num? _idJobBand;
  String? _bandJobName;
  num? _idUsers;
  String? _siteName;
  String? _siteCode;
  String? _companyName;
  String? _companyCode;
  String? _companyLogoPath;
  dynamic _costCenterName;
  dynamic _costCenterCode;
  String? _groupCompanyCode;
  String? _groupCompanyName;
  String? _groupCompanyLogo;
  String? _groupCompanyLogoPath;
  String? _hotelFare;
  String? _mealsRate;
  num? _idFlightClass;
  String? _flightClass;
  List<TlkRate>? _tlkRate;
Data copyWith({  num? id,
  String? employeeName,
  String? phoneNumber,
  String? snEmployee,
  String? email,
  String? nik,
  String? dob,
  String? startDate,
  String? endDate,
  String? jenkel,
  num? idDepartment,
  num? idCompany,
  num? idSite,
  dynamic foto,
  dynamic fotoPath,
  dynamic createdAt,
  dynamic createdBy,
  dynamic updatedAt,
  dynamic updatedBy,
  dynamic deletedAt,
  dynamic snAtasan1,
  dynamic snAtasan2,
  dynamic isRegistered,
  dynamic idCostCenter,
  dynamic isTerminated,
  dynamic positionCode,
  dynamic positionLevel,
  dynamic positionTittle,
  num? idJobBand,
  String? bandJobName,
  num? idUsers,
  String? siteName,
  String? siteCode,
  String? companyName,
  String? companyCode,
  String? companyLogoPath,
  dynamic costCenterName,
  dynamic costCenterCode,
  String? groupCompanyCode,
  String? groupCompanyName,
  String? groupCompanyLogo,
  String? groupCompanyLogoPath,
  String? hotelFare,
  String? mealsRate,
  num? idFlightClass,
  String? flightClass,
  List<TlkRate>? tlkRate,
}) => Data(  id: id ?? _id,
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
  bandJobName: bandJobName ?? _bandJobName,
  idUsers: idUsers ?? _idUsers,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
  companyName: companyName ?? _companyName,
  companyCode: companyCode ?? _companyCode,
  companyLogoPath: companyLogoPath ?? _companyLogoPath,
  costCenterName: costCenterName ?? _costCenterName,
  costCenterCode: costCenterCode ?? _costCenterCode,
  groupCompanyCode: groupCompanyCode ?? _groupCompanyCode,
  groupCompanyName: groupCompanyName ?? _groupCompanyName,
  groupCompanyLogo: groupCompanyLogo ?? _groupCompanyLogo,
  groupCompanyLogoPath: groupCompanyLogoPath ?? _groupCompanyLogoPath,
  hotelFare: hotelFare ?? _hotelFare,
  mealsRate: mealsRate ?? _mealsRate,
  idFlightClass: idFlightClass ?? _idFlightClass,
  flightClass: flightClass ?? _flightClass,
  tlkRate: tlkRate ?? _tlkRate,
);
  num? get id => _id;
  String? get employeeName => _employeeName;
  String? get phoneNumber => _phoneNumber;
  String? get snEmployee => _snEmployee;
  String? get email => _email;
  String? get nik => _nik;
  String? get dob => _dob;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get jenkel => _jenkel;
  num? get idDepartment => _idDepartment;
  num? get idCompany => _idCompany;
  num? get idSite => _idSite;
  dynamic get foto => _foto;
  dynamic get fotoPath => _fotoPath;
  dynamic get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  dynamic get snAtasan1 => _snAtasan1;
  dynamic get snAtasan2 => _snAtasan2;
  dynamic get isRegistered => _isRegistered;
  dynamic get idCostCenter => _idCostCenter;
  dynamic get isTerminated => _isTerminated;
  dynamic get positionCode => _positionCode;
  dynamic get positionLevel => _positionLevel;
  dynamic get positionTittle => _positionTittle;
  num? get idJobBand => _idJobBand;
  String? get bandJobName => _bandJobName;
  num? get idUsers => _idUsers;
  String? get siteName => _siteName;
  String? get siteCode => _siteCode;
  String? get companyName => _companyName;
  String? get companyCode => _companyCode;
  String? get companyLogoPath => _companyLogoPath;
  dynamic get costCenterName => _costCenterName;
  dynamic get costCenterCode => _costCenterCode;
  String? get groupCompanyCode => _groupCompanyCode;
  String? get groupCompanyName => _groupCompanyName;
  String? get groupCompanyLogo => _groupCompanyLogo;
  String? get groupCompanyLogoPath => _groupCompanyLogoPath;
  String? get hotelFare => _hotelFare;
  String? get mealsRate => _mealsRate;
  num? get idFlightClass => _idFlightClass;
  String? get flightClass => _flightClass;
  List<TlkRate>? get tlkRate => _tlkRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    map['band_job_name'] = _bandJobName;
    map['id_users'] = _idUsers;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['company_name'] = _companyName;
    map['company_code'] = _companyCode;
    map['company_logo_path'] = _companyLogoPath;
    map['cost_center_name'] = _costCenterName;
    map['cost_center_code'] = _costCenterCode;
    map['group_company_code'] = _groupCompanyCode;
    map['group_company_name'] = _groupCompanyName;
    map['group_company_logo'] = _groupCompanyLogo;
    map['group_company_logo_path'] = _groupCompanyLogoPath;
    map['hotel_fare'] = _hotelFare;
    map['meals_rate'] = _mealsRate;
    map['id_flight_class'] = _idFlightClass;
    map['flight_class'] = _flightClass;
    if (_tlkRate != null) {
      map['tlk_rate'] = _tlkRate?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// tlk : "120000"
/// zona_name : "A"

class TlkRate {
  TlkRate({
      String? tlk, 
      String? zonaName,}){
    _tlk = tlk;
    _zonaName = zonaName;
}

  TlkRate.fromJson(dynamic json) {
    _tlk = json['tlk'];
    _zonaName = json['zona_name'];
  }
  String? _tlk;
  String? _zonaName;
TlkRate copyWith({  String? tlk,
  String? zonaName,
}) => TlkRate(  tlk: tlk ?? _tlk,
  zonaName: zonaName ?? _zonaName,
);
  String? get tlk => _tlk;
  String? get zonaName => _zonaName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tlk'] = _tlk;
    map['zona_name'] = _zonaName;
    return map;
  }

}