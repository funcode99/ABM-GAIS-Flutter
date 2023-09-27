class SaveAirlinessModel {
  SaveAirlinessModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveAirlinessModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveAirlinessModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveAirlinessModel(  success: success ?? _success,
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

class Data {
  Data({
      String? idRequestTrip, 
      String? idVendor, 
      String? flightNo, 
      String? codeAirlines, 
      int? ticketPrice, 
      String? pnrid, 
      String? origin, 
      String? destination, 
      String? departDate, 
      String? adult, 
      String? child, 
      String? infant, 
      String? returnDate, 
      String? isRoundTrip, 
      String? travelerName, 
      String? flightClass, 
      String? createdAt, 
      int? createdBy, 
      String? codeStatusDoc, 
      String? id, 
      String? updatedAt,}){
    _idRequestTrip = idRequestTrip;
    _idVendor = idVendor;
    _flightNo = flightNo;
    _codeAirlines = codeAirlines;
    _ticketPrice = ticketPrice;
    _pnrid = pnrid;
    _origin = origin;
    _destination = destination;
    _departDate = departDate;
    _adult = adult;
    _child = child;
    _infant = infant;
    _returnDate = returnDate;
    _isRoundTrip = isRoundTrip;
    _travelerName = travelerName;
    _flightClass = flightClass;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _codeStatusDoc = codeStatusDoc;
    _id = id;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _idRequestTrip = json['id_request_trip'];
    _idVendor = json['id_vendor'];
    _flightNo = json['flight_no'];
    _codeAirlines = json['code_airlines'];
    _ticketPrice = json['ticket_price'];
    _pnrid = json['pnrid'];
    _origin = json['origin'];
    _destination = json['destination'];
    _departDate = json['depart_date'];
    _adult = json['Adult'];
    _child = json['Child'];
    _infant = json['Infant'];
    _returnDate = json['return_date'];
    _isRoundTrip = json['is_round_trip'];
    _travelerName = json['traveler_name'];
    _flightClass = json['flight_class'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _codeStatusDoc = json['code_status_doc'];
    _id = json['id'];
    _updatedAt = json['updated_at'];
  }
  String? _idRequestTrip;
  String? _idVendor;
  String? _flightNo;
  String? _codeAirlines;
  int? _ticketPrice;
  String? _pnrid;
  String? _origin;
  String? _destination;
  String? _departDate;
  String? _adult;
  String? _child;
  String? _infant;
  String? _returnDate;
  String? _isRoundTrip;
  String? _travelerName;
  String? _flightClass;
  String? _createdAt;
  int? _createdBy;
  String? _codeStatusDoc;
  String? _id;
  String? _updatedAt;
Data copyWith({  String? idRequestTrip,
  String? idVendor,
  String? flightNo,
  String? codeAirlines,
  int? ticketPrice,
  String? pnrid,
  String? origin,
  String? destination,
  String? departDate,
  String? adult,
  String? child,
  String? infant,
  String? returnDate,
  String? isRoundTrip,
  String? travelerName,
  String? flightClass,
  String? createdAt,
  int? createdBy,
  String? codeStatusDoc,
  String? id,
  String? updatedAt,
}) => Data(  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  idVendor: idVendor ?? _idVendor,
  flightNo: flightNo ?? _flightNo,
  codeAirlines: codeAirlines ?? _codeAirlines,
  ticketPrice: ticketPrice ?? _ticketPrice,
  pnrid: pnrid ?? _pnrid,
  origin: origin ?? _origin,
  destination: destination ?? _destination,
  departDate: departDate ?? _departDate,
  adult: adult ?? _adult,
  child: child ?? _child,
  infant: infant ?? _infant,
  returnDate: returnDate ?? _returnDate,
  isRoundTrip: isRoundTrip ?? _isRoundTrip,
  travelerName: travelerName ?? _travelerName,
  flightClass: flightClass ?? _flightClass,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  id: id ?? _id,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get idRequestTrip => _idRequestTrip;
  String? get idVendor => _idVendor;
  String? get flightNo => _flightNo;
  String? get codeAirlines => _codeAirlines;
  int? get ticketPrice => _ticketPrice;
  String? get pnrid => _pnrid;
  String? get origin => _origin;
  String? get destination => _destination;
  String? get departDate => _departDate;
  String? get adult => _adult;
  String? get child => _child;
  String? get infant => _infant;
  String? get returnDate => _returnDate;
  String? get isRoundTrip => _isRoundTrip;
  String? get travelerName => _travelerName;
  String? get flightClass => _flightClass;
  String? get createdAt => _createdAt;
  int? get createdBy => _createdBy;
  String? get codeStatusDoc => _codeStatusDoc;
  String? get id => _id;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_request_trip'] = _idRequestTrip;
    map['id_vendor'] = _idVendor;
    map['flight_no'] = _flightNo;
    map['code_airlines'] = _codeAirlines;
    map['ticket_price'] = _ticketPrice;
    map['pnrid'] = _pnrid;
    map['origin'] = _origin;
    map['destination'] = _destination;
    map['depart_date'] = _departDate;
    map['Adult'] = _adult;
    map['Child'] = _child;
    map['Infant'] = _infant;
    map['return_date'] = _returnDate;
    map['is_round_trip'] = _isRoundTrip;
    map['traveler_name'] = _travelerName;
    map['flight_class'] = _flightClass;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['code_status_doc'] = _codeStatusDoc;
    map['id'] = _id;
    map['updated_at'] = _updatedAt;
    return map;
  }

}