/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"band_job_name":"test","hotel_fare":"150000","meals_rate":"10000","id_flight_class":1,"created_at":"2023-05-10T09:55:05.000000Z","created_by":"2","updated_at":"2023-05-10T09:55:05.000000Z","updated_by":null},{"id":2,"band_job_name":"Band Job Test","hotel_fare":"700000","meals_rate":"350000","id_flight_class":1,"created_at":"2023-05-11T04:46:09.000000Z","created_by":null,"updated_at":"2023-05-11T04:46:09.000000Z","updated_by":null}]

class GetJobBandModel {
  GetJobBandModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetJobBandModel.fromJson(dynamic json) {
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
GetJobBandModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetJobBandModel(  success: success ?? _success,
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
/// band_job_name : "test"
/// hotel_fare : "150000"
/// meals_rate : "10000"
/// id_flight_class : 1
/// created_at : "2023-05-10T09:55:05.000000Z"
/// created_by : "2"
/// updated_at : "2023-05-10T09:55:05.000000Z"
/// updated_by : null

class Data {
  Data({
      num? id, 
      String? bandJobName, 
      String? hotelFare, 
      String? mealsRate, 
      num? idFlightClass, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy,}){
    _id = id;
    _bandJobName = bandJobName;
    _hotelFare = hotelFare;
    _mealsRate = mealsRate;
    _idFlightClass = idFlightClass;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _bandJobName = json['band_job_name'];
    _hotelFare = json['hotel_fare'];
    _mealsRate = json['meals_rate'];
    _idFlightClass = json['id_flight_class'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  num? _id;
  String? _bandJobName;
  String? _hotelFare;
  String? _mealsRate;
  num? _idFlightClass;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
Data copyWith({  num? id,
  String? bandJobName,
  String? hotelFare,
  String? mealsRate,
  num? idFlightClass,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
}) => Data(  id: id ?? _id,
  bandJobName: bandJobName ?? _bandJobName,
  hotelFare: hotelFare ?? _hotelFare,
  mealsRate: mealsRate ?? _mealsRate,
  idFlightClass: idFlightClass ?? _idFlightClass,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  num? get id => _id;
  String? get bandJobName => _bandJobName;
  String? get hotelFare => _hotelFare;
  String? get mealsRate => _mealsRate;
  num? get idFlightClass => _idFlightClass;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['band_job_name'] = _bandJobName;
    map['hotel_fare'] = _hotelFare;
    map['meals_rate'] = _mealsRate;
    map['id_flight_class'] = _idFlightClass;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}