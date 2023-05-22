/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"employee_name":"John Doe","phone_number":"0812345678","sn_employee":"12345","email":"12345@mail.com","nik":"1234123412341234123","dob":"1991-01-01 00:00:00","start_date":"1991-01-01 00:00:00","end_date":"1991-01-01 00:00:00","jenkel":"L","id_department":1,"id_company":1,"id_site":1,"foto":null,"foto_path":null,"created_at":"2023-05-10 05:00:56","created_by":"2","updated_at":"2023-05-10 05:00:56","updated_by":null,"site_name":"test","site_code":"1"}]

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
/// id_site : 1
/// foto : null
/// foto_path : null
/// created_at : "2023-05-10 05:00:56"
/// created_by : "2"
/// updated_at : "2023-05-10 05:00:56"
/// updated_by : null
/// site_name : "test"
/// site_code : "1"

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
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      String? companyName,
      String? siteName,
      String? siteCode,}){
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
    _siteName = siteName;
    _companyName = companyName;
    _siteCode = siteCode;
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
    _siteName = json['site_name'];
    _companyName = json['company_name'];
    _siteCode = json['site_code'];
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
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  String? _siteName;
  String? _companyName;
  String? _siteCode;
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
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
  String? siteName,
  String? companyName,
  String? siteCode,
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
  siteName: siteName ?? _siteName,
  companyName: _companyName ?? _companyName,
  siteCode: siteCode ?? _siteCode,
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
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  String? get siteName => _siteName;
  String? get companyName => _companyName;
  String? get siteCode => _siteCode;

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
    map['site_name'] = _siteName;
    map['company_name'] = _companyName;
    map['site_code'] = _siteCode;
    return map;
  }

}