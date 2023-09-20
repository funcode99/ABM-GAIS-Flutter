class GetAirlinessModel {
  GetAirlinessModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
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

  GetAirlinessModel copyWith({
    bool? success,
    String? message,
    List<Data>? data,
  }) =>
      GetAirlinessModel(
        success: success ?? _success,
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
    dynamic pnrid,
    String? noRequestTrip,
    String? employeeName,
    String? vendor,
    String? departure,
    String? arrival,
    String? departureTime,
    String? arrivalTime,
    String? departureDate,
    String? arrivalDate,
    String? flightClass,
  }) {
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
    _noRequestTrip = noRequestTrip;
    _employeeName = employeeName;
    _vendor = vendor;
    _departure = departure;
    _arrival = arrival;
    _departureTime = departureTime;
    _arrivalTime = arrivalTime;
    _departureDate = departureDate;
    _arrivalDate = arrivalDate;
    _flightClass = flightClass;
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
    _noRequestTrip = json['no_request_trip'];
    _employeeName = json['employee_name'];
    _vendor = json['vendor'];
    _departure = json['departure'];
    _arrival = json['arrival'];
    _departureTime = json['departure_time'];
    _arrivalTime = json['arrival_time'];
    _departureDate = json['departure_date'];
    _arrivalDate = json['arrival_date'];
    _flightClass = json['flight_class'];
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
  dynamic _pnrid;
  String? _noRequestTrip;
  String? _employeeName;
  String? _vendor;
  String? _departure;
  String? _arrival;
  String? _departureTime;
  String? _arrivalTime;
  String? _departureDate;
  String? _arrivalDate;
  String? _flightClass;

  Data copyWith({
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
    dynamic pnrid,
    String? noRequestTrip,
    String? employeeName,
    String? vendor,
    String? departure,
    String? arrival,
    String? departureTime,
    String? arrivalTime,
    String? departureDate,
    String? arrivalDate,
    String? flightClass,
  }) =>
      Data(
        id: id ?? _id,
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
        noRequestTrip: noRequestTrip ?? _noRequestTrip,
        employeeName: employeeName ?? _employeeName,
        vendor: vendor ?? _vendor,
        departure: departure ?? _departure,
        arrival: arrival ?? _arrival,
        departureTime: departureTime ?? _departureTime,
        arrivalTime: arrivalTime ?? _arrivalTime,
        departureDate: departureDate ?? _departureDate,
        arrivalDate: arrivalDate ?? _arrivalDate,
        flightClass: flightClass ?? _flightClass,
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

  dynamic get pnrid => _pnrid;

  String? get noRequestTrip => _noRequestTrip;

  String? get employeeName => _employeeName;

  String? get vendor => _vendor;

  String? get departure => _departure;

  String? get arrival => _arrival;

  String? get departureTime => _departureTime;

  String? get arrivalTime => _arrivalTime;

  String? get departureDate => _departureDate;

  String? get arrivalDate => _arrivalDate;

  String? get flightClass => _flightClass;

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
    map['no_request_trip'] = _noRequestTrip;
    map['employee_name'] = _employeeName;
    map['vendor'] = _vendor;
    map['departure'] = _departure;
    map['arrival'] = _arrival;
    map['departure_time'] = _departureTime;
    map['arrival_time'] = _arrivalTime;
    map['departure_date'] = _departureDate;
    map['arrival_date'] = _arrivalDate;
    map['flight_class'] = _flightClass;
    return map;
  }
}
