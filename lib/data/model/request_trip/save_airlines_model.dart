/// success : true
/// message : "Success Create Menu"
/// data : {"id_request_trip":"1","id_vendor":"1","flight_no":"1","code_airlines":"1","ticket_price":15000,"created_at":"2023-05-15T20:18:32.000000Z","created_by":1,"code_status_doc":"0","updated_at":"2023-05-15T20:18:32.000000Z","id":1}

class SaveAirlinesModel {
  SaveAirlinesModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveAirlinesModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveAirlinesModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveAirlinesModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id_request_trip : "1"
/// id_vendor : "1"
/// flight_no : "1"
/// code_airlines : "1"
/// ticket_price : 15000
/// created_at : "2023-05-15T20:18:32.000000Z"
/// created_by : 1
/// code_status_doc : "0"
/// updated_at : "2023-05-15T20:18:32.000000Z"
/// id : 1

class Data {
  Data({
      String? idRequestTrip, 
      String? idVendor, 
      String? flightNo, 
      String? codeAirlines, 
      num? ticketPrice, 
      String? createdAt, 
      num? createdBy, 
      String? codeStatusDoc,
      String? updatedAt, 
      num? id,}){
    _idRequestTrip = idRequestTrip;
    _idVendor = idVendor;
    _flightNo = flightNo;
    _codeAirlines = codeAirlines;
    _ticketPrice = ticketPrice;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _codeStatusDoc = codeStatusDoc;
    _updatedAt = updatedAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _idRequestTrip = json['id_request_trip'];
    _idVendor = json['id_vendor'];
    _flightNo = json['flight_no'];
    _codeAirlines = json['code_airlines'];
    _ticketPrice = json['ticket_price'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _codeStatusDoc = json['code_status_doc'];
    _updatedAt = json['updated_at'];
    _id = json['id'];
  }
  String? _idRequestTrip;
  String? _idVendor;
  String? _flightNo;
  String? _codeAirlines;
  num? _ticketPrice;
  String? _createdAt;
  num? _createdBy;
  String? _codeStatusDoc;
  String? _updatedAt;
  num? _id;
Data copyWith({  String? idRequestTrip,
  String? idVendor,
  String? flightNo,
  String? codeAirlines,
  num? ticketPrice,
  String? createdAt,
  num? createdBy,
  String? codeStatusDoc,
  String? updatedAt,
  num? id,
}) => Data(  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  idVendor: idVendor ?? _idVendor,
  flightNo: flightNo ?? _flightNo,
  codeAirlines: codeAirlines ?? _codeAirlines,
  ticketPrice: ticketPrice ?? _ticketPrice,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  updatedAt: updatedAt ?? _updatedAt,
  id: id ?? _id,
);
  String? get idRequestTrip => _idRequestTrip;
  String? get idVendor => _idVendor;
  String? get flightNo => _flightNo;
  String? get codeAirlines => _codeAirlines;
  num? get ticketPrice => _ticketPrice;
  String? get createdAt => _createdAt;
  num? get createdBy => _createdBy;
  String? get codeStatusDoc => _codeStatusDoc;
  String? get updatedAt => _updatedAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_request_trip'] = _idRequestTrip;
    map['id_vendor'] = _idVendor;
    map['flight_no'] = _flightNo;
    map['code_airlines'] = _codeAirlines;
    map['ticket_price'] = _ticketPrice;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['code_status_doc'] = _codeStatusDoc;
    map['updated_at'] = _updatedAt;
    map['id'] = _id;
    return map;
  }

}