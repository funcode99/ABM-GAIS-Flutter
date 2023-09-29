class GetAccommodationModel {
  GetAccommodationModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetAccommodationModel.fromJson(dynamic json) {
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

  GetAccommodationModel copyWith({
    bool? success,
    String? message,
    List<Data>? data,
  }) =>
      GetAccommodationModel(
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
    int? idTypeAccomodation,
    String? checkInDate,
    String? checkOutDate,
    int? idVendor,
    int? useGl,
    int? idCity,
    dynamic sharingWName,
    String? remarks,
    String? price,
    String? codeHotel,
    int? codeStatusDoc,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
    dynamic travelerName,
    dynamic codeCountry,
    dynamic nameCountry,
    dynamic codeCity,
    dynamic nameCity,
    dynamic room,
    dynamic guest,
    dynamic pnrid,
    dynamic jenkel,
    dynamic hotelFare,
    String? noRequestTrip,
    String? typeAccomodation,
    int? code,
    String? status,
    String? cityName,
    dynamic hotelName,
    dynamic address,
    String? employeeName,
    dynamic vendor,
  }) {
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
    _noRequestTrip = noRequestTrip;
    _typeAccomodation = typeAccomodation;
    _code = code;
    _status = status;
    _cityName = cityName;
    _hotelName = hotelName;
    _address = address;
    _employeeName = employeeName;
    _vendor = vendor;
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
    _noRequestTrip = json['no_request_trip'];
    _typeAccomodation = json['type_accomodation'];
    _code = json['code'];
    _status = json['status'];
    _cityName = json['city_name'];
    _hotelName = json['hotel_name'];
    _address = json['address'];
    _employeeName = json['employee_name'];
    _vendor = json['vendor'];
  }

  String? _id;
  String? _idRequestTrip;
  int? _idTypeAccomodation;
  String? _checkInDate;
  String? _checkOutDate;
  int? _idVendor;
  int? _useGl;
  int? _idCity;
  dynamic _sharingWName;
  String? _remarks;
  String? _price;
  String? _codeHotel;
  int? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  String? _updatedBy;
  dynamic _travelerName;
  dynamic _codeCountry;
  dynamic _nameCountry;
  dynamic _codeCity;
  dynamic _nameCity;
  dynamic _room;
  dynamic _guest;
  dynamic _pnrid;
  dynamic _jenkel;
  dynamic _hotelFare;
  String? _noRequestTrip;
  String? _typeAccomodation;
  int? _code;
  String? _status;
  String? _cityName;
  dynamic _hotelName;
  dynamic _address;
  String? _employeeName;
  dynamic _vendor;

  Data copyWith({
    String? id,
    String? idRequestTrip,
    int? idTypeAccomodation,
    String? checkInDate,
    String? checkOutDate,
    int? idVendor,
    int? useGl,
    int? idCity,
    dynamic sharingWName,
    String? remarks,
    String? price,
    String? codeHotel,
    int? codeStatusDoc,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    String? updatedBy,
    dynamic travelerName,
    dynamic codeCountry,
    dynamic nameCountry,
    dynamic codeCity,
    dynamic nameCity,
    dynamic room,
    dynamic guest,
    dynamic pnrid,
    dynamic jenkel,
    dynamic hotelFare,
    String? noRequestTrip,
    String? typeAccomodation,
    int? code,
    String? status,
    String? cityName,
    dynamic hotelName,
    dynamic address,
    String? employeeName,
    dynamic vendor,
  }) =>
      Data(
        id: id ?? _id,
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
        noRequestTrip: noRequestTrip ?? _noRequestTrip,
        typeAccomodation: typeAccomodation ?? _typeAccomodation,
        code: code ?? _code,
        status: status ?? _status,
        cityName: cityName ?? _cityName,
        hotelName: hotelName ?? _hotelName,
        address: address ?? _address,
        employeeName: employeeName ?? _employeeName,
        vendor: vendor ?? _vendor,
      );

  String? get id => _id;

  String? get idRequestTrip => _idRequestTrip;

  int? get idTypeAccomodation => _idTypeAccomodation;

  String? get checkInDate => _checkInDate;

  String? get checkOutDate => _checkOutDate;

  int? get idVendor => _idVendor;

  int? get useGl => _useGl;

  int? get idCity => _idCity;

  dynamic get sharingWName => _sharingWName;

  String? get remarks => _remarks;

  String? get price => _price;

  String? get codeHotel => _codeHotel;

  int? get codeStatusDoc => _codeStatusDoc;

  String? get createdAt => _createdAt;

  String? get createdBy => _createdBy;

  String? get updatedAt => _updatedAt;

  String? get updatedBy => _updatedBy;

  dynamic get travelerName => _travelerName;

  dynamic get codeCountry => _codeCountry;

  dynamic get nameCountry => _nameCountry;

  dynamic get codeCity => _codeCity;

  dynamic get nameCity => _nameCity;

  dynamic get room => _room;

  dynamic get guest => _guest;

  dynamic get pnrid => _pnrid;

  dynamic get jenkel => _jenkel;

  dynamic get hotelFare => _hotelFare;

  String? get noRequestTrip => _noRequestTrip;

  String? get typeAccomodation => _typeAccomodation;

  int? get code => _code;

  String? get status => _status;

  String? get cityName => _cityName;

  dynamic get hotelName => _hotelName;

  dynamic get address => _address;

  String? get employeeName => _employeeName;

  dynamic get vendor => _vendor;

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
    map['no_request_trip'] = _noRequestTrip;
    map['type_accomodation'] = _typeAccomodation;
    map['code'] = _code;
    map['status'] = _status;
    map['city_name'] = _cityName;
    map['hotel_name'] = _hotelName;
    map['address'] = _address;
    map['employee_name'] = _employeeName;
    map['vendor'] = _vendor;
    return map;
  }
}
