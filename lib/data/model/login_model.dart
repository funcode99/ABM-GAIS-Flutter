/// users : {"id":2,"name":"John Doe","is_employee":1,"id_company":1,"id_site":1,"id_role":1,"id_approval_auth":1,"company_name":"PT. Testing","company_code":"1234","site_name":"Surabaya","site_code":"SBY","id_employee":1,"employee_name":"Jhon Doe","sn_employee":"12345"}
/// token : {"success":true,"message":"Success","data":{"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIsInVzZXJzIjp7ImlkIjoyLCJ1c2VybmFtZSI6IjEyMzQ1IiwiZW1haWwiOiIxMjM0NUBtYWlsLmNvbSIsIm5hbWUiOiJKb2huIERvZSIsImlzX2VtcGxveWVlIjoxLCJpZF9yb2xlIjoxLCJpZF9hcHByb3ZhbF9hdXRoIjoxLCJpZF9jb21wYW55IjoxLCJpZF9zaXRlIjoxLCJjcmVhdGVkX2F0IjpudWxsLCJjcmVhdGVkX2J5IjpudWxsLCJ1cGRhdGVkX2F0IjpudWxsLCJ1cGRhdGVkX2J5IjpudWxsfSwiaXNzIjoiaHR0cDpcL1wvMTAzLjE2NS4xMzAuMTU3OjgwODZcL2FwaVwvbG9naW4iLCJpYXQiOjE2ODQ3ODMyODQsIm5iZiI6MTY4NDc4MzI4NCwianRpIjoiYXRLRWVVbk9MdWtxNENjdiJ9.w_Y-n-QqlnVPBFIrQuklQayujk373TT-ZHjyXWWgiis","token_type":"bearer","expires_in":0}}

class LoginModel {
  LoginModel({
      Users? users, 
      Token? token,}){
    _users = users;
    _token = token;
}

  LoginModel.fromJson(dynamic json) {
    _users = json['users'] != null ? Users.fromJson(json['users']) : null;
    _token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }
  Users? _users;
  Token? _token;
LoginModel copyWith({  Users? users,
  Token? token,
}) => LoginModel(  users: users ?? _users,
  token: token ?? _token,
);
  Users? get users => _users;
  Token? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_users != null) {
      map['users'] = _users?.toJson();
    }
    if (_token != null) {
      map['token'] = _token?.toJson();
    }
    return map;
  }

}

/// success : true
/// message : "Success"
/// data : {"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIsInVzZXJzIjp7ImlkIjoyLCJ1c2VybmFtZSI6IjEyMzQ1IiwiZW1haWwiOiIxMjM0NUBtYWlsLmNvbSIsIm5hbWUiOiJKb2huIERvZSIsImlzX2VtcGxveWVlIjoxLCJpZF9yb2xlIjoxLCJpZF9hcHByb3ZhbF9hdXRoIjoxLCJpZF9jb21wYW55IjoxLCJpZF9zaXRlIjoxLCJjcmVhdGVkX2F0IjpudWxsLCJjcmVhdGVkX2J5IjpudWxsLCJ1cGRhdGVkX2F0IjpudWxsLCJ1cGRhdGVkX2J5IjpudWxsfSwiaXNzIjoiaHR0cDpcL1wvMTAzLjE2NS4xMzAuMTU3OjgwODZcL2FwaVwvbG9naW4iLCJpYXQiOjE2ODQ3ODMyODQsIm5iZiI6MTY4NDc4MzI4NCwianRpIjoiYXRLRWVVbk9MdWtxNENjdiJ9.w_Y-n-QqlnVPBFIrQuklQayujk373TT-ZHjyXWWgiis","token_type":"bearer","expires_in":0}

