class UpdateAccommodationModel {
  UpdateAccommodationModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdateAccommodationModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UpdateAccommodationModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UpdateAccommodationModel(  success: success ?? _success,
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
      String? id, 
      String? idRequestTrip, 
      String? idTypeAccomodation, 
      String? checkInDate, 
      String? checkOutDate, 
      String? idVendor, 
      String? useGl, 
      String? idCity, 
      String? sharingWName, 
      String? remarks, 
      int? price, 
      String? codeHotel, 
      String? codeStatusDoc, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      int? updatedBy, 
      String? travelerName, 
      String? codeCountry, 
      String? nameCountry, 
      String? codeCity, 
      String? nameCity, 
      String? room, 
      String? guest, 
      String? pnrid, 
      String? jenkel, 
      String? hotelFare,}){
    _id = id;
    _idRequestTrip = idRequestTrip;
    _idTypeAccomodation = idTypeAccomodation;
    _checkInDate = checkInDate;
    _checkOutDate = checkOutDate;
    _idVendor = idVendor;
    _useGl = useGl;
    _idCity = idCity;
    _sharingWName = sharingWName;
    _remarks = remarks;
    _price = price;
    _codeHotel = codeHotel;
    _codeStatusDoc = codeStatusDoc;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _travelerName = travelerName;
    _codeCountry = codeCountry;
    _nameCountry = nameCountry;
    _codeCity = codeCity;
    _nameCity = nameCity;
    _room = room;
    _guest = guest;
    _pnrid = pnrid;
    _jenkel = jenkel;
    _hotelFare = hotelFare;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idRequestTrip = json['id_request_trip'];
    _idTypeAccomodation = json['id_type_accomodation'];
    _checkInDate = json['check_in_date'];
    _checkOutDate = json['check_out_date'];
    _idVendor = json['id_vendor'];
    _useGl = json['use_gl'];
    _idCity = json['id_city'];
    _sharingWName = json['sharing_w_name'];
    _remarks = json['remarks'];
    _price = json['price'];
    _codeHotel = json['code_hotel'];
    _codeStatusDoc = json['code_status_doc'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _travelerName = json['traveler_name'];
    _codeCountry = json['code_country'];
    _nameCountry = json['name_country'];
    _codeCity = json['code_city'];
    _nameCity = json['name_city'];
    _room = json['room'];
    _guest = json['guest'];
    _pnrid = json['pnrid'];
    _jenkel = json['jenkel'];
    _hotelFare = json['hotel_fare'];
  }
  String? _id;
  String? _idRequestTrip;
  String? _idTypeAccomodation;
  String? _checkInDate;
  String? _checkOutDate;
  String? _idVendor;
  String? _useGl;
  String? _idCity;
  String? _sharingWName;
  String? _remarks;
  int? _price;
  String? _codeHotel;
  String? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  int? _updatedBy;
  String? _travelerName;
  String? _codeCountry;
  String? _nameCountry;
  String? _codeCity;
  String? _nameCity;
  String? _room;
  String? _guest;
  String? _pnrid;
  String? _jenkel;
  String? _hotelFare;
Data copyWith({  String? id,
  String? idRequestTrip,
  String? idTypeAccomodation,
  String? checkInDate,
  String? checkOutDate,
  String? idVendor,
  String? useGl,
  String? idCity,
  String? sharingWName,
  String? remarks,
  int? price,
  String? codeHotel,
  String? codeStatusDoc,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  int? updatedBy,
  String? travelerName,
  String? codeCountry,
  String? nameCountry,
  String? codeCity,
  String? nameCity,
  String? room,
  String? guest,
  String? pnrid,
  String? jenkel,
  String? hotelFare,
}) => Data(  id: id ?? _id,
  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  idTypeAccomodation: idTypeAccomodation ?? _idTypeAccomodation,
  checkInDate: checkInDate ?? _checkInDate,
  checkOutDate: checkOutDate ?? _checkOutDate,
  idVendor: idVendor ?? _idVendor,
  useGl: useGl ?? _useGl,
  idCity: idCity ?? _idCity,
  sharingWName: sharingWName ?? _sharingWName,
  remarks: remarks ?? _remarks,
  price: price ?? _price,
  codeHotel: codeHotel ?? _codeHotel,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  travelerName: travelerName ?? _travelerName,
  codeCountry: codeCountry ?? _codeCountry,
  nameCountry: nameCountry ?? _nameCountry,
  codeCity: codeCity ?? _codeCity,
  nameCity: nameCity ?? _nameCity,
  room: room ?? _room,
  guest: guest ?? _guest,
  pnrid: pnrid ?? _pnrid,
  jenkel: jenkel ?? _jenkel,
  hotelFare: hotelFare ?? _hotelFare,
);
  String? get id => _id;
  String? get idRequestTrip => _idRequestTrip;
  String? get idTypeAccomodation => _idTypeAccomodation;
  String? get checkInDate => _checkInDate;
  String? get checkOutDate => _checkOutDate;
  String? get idVendor => _idVendor;
  String? get useGl => _useGl;
  String? get idCity => _idCity;
  String? get sharingWName => _sharingWName;
  String? get remarks => _remarks;
  int? get price => _price;
  String? get codeHotel => _codeHotel;
  String? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  int? get updatedBy => _updatedBy;
  String? get travelerName => _travelerName;
  String? get codeCountry => _codeCountry;
  String? get nameCountry => _nameCountry;
  String? get codeCity => _codeCity;
  String? get nameCity => _nameCity;
  String? get room => _room;
  String? get guest => _guest;
  String? get pnrid => _pnrid;
  String? get jenkel => _jenkel;
  String? get hotelFare => _hotelFare;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_request_trip'] = _idRequestTrip;
    map['id_type_accomodation'] = _idTypeAccomodation;
    map['check_in_date'] = _checkInDate;
    map['check_out_date'] = _checkOutDate;
    map['id_vendor'] = _idVendor;
    map['use_gl'] = _useGl;
    map['id_city'] = _idCity;
    map['sharing_w_name'] = _sharingWName;
    map['remarks'] = _remarks;
    map['price'] = _price;
    map['code_hotel'] = _codeHotel;
    map['code_status_doc'] = _codeStatusDoc;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['traveler_name'] = _travelerName;
    map['code_country'] = _codeCountry;
    map['name_country'] = _nameCountry;
    map['code_city'] = _codeCity;
    map['name_city'] = _nameCity;
    map['room'] = _room;
    map['guest'] = _guest;
    map['pnrid'] = _pnrid;
    map['jenkel'] = _jenkel;
    map['hotel_fare'] = _hotelFare;
    return map;
  }

}