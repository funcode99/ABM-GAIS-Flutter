/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"type_car":"SUV"},{"id":2,"type_car":"Sedan"},{"id":3,"type_car":"Mini Bus"},{"id":4,"type_car":"Bus"}]

class GetCarTypeModel {
  GetCarTypeModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetCarTypeModel.fromJson(dynamic json) {
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
GetCarTypeModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetCarTypeModel(  success: success ?? _success,
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
/// type_car : "SUV"

class Data {
  Data({
      num? id, 
      String? typeCar,}){
    _id = id;
    _typeCar = typeCar;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _typeCar = json['type_car'];
  }
  dynamic _id;
  String? _typeCar;
Data copyWith({  num? id,
  String? typeCar,
}) => Data(  id: id ?? _id,
  typeCar: typeCar ?? _typeCar,
);
  dynamic get id => _id;
  String? get typeCar => _typeCar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type_car'] = _typeCar;
    return map;
  }

}