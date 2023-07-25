/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"type_traveller":"Interrviewee","created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":2,"type_traveller":"Consultant","created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":3,"type_traveller":"Buyers","created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":4,"type_traveller":"Presales","created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":5,"type_traveller":"Goverment","created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":6,"type_traveller":"Employee Non Staff","created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":7,"type_traveller":"Family Status","created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":8,"type_traveller":"Vendor","created_at":null,"created_by":null,"updated_at":null,"updated_by":null}]

class GetTravellerTypeModel {
  GetTravellerTypeModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetTravellerTypeModel.fromJson(dynamic json) {
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
GetTravellerTypeModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetTravellerTypeModel(  success: success ?? _success,
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
/// type_traveller : "Interrviewee"
/// created_at : null
/// created_by : null
/// updated_at : null
/// updated_by : null

class Data {
  Data({
      num? id, 
      String? typeTraveller, 
      dynamic createdAt, 
      dynamic createdBy, 
      dynamic updatedAt, 
      dynamic updatedBy,}){
    _id = id;
    _typeTraveller = typeTraveller;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _typeTraveller = json['type_traveller'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  dynamic _id;
  String? _typeTraveller;
  dynamic _createdAt;
  dynamic _createdBy;
  dynamic _updatedAt;
  dynamic _updatedBy;
Data copyWith({  num? id,
  String? typeTraveller,
  dynamic createdAt,
  dynamic createdBy,
  dynamic updatedAt,
  dynamic updatedBy,
}) => Data(  id: id ?? _id,
  typeTraveller: typeTraveller ?? _typeTraveller,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  dynamic get id => _id;
  String? get typeTraveller => _typeTraveller;
  dynamic get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type_traveller'] = _typeTraveller;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}