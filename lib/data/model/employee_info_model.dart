/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"employee_name":"John Doe","phone_number":"0812345678","sn_employee":"12345","email":"12345@mail.com","nik":"1234123412341234123","dob":"1991-01-01 00:00:00","start_date":"1991-01-01 00:00:00","end_date":"1991-01-01 00:00:00","jenkel":"L","id_department":1,"id_company":1,"id_site":16,"id_job_band":76,"foto":null,"foto_path":null,"created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"deleted_at":null,"id_users":2,"site_name":"Jakarta, Cilandak","site_code":"KYB01","company_name":"PT Cipta Kridatama x","company_code":"3000","band_job_name":"Test A","hotel_fare":"500000","meals_rate":"250000","flight_class":"Economy Premium"}]

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

/// id : 1
/// employee_name : "John Doe"
/// phone_number : "0812345678"
/// sn_employee : "12345"
/// email : "12345@mail.com"
/// nik : "1234123412341234123"
/// dob : "1991-01-01 00:00:00"
/// start_date : "1991-01-01 00:00:00"
/// end_date : "1991-01-01 00:00:00"
/// jenkel : "L"
/// id_department : 1
/// id_company : 1
/// id_site : 16
/// id_job_band : 76
/// foto : null
/// foto_path : null
/// created_at : null
/// created_by : null
/// updated_at : null
/// updated_by : null
/// deleted_at : null
/// id_users : 2
/// site_name : "Jakarta, Cilandak"
/// site_code : "KYB01"
/// company_name : "PT Cipta Kridatama x"
/// company_code : "3000"
/// band_job_name : "Test A"
/// hotel_fare : "500000"
/// meals_rate : "250000"
/// flight_class : "Economy Premium"

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
      num? idJobBand, 
      dynamic foto, 
      dynamic fotoPath, 
      dynamic createdAt, 
      dynamic createdBy, 
      dynamic updatedAt, 
      dynamic updatedBy, 
      dynamic deletedAt, 
      num? idUsers, 
      String? siteName, 
      String? siteCode, 
      String? companyName, 
      String? companyCode, 
      String? bandJobName, 
      String? hotelFare, 
      String? mealsRate, 
      String? flightClass,}){
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
    _idJobBand = idJobBand;
    _foto = foto;
    _fotoPath = fotoPath;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _deletedAt = deletedAt;
    _idUsers = idUsers;
    _siteName = siteName;
    _siteCode = siteCode;
    _companyName = companyName;
    _companyCode = companyCode;
    _bandJobName = bandJobName;
    _hotelFare = hotelFare;
    _mealsRate = mealsRate;
    _flightClass = flightClass;
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
    _idJobBand = json['id_job_band'];
    _foto = json['foto'];
    _fotoPath = json['foto_path'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    _idUsers = json['id_users'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _companyName = json['company_name'];
    _companyCode = json['company_code'];
    _bandJobName = json['band_job_name'];
    _hotelFare = json['hotel_fare'];
    _mealsRate = json['meals_rate'];
    _flightClass = json['flight_class'];
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
  num? _idJobBand;
  dynamic _foto;
  dynamic _fotoPath;
  dynamic _createdAt;
  dynamic _createdBy;
  dynamic _updatedAt;
  dynamic _updatedBy;
  dynamic _deletedAt;
  num? _idUsers;
  String? _siteName;
  String? _siteCode;
  String? _companyName;
  String? _companyCode;
  String? _bandJobName;
  String? _hotelFare;
  String? _mealsRate;
  String? _flightClass;
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
  num? idJobBand,
  dynamic foto,
  dynamic fotoPath,
  dynamic createdAt,
  dynamic createdBy,
  dynamic updatedAt,
  dynamic updatedBy,
  dynamic deletedAt,
  num? idUsers,
  String? siteName,
  String? siteCode,
  String? companyName,
  String? companyCode,
  String? bandJobName,
  String? hotelFare,
  String? mealsRate,
  String? flightClass,
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
  idJobBand: idJobBand ?? _idJobBand,
  foto: foto ?? _foto,
  fotoPath: fotoPath ?? _fotoPath,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  deletedAt: deletedAt ?? _deletedAt,
  idUsers: idUsers ?? _idUsers,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
  companyName: companyName ?? _companyName,
  companyCode: companyCode ?? _companyCode,
  bandJobName: bandJobName ?? _bandJobName,
  hotelFare: hotelFare ?? _hotelFare,
  mealsRate: mealsRate ?? _mealsRate,
  flightClass: flightClass ?? _flightClass,
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
  num? get idJobBand => _idJobBand;
  dynamic get foto => _foto;
  dynamic get fotoPath => _fotoPath;
  dynamic get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  num? get idUsers => _idUsers;
  String? get siteName => _siteName;
  String? get siteCode => _siteCode;
  String? get companyName => _companyName;
  String? get companyCode => _companyCode;
  String? get bandJobName => _bandJobName;
  String? get hotelFare => _hotelFare;
  String? get mealsRate => _mealsRate;
  String? get flightClass => _flightClass;

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
    map['id_job_band'] = _idJobBand;
    map['foto'] = _foto;
    map['foto_path'] = _fotoPath;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['deleted_at'] = _deletedAt;
    map['id_users'] = _idUsers;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['company_name'] = _companyName;
    map['company_code'] = _companyCode;
    map['band_job_name'] = _bandJobName;
    map['hotel_fare'] = _hotelFare;
    map['meals_rate'] = _mealsRate;
    map['flight_class'] = _flightClass;
    return map;
  }

}