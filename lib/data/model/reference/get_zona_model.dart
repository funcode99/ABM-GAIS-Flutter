/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"zona_name":"A","id_city":1,"created_at":"2023-05-10T08:23:50.000000Z","created_by":"2","updated_at":"2023-05-10T08:23:50.000000Z","updated_by":null}]

class GetZonaModel {
  GetZonaModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetZonaModel.fromJson(dynamic json) {
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
GetZonaModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetZonaModel(  success: success ?? _success,
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
/// zona_name : "A"
/// id_city : 1
/// created_at : "2023-05-10T08:23:50.000000Z"
/// created_by : "2"
/// updated_at : "2023-05-10T08:23:50.000000Z"
/// updated_by : null

class Data {
  Data({
      num? id, 
      String? zonaName, 
      num? idCity, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy,}){
    _id = id;
    _zonaName = zonaName;
    _idCity = idCity;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _zonaName = json['zona_name'];
    _idCity = json['id_city'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  num? _id;
  String? _zonaName;
  num? _idCity;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
Data copyWith({  num? id,
  String? zonaName,
  num? idCity,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
}) => Data(  id: id ?? _id,
  zonaName: zonaName ?? _zonaName,
  idCity: idCity ?? _idCity,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  num? get id => _id;
  String? get zonaName => _zonaName;
  num? get idCity => _idCity;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['zona_name'] = _zonaName;
    map['id_city'] = _idCity;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}