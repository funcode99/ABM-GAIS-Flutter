/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"id_request_trip":1,"id_vendor":1,"flight_no":"1","code_airlines":"1","ticket_price":"15000","code_status_doc":0,"created_at":"2023-05-15 20:18:32","created_by":"1","updated_at":"2023-05-15 20:18:32","updated_by":null}]

class GetAirlinessBytripModel {
  GetAirlinessBytripModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetAirlinessBytripModel.fromJson(dynamic json) {
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
GetAirlinessBytripModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetAirlinessBytripModel(  success: success ?? _success,
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
/// id_request_trip : 1
/// id_vendor : 1
/// flight_no : "1"
/// code_airlines : "1"
/// ticket_price : "15000"
/// code_status_doc : 0
/// created_at : "2023-05-15 20:18:32"
/// created_by : "1"
/// updated_at : "2023-05-15 20:18:32"
/// updated_by : null

class Data {
  Data({
      num? id, 
      num? idRequestTrip, 
      num? idVendor, 
      String? flightNo, 
      String? codeAirlines, 
      String? ticketPrice, 
      num? codeStatusDoc,
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy,}){
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
  num? _id;
  num? _idRequestTrip;
  num? _idVendor;
  String? _flightNo;
  String? _codeAirlines;
  String? _ticketPrice;
  num? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
Data copyWith({  num? id,
  num? idRequestTrip,
  num? idVendor,
  String? flightNo,
  String? codeAirlines,
  String? ticketPrice,
  num? codeStatusDoc,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
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
  num? get id => _id;
  num? get idRequestTrip => _idRequestTrip;
  num? get idVendor => _idVendor;
  String? get flightNo => _flightNo;
  String? get codeAirlines => _codeAirlines;
  String? get ticketPrice => _ticketPrice;
  num? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;

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