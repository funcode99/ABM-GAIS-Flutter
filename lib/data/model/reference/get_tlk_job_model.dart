/// success : true
/// message : "Success Get Data"
/// data : [{"no":1,"id":1,"id_zona":2,"id_job_band":1,"tlk_rate":"100000","created_at":"2023-05-31 23:45:08","created_by":"1","updated_at":"2023-05-31 23:45:08","updated_by":null,"zona_name":null,"hotel_fare":"160000","flight_class":"First Class oke","id_flight_class":63,"meals_rate":"13000"}]

class GetTlkJobModel {
  GetTlkJobModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetTlkJobModel.fromJson(dynamic json) {
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
GetTlkJobModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetTlkJobModel(  success: success ?? _success,
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

/// no : 1
/// id : 1
/// id_zona : 2
/// id_job_band : 1
/// tlk_rate : "100000"
/// created_at : "2023-05-31 23:45:08"
/// created_by : "1"
/// updated_at : "2023-05-31 23:45:08"
/// updated_by : null
/// zona_name : null
/// hotel_fare : "160000"
/// flight_class : "First Class oke"
/// id_flight_class : 63
/// meals_rate : "13000"

class Data {
  Data({
      num? no, 
      num? id, 
      num? idZona, 
      num? idJobBand, 
      String? tlkRate, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      dynamic zonaName, 
      String? hotelFare, 
      String? flightClass, 
      num? idFlightClass, 
      String? mealsRate,}){
    _no = no;
    _id = id;
    _idZona = idZona;
    _idJobBand = idJobBand;
    _tlkRate = tlkRate;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _zonaName = zonaName;
    _hotelFare = hotelFare;
    _flightClass = flightClass;
    _idFlightClass = idFlightClass;
    _mealsRate = mealsRate;
}

  Data.fromJson(dynamic json) {
    _no = json['no'];
    _id = json['id'];
    _idZona = json['id_zona'];
    _idJobBand = json['id_job_band'];
    _tlkRate = json['tlk_rate'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _zonaName = json['zona_name'];
    _hotelFare = json['hotel_fare'];
    _flightClass = json['flight_class'];
    _idFlightClass = json['id_flight_class'];
    _mealsRate = json['meals_rate'];
  }
  num? _no;
  num? _id;
  num? _idZona;
  num? _idJobBand;
  String? _tlkRate;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  dynamic _zonaName;
  String? _hotelFare;
  String? _flightClass;
  num? _idFlightClass;
  String? _mealsRate;
Data copyWith({  num? no,
  num? id,
  num? idZona,
  num? idJobBand,
  String? tlkRate,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
  dynamic zonaName,
  String? hotelFare,
  String? flightClass,
  num? idFlightClass,
  String? mealsRate,
}) => Data(  no: no ?? _no,
  id: id ?? _id,
  idZona: idZona ?? _idZona,
  idJobBand: idJobBand ?? _idJobBand,
  tlkRate: tlkRate ?? _tlkRate,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  zonaName: zonaName ?? _zonaName,
  hotelFare: hotelFare ?? _hotelFare,
  flightClass: flightClass ?? _flightClass,
  idFlightClass: idFlightClass ?? _idFlightClass,
  mealsRate: mealsRate ?? _mealsRate,
);
  num? get no => _no;
  num? get id => _id;
  num? get idZona => _idZona;
  num? get idJobBand => _idJobBand;
  String? get tlkRate => _tlkRate;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  dynamic get zonaName => _zonaName;
  String? get hotelFare => _hotelFare;
  String? get flightClass => _flightClass;
  num? get idFlightClass => _idFlightClass;
  String? get mealsRate => _mealsRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no'] = _no;
    map['id'] = _id;
    map['id_zona'] = _idZona;
    map['id_job_band'] = _idJobBand;
    map['tlk_rate'] = _tlkRate;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['zona_name'] = _zonaName;
    map['hotel_fare'] = _hotelFare;
    map['flight_class'] = _flightClass;
    map['id_flight_class'] = _idFlightClass;
    map['meals_rate'] = _mealsRate;
    return map;
  }

}