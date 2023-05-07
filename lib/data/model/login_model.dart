/// users : [{"id":1,"username":"admin","email":"admin@mail.com","is_employee":null,"id_role":null,"id_approval_auth":null,"id_company":null,"id_site":null,"created_at":"2023-05-05T04:38:08.000000Z","created_by":null,"updated_at":"2023-05-05T04:38:08.000000Z","updated_by":null}]
/// token : {"success":true,"message":"Success","data":{"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsInVzZXJzIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBtYWlsLmNvbSIsImlzX2VtcGxveWVlIjpudWxsLCJpZF9yb2xlIjpudWxsLCJpZF9hcHByb3ZhbF9hdXRoIjpudWxsLCJpZF9jb21wYW55IjpudWxsLCJpZF9zaXRlIjpudWxsLCJjcmVhdGVkX2F0IjoiMjAyMy0wNS0wNVQwNDozODowOC4wMDAwMDBaIiwiY3JlYXRlZF9ieSI6bnVsbCwidXBkYXRlZF9hdCI6IjIwMjMtMDUtMDVUMDQ6Mzg6MDguMDAwMDAwWiIsInVwZGF0ZWRfYnkiOm51bGx9LCJpc3MiOiJodHRwOlwvXC8xMDMuMTY1LjEzMC4xNTc6ODA4NlwvYXBpXC9sb2dpbiIsImlhdCI6MTY4MzI2MTU3MiwibmJmIjoxNjgzMjYxNTcyLCJqdGkiOiIyUDB5eUx2RTFaSWtEN2lMIn0.IpM4CgUc0GQBjKMDfDCuUmWkOYNQiZO247wS3M092AA","token_type":"bearer","expires_in":0}}

class LoginModel {
  LoginModel({
      List<Users>? users, 
      Token? token,}){
    _users = users;
    _token = token;
}

  LoginModel.fromJson(dynamic json) {
    if (json['users'] != null) {
      _users = [];
      json['users'].forEach((v) {
        _users?.add(Users.fromJson(v));
      });
    }
    _token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }
  List<Users>? _users;
  Token? _token;
LoginModel copyWith({  List<Users>? users,
  Token? token,
}) => LoginModel(  users: users ?? _users,
  token: token ?? _token,
);
  List<Users>? get users => _users;
  Token? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_users != null) {
      map['users'] = _users?.map((v) => v.toJson()).toList();
    }
    if (_token != null) {
      map['token'] = _token?.toJson();
    }
    return map;
  }

}

/// success : true
/// message : "Success"
/// data : {"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsInVzZXJzIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBtYWlsLmNvbSIsImlzX2VtcGxveWVlIjpudWxsLCJpZF9yb2xlIjpudWxsLCJpZF9hcHByb3ZhbF9hdXRoIjpudWxsLCJpZF9jb21wYW55IjpudWxsLCJpZF9zaXRlIjpudWxsLCJjcmVhdGVkX2F0IjoiMjAyMy0wNS0wNVQwNDozODowOC4wMDAwMDBaIiwiY3JlYXRlZF9ieSI6bnVsbCwidXBkYXRlZF9hdCI6IjIwMjMtMDUtMDVUMDQ6Mzg6MDguMDAwMDAwWiIsInVwZGF0ZWRfYnkiOm51bGx9LCJpc3MiOiJodHRwOlwvXC8xMDMuMTY1LjEzMC4xNTc6ODA4NlwvYXBpXC9sb2dpbiIsImlhdCI6MTY4MzI2MTU3MiwibmJmIjoxNjgzMjYxNTcyLCJqdGkiOiIyUDB5eUx2RTFaSWtEN2lMIn0.IpM4CgUc0GQBjKMDfDCuUmWkOYNQiZO247wS3M092AA","token_type":"bearer","expires_in":0}

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

/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsInVzZXJzIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbkBtYWlsLmNvbSIsImlzX2VtcGxveWVlIjpudWxsLCJpZF9yb2xlIjpudWxsLCJpZF9hcHByb3ZhbF9hdXRoIjpudWxsLCJpZF9jb21wYW55IjpudWxsLCJpZF9zaXRlIjpudWxsLCJjcmVhdGVkX2F0IjoiMjAyMy0wNS0wNVQwNDozODowOC4wMDAwMDBaIiwiY3JlYXRlZF9ieSI6bnVsbCwidXBkYXRlZF9hdCI6IjIwMjMtMDUtMDVUMDQ6Mzg6MDguMDAwMDAwWiIsInVwZGF0ZWRfYnkiOm51bGx9LCJpc3MiOiJodHRwOlwvXC8xMDMuMTY1LjEzMC4xNTc6ODA4NlwvYXBpXC9sb2dpbiIsImlhdCI6MTY4MzI2MTU3MiwibmJmIjoxNjgzMjYxNTcyLCJqdGkiOiIyUDB5eUx2RTFaSWtEN2lMIn0.IpM4CgUc0GQBjKMDfDCuUmWkOYNQiZO247wS3M092AA"
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
/// is_employee : null
/// id_role : null
/// id_approval_auth : null
/// id_company : null
/// id_site : null
/// created_at : "2023-05-05T04:38:08.000000Z"
/// created_by : null
/// updated_at : "2023-05-05T04:38:08.000000Z"
/// updated_by : null

class Users {
  Users({
      num? id, 
      String? username, 
      String? email, 
      dynamic isEmployee, 
      dynamic idRole, 
      dynamic idApprovalAuth, 
      dynamic idCompany, 
      dynamic idSite, 
      String? createdAt, 
      dynamic createdBy, 
      String? updatedAt, 
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
  dynamic _isEmployee;
  dynamic _idRole;
  dynamic _idApprovalAuth;
  dynamic _idCompany;
  dynamic _idSite;
  String? _createdAt;
  dynamic _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
Users copyWith({  num? id,
  String? username,
  String? email,
  dynamic isEmployee,
  dynamic idRole,
  dynamic idApprovalAuth,
  dynamic idCompany,
  dynamic idSite,
  String? createdAt,
  dynamic createdBy,
  String? updatedAt,
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
  dynamic get isEmployee => _isEmployee;
  dynamic get idRole => _idRole;
  dynamic get idApprovalAuth => _idApprovalAuth;
  dynamic get idCompany => _idCompany;
  dynamic get idSite => _idSite;
  String? get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
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