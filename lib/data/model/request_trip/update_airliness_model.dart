/// success : true
/// message : "Success Update Data"
/// data : {"id":5,"id_request_trip":"1","id_vendor":"1","flight_no":"1","code_airlines":"1","ticket_price":15000,"code_status_doc":"0","created_at":"2023-05-19T08:10:59.000000Z","created_by":"2","updated_at":"2023-05-26T09:48:06.000000Z","updated_by":2}

class UpdateAirlinessModel {
  UpdateAirlinessModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdateAirlinessModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UpdateAirlinessModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UpdateAirlinessModel(  success: success ?? _success,
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

/// id : 5
/// id_request_trip : "1"
/// id_vendor : "1"
/// flight_no : "1"
/// code_airlines : "1"
/// ticket_price : 15000
/// code_status_doc : "0"
/// created_at : "2023-05-19T08:10:59.000000Z"
/// created_by : "2"
/// updated_at : "2023-05-26T09:48:06.000000Z"
/// updated_by : 2

class Data {
  Data({
      num? id, 
      String? idRequestTrip, 
      String? idVendor, 
      String? flightNo, 
      String? codeAirlines, 
      num? ticketPrice, 
      String? codeStatusDoc, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      num? updatedBy,}){
    _id = id;
    _idRequestTrip = idRequestTrip;
    _idVendor = idVendor;
    _flightNo = flightNo;
    _codeAirlines = codeAirlines;
    _ticketPrice = ticketPrice;
    _codeStatusDoc = codeStatusDoc;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idRequestTrip = json['id_request_trip'];
    _idVendor = json['id_vendor'];
    _flightNo = json['flight_no'];
    _codeAirlines = json['code_airlines'];
    _ticketPrice = json['ticket_price'];
    _codeStatusDoc = json['code_status_doc'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  dynamic _id;
  String? _idRequestTrip;
  String? _idVendor;
  String? _flightNo;
  String? _codeAirlines;
  num? _ticketPrice;
  String? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  num? _updatedBy;
Data copyWith({  num? id,
  String? idRequestTrip,
  String? idVendor,
  String? flightNo,
  String? codeAirlines,
  num? ticketPrice,
  String? codeStatusDoc,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  num? updatedBy,
}) => Data(  id: id ?? _id,
  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  idVendor: idVendor ?? _idVendor,
  flightNo: flightNo ?? _flightNo,
  codeAirlines: codeAirlines ?? _codeAirlines,
  ticketPrice: ticketPrice ?? _ticketPrice,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  dynamic get id => _id;
  String? get idRequestTrip => _idRequestTrip;
  String? get idVendor => _idVendor;
  String? get flightNo => _flightNo;
  String? get codeAirlines => _codeAirlines;
  num? get ticketPrice => _ticketPrice;
  String? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  num? get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_request_trip'] = _idRequestTrip;
    map['id_vendor'] = _idVendor;
    map['flight_no'] = _flightNo;
    map['code_airlines'] = _codeAirlines;
    map['ticket_price'] = _ticketPrice;
    map['code_status_doc'] = _codeStatusDoc;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}