/// success : true
/// message : "Success Update Data"
/// data : {"purpose_of_trip":"updated","traveller_guest_trip":"","flight_trip":"updated","taxi_voucher":"updated","other_transportation":"","accomodation_trip":"","cash_advance":"updated"}

class SubmitRequestTripModel {
  SubmitRequestTripModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SubmitRequestTripModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SubmitRequestTripModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SubmitRequestTripModel(  success: success ?? _success,
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

/// purpose_of_trip : "updated"
/// traveller_guest_trip : ""
/// flight_trip : "updated"
/// taxi_voucher : "updated"
/// other_transportation : ""
/// accomodation_trip : ""
/// cash_advance : "updated"

class Data {
  Data({
      String? purposeOfTrip, 
      String? travellerGuestTrip, 
      String? flightTrip, 
      String? taxiVoucher, 
      String? otherTransportation, 
      String? accomodationTrip, 
      String? cashAdvance,}){
    _purposeOfTrip = purposeOfTrip;
    _travellerGuestTrip = travellerGuestTrip;
    _flightTrip = flightTrip;
    _taxiVoucher = taxiVoucher;
    _otherTransportation = otherTransportation;
    _accomodationTrip = accomodationTrip;
    _cashAdvance = cashAdvance;
}

  Data.fromJson(dynamic json) {
    _purposeOfTrip = json['purpose_of_trip'];
    _travellerGuestTrip = json['traveller_guest_trip'];
    _flightTrip = json['flight_trip'];
    _taxiVoucher = json['taxi_voucher'];
    _otherTransportation = json['other_transportation'];
    _accomodationTrip = json['accomodation_trip'];
    _cashAdvance = json['cash_advance'];
  }
  String? _purposeOfTrip;
  String? _travellerGuestTrip;
  String? _flightTrip;
  String? _taxiVoucher;
  String? _otherTransportation;
  String? _accomodationTrip;
  String? _cashAdvance;
Data copyWith({  String? purposeOfTrip,
  String? travellerGuestTrip,
  String? flightTrip,
  String? taxiVoucher,
  String? otherTransportation,
  String? accomodationTrip,
  String? cashAdvance,
}) => Data(  purposeOfTrip: purposeOfTrip ?? _purposeOfTrip,
  travellerGuestTrip: travellerGuestTrip ?? _travellerGuestTrip,
  flightTrip: flightTrip ?? _flightTrip,
  taxiVoucher: taxiVoucher ?? _taxiVoucher,
  otherTransportation: otherTransportation ?? _otherTransportation,
  accomodationTrip: accomodationTrip ?? _accomodationTrip,
  cashAdvance: cashAdvance ?? _cashAdvance,
);
  String? get purposeOfTrip => _purposeOfTrip;
  String? get travellerGuestTrip => _travellerGuestTrip;
  String? get flightTrip => _flightTrip;
  String? get taxiVoucher => _taxiVoucher;
  String? get otherTransportation => _otherTransportation;
  String? get accomodationTrip => _accomodationTrip;
  String? get cashAdvance => _cashAdvance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['purpose_of_trip'] = _purposeOfTrip;
    map['traveller_guest_trip'] = _travellerGuestTrip;
    map['flight_trip'] = _flightTrip;
    map['taxi_voucher'] = _taxiVoucher;
    map['other_transportation'] = _otherTransportation;
    map['accomodation_trip'] = _accomodationTrip;
    map['cash_advance'] = _cashAdvance;
    return map;
  }

}