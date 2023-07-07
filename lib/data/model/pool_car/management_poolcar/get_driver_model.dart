/// success : true
/// message : "Success Get Data"
/// data : [{"id":6598,"username":"driver","name":"Oke Driver","email":"driver@gmail.com","id_company":1,"id_site":18}]

class GetDriverModel {
  GetDriverModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetDriverModel.fromJson(dynamic json) {
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
GetDriverModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetDriverModel(  success: success ?? _success,
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

/// id : 6598
/// username : "driver"
/// name : "Oke Driver"
/// email : "driver@gmail.com"
/// id_company : 1
/// id_site : 18

class Data {
  Data({
      num? id, 
      String? username, 
      String? name, 
      String? email, 
      num? idCompany, 
      num? idSite,}){
    _id = id;
    _username = username;
    _name = name;
    _email = email;
    _idCompany = idCompany;
    _idSite = idSite;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _name = json['name'];
    _email = json['email'];
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
  }
  num? _id;
  String? _username;
  String? _name;
  String? _email;
  num? _idCompany;
  num? _idSite;
Data copyWith({  num? id,
  String? username,
  String? name,
  String? email,
  num? idCompany,
  num? idSite,
}) => Data(  id: id ?? _id,
  username: username ?? _username,
  name: name ?? _name,
  email: email ?? _email,
  idCompany: idCompany ?? _idCompany,
  idSite: idSite ?? _idSite,
);
  num? get id => _id;
  String? get username => _username;
  String? get name => _name;
  String? get email => _email;
  num? get idCompany => _idCompany;
  num? get idSite => _idSite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['name'] = _name;
    map['email'] = _email;
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    return map;
  }

}