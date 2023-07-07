/// success : true
/// message : "Success Update Menu"
/// data : {"id":4,"car_name":"TESTLA","plate":"B1234ABM","id_company":"1","id_site":"1","odometer":"12345","transmisi":"Auto","id_driver":"1","status":"1","id_car_type":null,"created_at":"2023-07-05T16:35:33.000000Z","created_by":"1","updated_at":"2023-07-06T01:34:35.000000Z","updated_by":2,"deleted_at":null}

class UpdateCarModel {
  UpdateCarModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdateCarModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UpdateCarModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UpdateCarModel(  success: success ?? _success,
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

/// id : 4
/// car_name : "TESTLA"
/// plate : "B1234ABM"
/// id_company : "1"
/// id_site : "1"
/// odometer : "12345"
/// transmisi : "Auto"
/// id_driver : "1"
/// status : "1"
/// id_car_type : null
/// created_at : "2023-07-05T16:35:33.000000Z"
/// created_by : "1"
/// updated_at : "2023-07-06T01:34:35.000000Z"
/// updated_by : 2
/// deleted_at : null

class Data {
  Data({
      num? id, 
      String? carName, 
      String? plate, 
      String? idCompany, 
      String? idSite, 
      String? odometer, 
      String? transmisi, 
      String? idDriver, 
      String? status, 
      dynamic idCarType, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      num? updatedBy, 
      dynamic deletedAt,}){
    _id = id;
    _carName = carName;
    _plate = plate;
    _idCompany = idCompany;
    _idSite = idSite;
    _odometer = odometer;
    _transmisi = transmisi;
    _idDriver = idDriver;
    _status = status;
    _idCarType = idCarType;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _deletedAt = deletedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _carName = json['car_name'];
    _plate = json['plate'];
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
    _odometer = json['odometer'];
    _transmisi = json['transmisi'];
    _idDriver = json['id_driver'];
    _status = json['status'];
    _idCarType = json['id_car_type'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  String? _carName;
  String? _plate;
  String? _idCompany;
  String? _idSite;
  String? _odometer;
  String? _transmisi;
  String? _idDriver;
  String? _status;
  dynamic _idCarType;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  num? _updatedBy;
  dynamic _deletedAt;
Data copyWith({  num? id,
  String? carName,
  String? plate,
  String? idCompany,
  String? idSite,
  String? odometer,
  String? transmisi,
  String? idDriver,
  String? status,
  dynamic idCarType,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  num? updatedBy,
  dynamic deletedAt,
}) => Data(  id: id ?? _id,
  carName: carName ?? _carName,
  plate: plate ?? _plate,
  idCompany: idCompany ?? _idCompany,
  idSite: idSite ?? _idSite,
  odometer: odometer ?? _odometer,
  transmisi: transmisi ?? _transmisi,
  idDriver: idDriver ?? _idDriver,
  status: status ?? _status,
  idCarType: idCarType ?? _idCarType,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  deletedAt: deletedAt ?? _deletedAt,
);
  num? get id => _id;
  String? get carName => _carName;
  String? get plate => _plate;
  String? get idCompany => _idCompany;
  String? get idSite => _idSite;
  String? get odometer => _odometer;
  String? get transmisi => _transmisi;
  String? get idDriver => _idDriver;
  String? get status => _status;
  dynamic get idCarType => _idCarType;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  num? get updatedBy => _updatedBy;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['car_name'] = _carName;
    map['plate'] = _plate;
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    map['odometer'] = _odometer;
    map['transmisi'] = _transmisi;
    map['id_driver'] = _idDriver;
    map['status'] = _status;
    map['id_car_type'] = _idCarType;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}