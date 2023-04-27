/// success : true
/// message : "Success"
/// data : {"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsInVzZXJzIjp7ImlkIjoxLCJuYW1lIjoiYWRtaW4iLCJlbWFpbCI6ImFkbWluQG1haWwuY29tIiwiZW1haWxfdmVyaWZpZWRfYXQiOm51bGwsImNyZWF0ZWRfYXQiOiIyMDIzLTA0LTI2VDEwOjU3OjA2LjAwMDAwMFoiLCJ1cGRhdGVkX2F0IjoiMjAyMy0wNC0yNlQxMDo1NzowNi4wMDAwMDBaIiwidXNlcm5hbWUiOiJhZG1pbiJ9LCJpc3MiOiJodHRwOlwvXC8xMDMuMTY1LjEzMC4xNTc6ODA4NlwvYXBpXC9sb2dpbiIsImlhdCI6MTY4MjU3MzUxNSwibmJmIjoxNjgyNTczNTE1LCJqdGkiOiJoNW5Yb1V4VVVzSU5sZkVvIn0.m4JFJyDUzENhcueaEGW_hErrq5HHybrVwHKHtffVZOU","token_type":"bearer","expires_in":0}

class LoginModel {
  LoginModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
LoginModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => LoginModel(  success: success ?? _success,
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

/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsInVzZXJzIjp7ImlkIjoxLCJuYW1lIjoiYWRtaW4iLCJlbWFpbCI6ImFkbWluQG1haWwuY29tIiwiZW1haWxfdmVyaWZpZWRfYXQiOm51bGwsImNyZWF0ZWRfYXQiOiIyMDIzLTA0LTI2VDEwOjU3OjA2LjAwMDAwMFoiLCJ1cGRhdGVkX2F0IjoiMjAyMy0wNC0yNlQxMDo1NzowNi4wMDAwMDBaIiwidXNlcm5hbWUiOiJhZG1pbiJ9LCJpc3MiOiJodHRwOlwvXC8xMDMuMTY1LjEzMC4xNTc6ODA4NlwvYXBpXC9sb2dpbiIsImlhdCI6MTY4MjU3MzUxNSwibmJmIjoxNjgyNTczNTE1LCJqdGkiOiJoNW5Yb1V4VVVzSU5sZkVvIn0.m4JFJyDUzENhcueaEGW_hErrq5HHybrVwHKHtffVZOU"
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