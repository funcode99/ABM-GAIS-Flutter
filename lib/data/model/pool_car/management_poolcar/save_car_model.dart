/// success : true
/// message : "Success Create Menu"
/// data : {"car_name":"TESTLA","id_company":"1","id_site":"1","plate":"B1234ABM","id_driver":"1","odometer":"12345","transmisi":"Auto","status":"1","created_at":"2023-07-06T01:28:38.000000Z","created_by":2,"updated_at":"2023-07-06T01:28:38.000000Z","id":5}

class SaveCarModel {
  SaveCarModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveCarModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveCarModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveCarModel(  success: success ?? _success,
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

/// car_name : "TESTLA"
/// id_company : "1"
/// id_site : "1"
/// plate : "B1234ABM"
/// id_driver : "1"
/// odometer : "12345"
/// transmisi : "Auto"
/// status : "1"
/// created_at : "2023-07-06T01:28:38.000000Z"
/// created_by : 2
/// updated_at : "2023-07-06T01:28:38.000000Z"
/// id : 5

class Data {
  Data({
      String? carName, 
      String? idCompany, 
      String? idSite, 
      String? plate, 
      String? idDriver, 
      String? odometer, 
      String? transmisi, 
      String? status, 
      String? createdAt, 
      num? createdBy, 
      String? updatedAt, 
      num? id,}){
    _carName = carName;
    _idCompany = idCompany;
    _idSite = idSite;
    _plate = plate;
    _idDriver = idDriver;
    _odometer = odometer;
    _transmisi = transmisi;
    _status = status;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _carName = json['car_name'];
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
    _plate = json['plate'];
    _idDriver = json['id_driver'];
    _odometer = json['odometer'];
    _transmisi = json['transmisi'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _id = json['id'];
  }
  String? _carName;
  String? _idCompany;
  String? _idSite;
  String? _plate;
  String? _idDriver;
  String? _odometer;
  String? _transmisi;
  String? _status;
  String? _createdAt;
  num? _createdBy;
  String? _updatedAt;
  num? _id;
Data copyWith({  String? carName,
  String? idCompany,
  String? idSite,
  String? plate,
  String? idDriver,
  String? odometer,
  String? transmisi,
  String? status,
  String? createdAt,
  num? createdBy,
  String? updatedAt,
  num? id,
}) => Data(  carName: carName ?? _carName,
  idCompany: idCompany ?? _idCompany,
  idSite: idSite ?? _idSite,
  plate: plate ?? _plate,
  idDriver: idDriver ?? _idDriver,
  odometer: odometer ?? _odometer,
  transmisi: transmisi ?? _transmisi,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  id: id ?? _id,
);
  String? get carName => _carName;
  String? get idCompany => _idCompany;
  String? get idSite => _idSite;
  String? get plate => _plate;
  String? get idDriver => _idDriver;
  String? get odometer => _odometer;
  String? get transmisi => _transmisi;
  String? get status => _status;
  String? get createdAt => _createdAt;
  num? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['car_name'] = _carName;
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    map['plate'] = _plate;
    map['id_driver'] = _idDriver;
    map['odometer'] = _odometer;
    map['transmisi'] = _transmisi;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['id'] = _id;
    return map;
  }

}