/// success : true
/// message : "Success Get Data"
/// data : [{"id":7,"zona_name":"A","city":[{"id_city":"1","city_name":"Bogor","city_code":"BGR"},{"id_city":"2","city_name":"Jakarta","city_code":"JKT"}]},{"id":8,"zona_name":"B","city":[{"id_city":"1","city_name":"Bogor","city_code":"BGR"},{"id_city":"2","city_name":"Jakarta","city_code":"JKT"},{"id_city":"3","city_name":"Surabaya","city_code":"SBY"}]}]

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

/// id : 7
/// zona_name : "A"
/// city : [{"id_city":"1","city_name":"Bogor","city_code":"BGR"},{"id_city":"2","city_name":"Jakarta","city_code":"JKT"}]

class Data {
  Data({
      num? id, 
      String? zonaName, 
      List<City>? city,}){
    _id = id;
    _zonaName = zonaName;
    _city = city;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _zonaName = json['zona_name'];
    if (json['city'] != null) {
      _city = [];
      json['city'].forEach((v) {
        _city?.add(City.fromJson(v));
      });
    }
  }
  dynamic _id;
  String? _zonaName;
  List<City>? _city;
Data copyWith({  num? id,
  String? zonaName,
  List<City>? city,
}) => Data(  id: id ?? _id,
  zonaName: zonaName ?? _zonaName,
  city: city ?? _city,
);
  dynamic get id => _id;
  String? get zonaName => _zonaName;
  List<City>? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['zona_name'] = _zonaName;
    if (_city != null) {
      map['city'] = _city?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id_city : "1"
/// city_name : "Bogor"
/// city_code : "BGR"

class City {
  City({
      String? idCity, 
      String? cityName, 
      String? cityCode,}){
    _idCity = idCity;
    _cityName = cityName;
    _cityCode = cityCode;
}

  City.fromJson(dynamic json) {
    _idCity = json['id_city'];
    _cityName = json['city_name'];
    _cityCode = json['city_code'];
  }
  String? _idCity;
  String? _cityName;
  String? _cityCode;
City copyWith({  String? idCity,
  String? cityName,
  String? cityCode,
}) => City(  idCity: idCity ?? _idCity,
  cityName: cityName ?? _cityName,
  cityCode: cityCode ?? _cityCode,
);
  String? get idCity => _idCity;
  String? get cityName => _cityName;
  String? get cityCode => _cityCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_city'] = _idCity;
    map['city_name'] = _cityName;
    map['city_code'] = _cityCode;
    return map;
  }

}