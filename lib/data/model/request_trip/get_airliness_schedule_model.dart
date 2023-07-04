/// success : true
/// message : "Success Get Data"
/// data : [{"airlines":"Garuda Indonesia","flight_no":"GA-889","depart":"Jakarta","arrival":"Bandung","stops":"2h 30m Direct","class":"Economy","price":1000000},{"airlines":"Susi Air","flight_no":"SA-861","depart":"Jakarta","arrival":"Bandung","stops":"2h 30m Direct","class":"Economy","price":1000000},{"airlines":"Batik Air","flight_no":"BA-123","depart":"Jakarta","arrival":"Bandung","stops":"2h 30m Direct","class":"Economy","price":1000000},{"airlines":"Lion Air","flight_no":"LA-456","depart":"Jakarta","arrival":"Bandung","stops":"2h 30m Direct","class":"Economy","price":1000000},{"airlines":"Etihad Air","flight_no":"EA-980","depart":"Jakarta","arrival":"Bandung","stops":"2h 30m Direct","class":"Economy","price":1000000},{"airlines":"Citilink","flight_no":"C-876","depart":"Jakarta","arrival":"Bandung","stops":"2h 30m Direct","class":"Economy","price":1000000}]

class GetAirlinessScheduleModel {
  GetAirlinessScheduleModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetAirlinessScheduleModel.fromJson(dynamic json) {
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
GetAirlinessScheduleModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetAirlinessScheduleModel(  success: success ?? _success,
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

/// airlines : "Garuda Indonesia"
/// flight_no : "GA-889"
/// depart : "Jakarta"
/// arrival : "Bandung"
/// stops : "2h 30m Direct"
/// class : "Economy"
/// price : 1000000

class Data {
  Data({
      String? airlines, 
      String? flightNo, 
      String? depart, 
      String? arrival, 
      String? stops, 
      String? flightClass,
      num? price,}){
    _airlines = airlines;
    _flightNo = flightNo;
    _depart = depart;
    _arrival = arrival;
    _stops = stops;
    _flightClass = flightClass;
    _price = price;
}

  Data.fromJson(dynamic json) {
    _airlines = json['airlines'];
    _flightNo = json['flight_no'];
    _depart = json['depart'];
    _arrival = json['arrival'];
    _stops = json['stops'];
    _flightClass = json['class'];
    _price = json['price'];
  }
  String? _airlines;
  String? _flightNo;
  String? _depart;
  String? _arrival;
  String? _stops;
  String? _flightClass;
  num? _price;
Data copyWith({  String? airlines,
  String? flightNo,
  String? depart,
  String? arrival,
  String? stops,
  String? flightClass,
  num? price,
}) => Data(  airlines: airlines ?? _airlines,
  flightNo: flightNo ?? _flightNo,
  depart: depart ?? _depart,
  arrival: arrival ?? _arrival,
  stops: stops ?? _stops,
  flightClass: flightClass ?? _flightClass,
  price: price ?? _price,
);
  String? get airlines => _airlines;
  String? get flightNo => _flightNo;
  String? get depart => _depart;
  String? get arrival => _arrival;
  String? get stops => _stops;
  String? get flightClass => _flightClass;
  num? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['airlines'] = _airlines;
    map['flight_no'] = _flightNo;
    map['depart'] = _depart;
    map['arrival'] = _arrival;
    map['stops'] = _stops;
    map['class'] = _flightClass;
    map['price'] = _price;
    return map;
  }

}