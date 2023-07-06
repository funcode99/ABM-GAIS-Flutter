/// success : true
/// message : "Success Get Data"
/// data : [{"no":1,"id":1,"employee_name":"Jhon Doe","phone_number":"08123456789","sn_employee":"12345","email":"12345@mail.com","nik":"12344321","dob":"1990-01-01 00:00:00","start_date":"2020-01-01 00:00:00","end_date":"2025-12-01 00:00:00","jenkel":"L","id_department":2,"id_company":1,"id_site":14,"id_job_band":76,"foto":null,"foto_path":null,"created_at":null,"created_by":null,"updated_at":"2023-06-07 06:06:16","updated_by":"2","deleted_at":null,"company_code":"3000","site_name":"Balikpapan, Sepinggan","site_code":"BPP02","band_job_name":"B","departement_name":null,"company_name":"PT Cipta Kridatama"},{"no":2,"id":2,"employee_name":"Admin","phone_number":"0812345678","sn_employee":"12345","email":"admin@mail.com","nik":"1234123412341234123","dob":"1991-01-01 00:00:00","start_date":"1991-01-01 00:00:00","end_date":"1991-01-01 00:00:00","jenkel":"L","id_department":1,"id_company":1,"id_site":1,"id_job_band":1,"foto":null,"foto_path":null,"created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"deleted_at":null,"company_code":"3000","site_name":null,"site_code":null,"band_job_name":"1","departement_name":null,"company_name":"PT Cipta Kridatama"},{"no":3,"id":3,"employee_name":"steven","phone_number":"08123456789","sn_employee":"123456","email":"steven@gmail.com","nik":"12344321","dob":"1990-01-01 00:00:00","start_date":"2020-01-01 00:00:00","end_date":"2025-01-01 00:00:00","jenkel":"L","id_department":2,"id_company":1,"id_site":1,"id_job_band":1,"foto":null,"foto_path":null,"created_at":"2023-05-29 15:05:32","created_by":"1","updated_at":"2023-05-29 15:05:32","updated_by":null,"deleted_at":null,"company_code":"3000","site_name":null,"site_code":null,"band_job_name":"1","departement_name":null,"company_name":"PT Cipta Kridatama"},{"no":4,"id":4,"employee_name":"Raden Mas Abdul Rahman Alhafizh Hutagalung","phone_number":"08988416727","sn_employee":"SN00001","email":"radenmasabdul@ml.co","nik":"3271000000000000001","dob":"1996-01-22 00:00:00","start_date":"2020-01-01 00:00:00","end_date":"2025-01-01 00:00:00","jenkel":"L","id_department":1,"id_company":1,"id_site":1,"id_job_band":1,"foto":"foto-abdul-resize.jpeg","foto_path":"http://103.165.130.157:8086/storage/files/employee/aWKlPKCNyOuVuN04gMQMmtTcQ5JQ5NNfbP8yBIQK.png","created_at":"2023-05-29 15:27:05","created_by":"1","updated_at":"2023-05-29 15:27:05","updated_by":null,"deleted_at":null,"company_code":"3000","site_name":null,"site_code":null,"band_job_name":"1","departement_name":null,"company_name":"PT Cipta Kridatama"}]

class GetEmployeeModel {
  GetEmployeeModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetEmployeeModel.fromJson(dynamic json) {
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
GetEmployeeModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetEmployeeModel(  success: success ?? _success,
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

/// no : 1
/// id : 1
/// employee_name : "Jhon Doe"
/// phone_number : "08123456789"
/// sn_employee : "12345"
/// email : "12345@mail.com"
/// nik : "12344321"
/// dob : "1990-01-01 00:00:00"
/// start_date : "2020-01-01 00:00:00"
/// end_date : "2025-12-01 00:00:00"
/// jenkel : "L"
/// id_department : 2
/// id_company : 1
/// id_site : 14
/// id_job_band : 76
/// foto : null
/// foto_path : null
/// created_at : null
/// created_by : null
/// updated_at : "2023-06-07 06:06:16"
/// updated_by : "2"
/// deleted_at : null
/// company_code : "3000"
/// site_name : "Balikpapan, Sepinggan"
/// site_code : "BPP02"
/// band_job_name : "B"
/// departement_name : null
/// company_name : "PT Cipta Kridatama"

class Data {
  Data({
      num? no, 
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
      String? idJobBand,
      dynamic foto, 
      dynamic fotoPath, 
      dynamic createdAt, 
      dynamic createdBy, 
      String? updatedAt, 
      String? updatedBy, 
      dynamic deletedAt, 
      String? companyCode, 
      String? siteName, 
      String? siteCode, 
      String? bandJobName, 
      dynamic departementName, 
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
    _idJobBand = idJobBand;
    _foto = foto;
    _fotoPath = fotoPath;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _deletedAt = deletedAt;
    _companyCode = companyCode;
    _siteName = siteName;
    _siteCode = siteCode;
    _bandJobName = bandJobName;
    _departementName = departementName;
    _companyName = companyName;
}

  Data.fromJson(dynamic json) {
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
    _idJobBand = json['id_job_band'];
    _foto = json['foto'];
    _fotoPath = json['foto_path'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    _companyCode = json['company_code'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _bandJobName = json['band_job_name'];
    _departementName = json['departement_name'];
    _companyName = json['company_name'];
  }
  num? _no;
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
  String? _idJobBand;
  dynamic _foto;
  dynamic _fotoPath;
  dynamic _createdAt;
  dynamic _createdBy;
  String? _updatedAt;
  String? _updatedBy;
  dynamic _deletedAt;
  String? _companyCode;
  String? _siteName;
  String? _siteCode;
  String? _bandJobName;
  dynamic _departementName;
  String? _companyName;
Data copyWith({  num? no,
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
  String? idJobBand,
  dynamic foto,
  dynamic fotoPath,
  dynamic createdAt,
  dynamic createdBy,
  String? updatedAt,
  String? updatedBy,
  dynamic deletedAt,
  String? companyCode,
  String? siteName,
  String? siteCode,
  String? bandJobName,
  dynamic departementName,
  String? companyName,
}) => Data(  no: no ?? _no,
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
  idJobBand: idJobBand ?? _idJobBand,
  foto: foto ?? _foto,
  fotoPath: fotoPath ?? _fotoPath,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  deletedAt: deletedAt ?? _deletedAt,
  companyCode: companyCode ?? _companyCode,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
  bandJobName: bandJobName ?? _bandJobName,
  departementName: departementName ?? _departementName,
  companyName: companyName ?? _companyName,
);
  num? get no => _no;
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
  String? get idJobBand => _idJobBand;
  dynamic get foto => _foto;
  dynamic get fotoPath => _fotoPath;
  dynamic get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  String? get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;
  String? get companyCode => _companyCode;
  String? get siteName => _siteName;
  String? get siteCode => _siteCode;
  String? get bandJobName => _bandJobName;
  dynamic get departementName => _departementName;
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
    map['id_job_band'] = _idJobBand;
    map['foto'] = _foto;
    map['foto_path'] = _fotoPath;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['deleted_at'] = _deletedAt;
    map['company_code'] = _companyCode;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['band_job_name'] = _bandJobName;
    map['departement_name'] = _departementName;
    map['company_name'] = _companyName;
    return map;
  }

}