class Token {
  Token({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  Token.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
Token copyWith({  bool? success,
  String? message,
  Data? data,
}) => Token(  success: success ?? _success,
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

/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIsInVzZXJzIjp7ImlkIjoyLCJ1c2VybmFtZSI6IjEyMzQ1IiwiZW1haWwiOiIxMjM0NUBtYWlsLmNvbSIsIm5hbWUiOiJKb2huIERvZSIsImlzX2VtcGxveWVlIjoxLCJpZF9yb2xlIjoxLCJpZF9hcHByb3ZhbF9hdXRoIjoxLCJpZF9jb21wYW55IjoxLCJpZF9zaXRlIjoxLCJjcmVhdGVkX2F0IjpudWxsLCJjcmVhdGVkX2J5IjpudWxsLCJ1cGRhdGVkX2F0IjpudWxsLCJ1cGRhdGVkX2J5IjpudWxsfSwiaXNzIjoiaHR0cDpcL1wvMTAzLjE2NS4xMzAuMTU3OjgwODZcL2FwaVwvbG9naW4iLCJpYXQiOjE2ODQ3ODMyODQsIm5iZiI6MTY4NDc4MzI4NCwianRpIjoiYXRLRWVVbk9MdWtxNENjdiJ9.w_Y-n-QqlnVPBFIrQuklQayujk373TT-ZHjyXWWgiis"
/// token_type : "bearer"
/// expires_in : 0

class Data {
  Data({
      String? accessToken, 
      String? tokenType, 
      num? expiresIn,}){
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresIn = expiresIn;
}

  Data.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
  }
  String? _accessToken;
  String? _tokenType;
  num? _expiresIn;
Data copyWith({  String? accessToken,
  String? tokenType,
  num? expiresIn,
}) => Data(  accessToken: accessToken ?? _accessToken,
  tokenType: tokenType ?? _tokenType,
  expiresIn: expiresIn ?? _expiresIn,
);
  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;
  num? get expiresIn => _expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    return map;
  }

}

/// id : 2
/// name : "John Doe"
/// is_employee : 1
/// id_company : 1
/// id_site : 1
/// id_role : 1
/// id_approval_auth : 1
/// company_name : "PT. Testing"
/// company_code : "1234"
/// site_name : "Surabaya"
/// site_code : "SBY"
/// id_employee : 1
/// employee_name : "Jhon Doe"
/// sn_employee : "12345"

class Users {
  Users({
      num? id, 
      String? name, 
      num? isEmployee, 
      num? idCompany, 
      num? idSite, 
      num? idRole, 
      num? idApprovalAuth, 
      String? companyName, 
      String? companyCode, 
      String? siteName, 
      String? siteCode, 
      num? idEmployee, 
      String? employeeName, 
      String? snEmployee,}){
    _id = id;
    _name = name;
    _isEmployee = isEmployee;
    _idCompany = idCompany;
    _idSite = idSite;
    _idRole = idRole;
    _idApprovalAuth = idApprovalAuth;
    _companyName = companyName;
    _companyCode = companyCode;
    _siteName = siteName;
    _siteCode = siteCode;
    _idEmployee = idEmployee;
    _employeeName = employeeName;
    _snEmployee = snEmployee;
}

  Users.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isEmployee = json['is_employee'];
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
    _idRole = json['id_role'];
    _idApprovalAuth = json['id_approval_auth'];
    _companyName = json['company_name'];
    _companyCode = json['company_code'];
    _siteName = json['site_name'];
    _siteCode = json['site_code'];
    _idEmployee = json['id_employee'];
    _employeeName = json['employee_name'];
    _snEmployee = json['sn_employee'];
  }
  num? _id;
  String? _name;
  num? _isEmployee;
  num? _idCompany;
  num? _idSite;
  num? _idRole;
  num? _idApprovalAuth;
  String? _companyName;
  String? _companyCode;
  String? _siteName;
  String? _siteCode;
  num? _idEmployee;
  String? _employeeName;
  String? _snEmployee;
Users copyWith({  num? id,
  String? name,
  num? isEmployee,
  num? idCompany,
  num? idSite,
  num? idRole,
  num? idApprovalAuth,
  String? companyName,
  String? companyCode,
  String? siteName,
  String? siteCode,
  num? idEmployee,
  String? employeeName,
  String? snEmployee,
}) => Users(  id: id ?? _id,
  name: name ?? _name,
  isEmployee: isEmployee ?? _isEmployee,
  idCompany: idCompany ?? _idCompany,
  idSite: idSite ?? _idSite,
  idRole: idRole ?? _idRole,
  idApprovalAuth: idApprovalAuth ?? _idApprovalAuth,
  companyName: companyName ?? _companyName,
  companyCode: companyCode ?? _companyCode,
  siteName: siteName ?? _siteName,
  siteCode: siteCode ?? _siteCode,
  idEmployee: idEmployee ?? _idEmployee,
  employeeName: employeeName ?? _employeeName,
  snEmployee: snEmployee ?? _snEmployee,
);
  num? get id => _id;
  String? get name => _name;
  num? get isEmployee => _isEmployee;
  num? get idCompany => _idCompany;
  num? get idSite => _idSite;
  num? get idRole => _idRole;
  num? get idApprovalAuth => _idApprovalAuth;
  String? get companyName => _companyName;
  String? get companyCode => _companyCode;
  String? get siteName => _siteName;
  String? get siteCode => _siteCode;
  num? get idEmployee => _idEmployee;
  String? get employeeName => _employeeName;
  String? get snEmployee => _snEmployee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['is_employee'] = _isEmployee;
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    map['id_role'] = _idRole;
    map['id_approval_auth'] = _idApprovalAuth;
    map['company_name'] = _companyName;
    map['company_code'] = _companyCode;
    map['site_name'] = _siteName;
    map['site_code'] = _siteCode;
    map['id_employee'] = _idEmployee;
    map['employee_name'] = _employeeName;
    map['sn_employee'] = _snEmployee;
    return map;
  }

}