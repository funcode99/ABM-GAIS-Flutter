/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"type_transportation":"RWA HO Office Car","id_company":null,"created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":2,"type_transportation":"Rent Car","id_company":null,"created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":3,"type_transportation":"TIA Site Car","id_company":null,"created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":4,"type_transportation":"CK MIFA Site Car","id_company":null,"created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":5,"type_transportation":"TIA HO Car","id_company":null,"created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":6,"type_transportation":"SSB Pool Car (SSB)","id_company":null,"created_at":null,"created_by":null,"updated_at":null,"updated_by":null}]

class GetTypeTransportationModel {
  GetTypeTransportationModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetTypeTransportationModel.fromJson(dynamic json) {
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
GetTypeTransportationModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetTypeTransportationModel(  success: success ?? _success,
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
/// type_transportation : "RWA HO Office Car"
/// id_company : null
/// created_at : null
/// created_by : null
/// updated_at : null
/// updated_by : null

class Data {
  Data({
      num? id, 
      String? typeTransportation, 
      dynamic idCompany, 
      dynamic createdAt, 
      dynamic createdBy, 
      dynamic updatedAt, 
      dynamic updatedBy,}){
    _id = id;
    _typeTransportation = typeTransportation;
    _idCompany = idCompany;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _typeTransportation = json['type_transportation'];
    _idCompany = json['id_company'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  dynamic _id;
  String? _typeTransportation;
  dynamic _idCompany;
  dynamic _createdAt;
  dynamic _createdBy;
  dynamic _updatedAt;
  dynamic _updatedBy;
Data copyWith({  num? id,
  String? typeTransportation,
  dynamic idCompany,
  dynamic createdAt,
  dynamic createdBy,
  dynamic updatedAt,
  dynamic updatedBy,
}) => Data(  id: id ?? _id,
  typeTransportation: typeTransportation ?? _typeTransportation,
  idCompany: idCompany ?? _idCompany,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  dynamic get id => _id;
  String? get typeTransportation => _typeTransportation;
  dynamic get idCompany => _idCompany;
  dynamic get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type_transportation'] = _typeTransportation;
    map['id_company'] = _idCompany;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}