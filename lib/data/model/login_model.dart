/// users : {"id":1,"username":"admin","email":"admin@mail.com","is_employee":0,"id_role":0,"id_approval_auth":0,"id_company":0,"id_site":0,"created_at":null,"created_by":null,"updated_at":null,"updated_by":null}
/// token : {"success":true,"message":"Success","data":{"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsInVzZXJzIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBtYWlsLmNvbSIsImlzX2VtcGxveWVlIjowLCJpZF9yb2xlIjowLCJpZF9hcHByb3ZhbF9hdXRoIjowLCJpZF9jb21wYW55IjowLCJpZF9zaXRlIjowLCJjcmVhdGVkX2F0IjpudWxsLCJjcmVhdGVkX2J5IjpudWxsLCJ1cGRhdGVkX2F0IjpudWxsLCJ1cGRhdGVkX2J5IjpudWxsfSwiaXNzIjoiaHR0cDpcL1wvMTAzLjE2NS4xMzAuMTU3OjgwODZcL2FwaVwvbG9naW4iLCJpYXQiOjE2ODM1MjgxNDIsIm5iZiI6MTY4MzUyODE0MiwianRpIjoiUGNQZDAweTVnUDBiek1QQiJ9.MaRhUmQYTMQSepTPcHLpXCYvS0i2YhCcxLgsMLCcRro","token_type":"bearer","expires_in":0}}

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
/// data : {"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsInVzZXJzIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBtYWlsLmNvbSIsImlzX2VtcGxveWVlIjowLCJpZF9yb2xlIjowLCJpZF9hcHByb3ZhbF9hdXRoIjowLCJpZF9jb21wYW55IjowLCJpZF9zaXRlIjowLCJjcmVhdGVkX2F0IjpudWxsLCJjcmVhdGVkX2J5IjpudWxsLCJ1cGRhdGVkX2F0IjpudWxsLCJ1cGRhdGVkX2J5IjpudWxsfSwiaXNzIjoiaHR0cDpcL1wvMTAzLjE2NS4xMzAuMTU3OjgwODZcL2FwaVwvbG9naW4iLCJpYXQiOjE2ODM1MjgxNDIsIm5iZiI6MTY4MzUyODE0MiwianRpIjoiUGNQZDAweTVnUDBiek1QQiJ9.MaRhUmQYTMQSepTPcHLpXCYvS0i2YhCcxLgsMLCcRro","token_type":"bearer","expires_in":0}

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

/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsInVzZXJzIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBtYWlsLmNvbSIsImlzX2VtcGxveWVlIjowLCJpZF9yb2xlIjowLCJpZF9hcHByb3ZhbF9hdXRoIjowLCJpZF9jb21wYW55IjowLCJpZF9zaXRlIjowLCJjcmVhdGVkX2F0IjpudWxsLCJjcmVhdGVkX2J5IjpudWxsLCJ1cGRhdGVkX2F0IjpudWxsLCJ1cGRhdGVkX2J5IjpudWxsfSwiaXNzIjoiaHR0cDpcL1wvMTAzLjE2NS4xMzAuMTU3OjgwODZcL2FwaVwvbG9naW4iLCJpYXQiOjE2ODM1MjgxNDIsIm5iZiI6MTY4MzUyODE0MiwianRpIjoiUGNQZDAweTVnUDBiek1QQiJ9.MaRhUmQYTMQSepTPcHLpXCYvS0i2YhCcxLgsMLCcRro"
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

/// id : 1
/// username : "admin"
/// email : "admin@mail.com"
/// is_employee : 0
/// id_role : 0
/// id_approval_auth : 0
/// id_company : 0
/// id_site : 0
/// created_at : null
/// created_by : null
/// updated_at : null
/// updated_by : null

class Users {
  Users({
      num? id, 
      String? username, 
      String? email, 
      num? isEmployee, 
      num? idRole, 
      num? idApprovalAuth, 
      num? idCompany, 
      num? idSite, 
      dynamic createdAt, 
      dynamic createdBy, 
      dynamic updatedAt, 
      dynamic updatedBy,}){
    _id = id;
    _username = username;
    _email = email;
    _isEmployee = isEmployee;
    _idRole = idRole;
    _idApprovalAuth = idApprovalAuth;
    _idCompany = idCompany;
    _idSite = idSite;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Users.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _isEmployee = json['is_employee'];
    _idRole = json['id_role'];
    _idApprovalAuth = json['id_approval_auth'];
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  num? _id;
  String? _username;
  String? _email;
  num? _isEmployee;
  num? _idRole;
  num? _idApprovalAuth;
  num? _idCompany;
  num? _idSite;
  dynamic _createdAt;
  dynamic _createdBy;
  dynamic _updatedAt;
  dynamic _updatedBy;
Users copyWith({  num? id,
  String? username,
  String? email,
  num? isEmployee,
  num? idRole,
  num? idApprovalAuth,
  num? idCompany,
  num? idSite,
  dynamic createdAt,
  dynamic createdBy,
  dynamic updatedAt,
  dynamic updatedBy,
}) => Users(  id: id ?? _id,
  username: username ?? _username,
  email: email ?? _email,
  isEmployee: isEmployee ?? _isEmployee,
  idRole: idRole ?? _idRole,
  idApprovalAuth: idApprovalAuth ?? _idApprovalAuth,
  idCompany: idCompany ?? _idCompany,
  idSite: idSite ?? _idSite,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  num? get id => _id;
  String? get username => _username;
  String? get email => _email;
  num? get isEmployee => _isEmployee;
  num? get idRole => _idRole;
  num? get idApprovalAuth => _idApprovalAuth;
  num? get idCompany => _idCompany;
  num? get idSite => _idSite;
  dynamic get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    map['is_employee'] = _isEmployee;
    map['id_role'] = _idRole;
    map['id_approval_auth'] = _idApprovalAuth;
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}