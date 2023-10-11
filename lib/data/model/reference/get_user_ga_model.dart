class GetUserGaModel {
  GetUserGaModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetUserGaModel.fromJson(dynamic json) {
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
GetUserGaModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetUserGaModel(  success: success ?? _success,
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
      String? firstName, 
      String? lastName, 
      String? email, 
      String? title, 
      String? phone,}){
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _title = title;
    _phone = phone;
}

  Data.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _title = json['title'];
    _phone = json['phone'];
  }
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _title;
  String? _phone;
Data copyWith({  String? firstName,
  String? lastName,
  String? email,
  String? title,
  String? phone,
}) => Data(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  title: title ?? _title,
  phone: phone ?? _phone,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get title => _title;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['title'] = _title;
    map['phone'] = _phone;
    return map;
  }

}