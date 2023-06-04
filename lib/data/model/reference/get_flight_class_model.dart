/// success : true
/// message : "Success Get Data"
/// data : [{"id":6,"flight_class":"First Class","created_at":"2023-05-15T06:36:56.000000Z","created_by":"1","updated_at":"2023-05-15T06:36:56.000000Z","updated_by":null},{"id":4,"flight_class":"First Class New","created_at":"2023-05-15T06:18:28.000000Z","created_by":"1","updated_at":"2023-05-15T06:39:57.000000Z","updated_by":"1"},{"id":5,"flight_class":"Luxury Class","created_at":"2023-05-15T06:30:11.000000Z","created_by":"1","updated_at":"2023-05-15T06:40:55.000000Z","updated_by":"1"}]

class GetFlightClassModel {
  GetFlightClassModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetFlightClassModel.fromJson(dynamic json) {
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
GetFlightClassModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetFlightClassModel(  success: success ?? _success,
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

/// id : 6
/// flight_class : "First Class"
/// created_at : "2023-05-15T06:36:56.000000Z"
/// created_by : "1"
/// updated_at : "2023-05-15T06:36:56.000000Z"
/// updated_by : null

class Data {
  Data({
      num? id, 
      String? flightClass, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy,}){
    _id = id;
    _flightClass = flightClass;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _flightClass = json['flight_class'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  num? _id;
  String? _flightClass;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
Data copyWith({  num? id,
  String? flightClass,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
}) => Data(  id: id ?? _id,
  flightClass: flightClass ?? _flightClass,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  num? get id => _id;
  String? get flightClass => _flightClass;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['flight_class'] = _flightClass;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}