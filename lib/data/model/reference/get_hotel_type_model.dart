/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"type_accomodation":"Hotel","created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":2,"type_accomodation":"Camp","created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":3,"type_accomodation":"Guest House","created_at":null,"created_by":null,"updated_at":null,"updated_by":null}]

class GetHotelTypeModel {
  GetHotelTypeModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetHotelTypeModel.fromJson(dynamic json) {
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
GetHotelTypeModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetHotelTypeModel(  success: success ?? _success,
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
/// type_accomodation : "Hotel"
/// created_at : null
/// created_by : null
/// updated_at : null
/// updated_by : null

class Data {
  Data({
      num? id, 
      String? typeAccomodation, 
      dynamic createdAt, 
      dynamic createdBy, 
      dynamic updatedAt, 
      dynamic updatedBy,}){
    _id = id;
    _typeAccomodation = typeAccomodation;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _typeAccomodation = json['type_accomodation'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  dynamic _id;
  String? _typeAccomodation;
  dynamic _createdAt;
  dynamic _createdBy;
  dynamic _updatedAt;
  dynamic _updatedBy;
Data copyWith({  num? id,
  String? typeAccomodation,
  dynamic createdAt,
  dynamic createdBy,
  dynamic updatedAt,
  dynamic updatedBy,
}) => Data(  id: id ?? _id,
  typeAccomodation: typeAccomodation ?? _typeAccomodation,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  dynamic get id => _id;
  String? get typeAccomodation => _typeAccomodation;
  dynamic get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type_accomodation'] = _typeAccomodation;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}