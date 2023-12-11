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

class Data {
  Data({
      String? id, 
      String? idRequestTrip, 
      int? idVendor, 
      String? flightNo, 
      String? codeAirlines, 
      String? ticketPrice, 
      int? codeStatusDoc, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      String? pnrid, 
      String? origin, 
      String? destination, 
      String? departDate, 
      String? travelerName, 
      dynamic travelersObject,
      int? isRoundTrip,
      int? adult, 
      int? child, 
      int? infant, 
      String? returnDate, 
      String? flightClass, 
      dynamic isRevision, 
      dynamic isRescheduled,}){
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
    _pnrid = pnrid;
    _origin = origin;
    _destination = destination;
    _departDate = departDate;
    _travelerName = travelerName;
    _travelersObject = travelersObject;
    _isRoundTrip = isRoundTrip;
    _adult = adult;
    _child = child;
    _infant = infant;
    _returnDate = returnDate;
    _flightClass = flightClass;
    _isRevision = isRevision;
    _isRescheduled = isRescheduled;
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
    _pnrid = json['pnrid'];
    _origin = json['origin'];
    _destination = json['destination'];
    _departDate = json['depart_date'];
    _travelerName = json['traveler_name'];
    _travelersObject = json['travelers_object'];
    _isRoundTrip = json['is_round_trip'];
    _adult = json['Adult'];
    _child = json['Child'];
    _infant = json['Infant'];
    _returnDate = json['return_date'];
    _flightClass = json['flight_class'];
    _isRevision = json['is_revision'];
    _isRescheduled = json['is_rescheduled'];
  }
  String? _id;
  String? _idRequestTrip;
  int? _idVendor;
  String? _flightNo;
  String? _codeAirlines;
  String? _ticketPrice;
  int? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  String? _pnrid;
  String? _origin;
  String? _destination;
  String? _departDate;
  String? _travelerName;
  dynamic _travelersObject;
  int? _isRoundTrip;
  int? _adult;
  int? _child;
  int? _infant;
  String? _returnDate;
  String? _flightClass;
  dynamic _isRevision;
  dynamic _isRescheduled;
Data copyWith({  String? id,
  String? idRequestTrip,
  int? idVendor,
  String? flightNo,
  String? codeAirlines,
  String? ticketPrice,
  int? codeStatusDoc,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
  String? pnrid,
  String? origin,
  String? destination,
  String? departDate,
  String? travelerName,
  dynamic travelersObject,
  int? isRoundTrip,
  int? adult,
  int? child,
  int? infant,
  String? returnDate,
  String? flightClass,
  dynamic isRevision,
  dynamic isRescheduled,
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
  pnrid: pnrid ?? _pnrid,
  origin: origin ?? _origin,
  destination: destination ?? _destination,
  departDate: departDate ?? _departDate,
  travelerName: travelerName ?? _travelerName,
  travelersObject: travelersObject ?? _travelersObject,
  isRoundTrip: isRoundTrip ?? _isRoundTrip,
  adult: adult ?? _adult,
  child: child ?? _child,
  infant: infant ?? _infant,
  returnDate: returnDate ?? _returnDate,
  flightClass: flightClass ?? _flightClass,
  isRevision: isRevision ?? _isRevision,
  isRescheduled: isRescheduled ?? _isRescheduled,
);
  String? get id => _id;
  String? get idRequestTrip => _idRequestTrip;
  int? get idVendor => _idVendor;
  String? get flightNo => _flightNo;
  String? get codeAirlines => _codeAirlines;
  String? get ticketPrice => _ticketPrice;
  int? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  String? get pnrid => _pnrid;
  String? get origin => _origin;
  String? get destination => _destination;
  String? get departDate => _departDate;
  String? get travelerName => _travelerName;
  dynamic get travelersObject => _travelersObject;
  int? get isRoundTrip => _isRoundTrip;
  int? get adult => _adult;
  int? get child => _child;
  int? get infant => _infant;
  String? get returnDate => _returnDate;
  String? get flightClass => _flightClass;
  dynamic get isRevision => _isRevision;
  dynamic get isRescheduled => _isRescheduled;

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
    map['pnrid'] = _pnrid;
    map['origin'] = _origin;
    map['destination'] = _destination;
    map['depart_date'] = _departDate;
    map['traveler_name'] = _travelerName;
    map['travelers_object'] = _travelersObject;
    map['is_round_trip'] = _isRoundTrip;
    map['Adult'] = _adult;
    map['Child'] = _child;
    map['Infant'] = _infant;
    map['return_date'] = _returnDate;
    map['flight_class'] = _flightClass;
    map['is_revision'] = _isRevision;
    map['is_rescheduled'] = _isRescheduled;
    return map;
  }

}