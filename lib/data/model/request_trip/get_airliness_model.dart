/// success : true
/// message : "Success Get Data"
/// data : [{"id":15,"id_request_trip":35,"id_vendor":1,"flight_no":"QG828","code_airlines":"QG","ticket_price":"899000","code_status_doc":0,"created_at":"2023-05-26 09:14:41","created_by":"2","updated_at":"2023-05-26 09:14:41","updated_by":null,"no_request_trip":"1","employee_name":"John Doe","vendor":"Antavaya"},{"id":13,"id_request_trip":27,"id_vendor":1,"flight_no":"QG828","code_airlines":"QG","ticket_price":"899000","code_status_doc":1,"created_at":"2023-05-25 02:51:11","created_by":"2","updated_at":"2023-05-25 02:51:11","updated_by":null,"no_request_trip":"1","employee_name":"John Doe","vendor":"Antavaya"},{"id":11,"id_request_trip":15,"id_vendor":1,"flight_no":"QG828","code_airlines":"QG","ticket_price":"899000","code_status_doc":1,"created_at":"2023-05-22 21:19:13","created_by":"2","updated_at":"2023-05-22 21:19:13","updated_by":null,"no_request_trip":"REQ/ABM/123","employee_name":"John Doe","vendor":"Antavaya"},{"id":14,"id_request_trip":27,"id_vendor":2,"flight_no":"QG828","code_airlines":"QG","ticket_price":"899000","code_status_doc":1,"created_at":"2023-05-25 02:51:56","created_by":"2","updated_at":"2023-05-25 02:51:56","updated_by":null,"no_request_trip":"1","employee_name":"John Doe","vendor":"Aerowisata"},{"id":12,"id_request_trip":23,"id_vendor":2,"flight_no":"QG828","code_airlines":"QG","ticket_price":"899000","code_status_doc":1,"created_at":"2023-05-24 00:30:39","created_by":"2","updated_at":"2023-05-24 00:30:39","updated_by":null,"no_request_trip":"REQ/ABM/123","employee_name":"John Doe","vendor":"Aerowisata"},{"id":9,"id_request_trip":3,"id_vendor":2,"flight_no":"QG828","code_airlines":"QG","ticket_price":"899000","code_status_doc":0,"created_at":"2023-05-21 05:57:26","created_by":"2","updated_at":"2023-05-21 05:57:26","updated_by":null,"no_request_trip":"REQ/ABM/123","employee_name":"John Doe","vendor":"Aerowisata"},{"id":5,"id_request_trip":3,"id_vendor":2,"flight_no":"QG828","code_airlines":"QG","ticket_price":"899000","code_status_doc":0,"created_at":"2023-05-19 08:10:59","created_by":"2","updated_at":"2023-05-19 08:10:59","updated_by":null,"no_request_trip":"REQ/ABM/123","employee_name":"John Doe","vendor":"Aerowisata"}]

class GetAirlinessModel {
  GetAirlinessModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetAirlinessModel.fromJson(dynamic json) {
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
GetAirlinessModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetAirlinessModel(  success: success ?? _success,
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

/// id : 15
/// id_request_trip : 35
/// id_vendor : 1
/// flight_no : "QG828"
/// code_airlines : "QG"
/// ticket_price : "899000"
/// code_status_doc : 0
/// created_at : "2023-05-26 09:14:41"
/// created_by : "2"
/// updated_at : "2023-05-26 09:14:41"
/// updated_by : null
/// no_request_trip : "1"
/// employee_name : "John Doe"
/// vendor : "Antavaya"

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
      dynamic updatedBy, 
      String? noRequestTrip, 
      String? employeeName, 
      String? vendor,}){
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
    _noRequestTrip = noRequestTrip;
    _employeeName = employeeName;
    _vendor = vendor;
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
    _noRequestTrip = json['no_request_trip'];
    _employeeName = json['employee_name'];
    _vendor = json['vendor'];
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
  String? _noRequestTrip;
  String? _employeeName;
  String? _vendor;
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
  String? noRequestTrip,
  String? employeeName,
  String? vendor,
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
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
  employeeName: employeeName ?? _employeeName,
  vendor: vendor ?? _vendor,
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
  String? get noRequestTrip => _noRequestTrip;
  String? get employeeName => _employeeName;
  String? get vendor => _vendor;

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
    map['no_request_trip'] = _noRequestTrip;
    map['employee_name'] = _employeeName;
    map['vendor'] = _vendor;
    return map;
  }

}