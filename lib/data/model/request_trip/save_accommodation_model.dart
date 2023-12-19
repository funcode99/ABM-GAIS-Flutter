class SaveAccommodationModel {
  SaveAccommodationModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveAccommodationModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveAccommodationModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveAccommodationModel(  success: success ?? _success,
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
      Header? header, 
      List<Guest>? guest, 
      List<Beds>? beds, 
      Contact? contact,}){
    _header = header;
    _guest = guest;
    _beds = beds;
    _contact = contact;
}

  Data.fromJson(dynamic json) {
    _header = json['header'] != null ? Header.fromJson(json['header']) : null;
    if (json['Guest'] != null) {
      _guest = [];
      json['Guest'].forEach((v) {
        _guest?.add(Guest.fromJson(v));
      });
    }
    if (json['beds'] != null) {
      _beds = [];
      json['beds'].forEach((v) {
        _beds?.add(Beds.fromJson(v));
      });
    }
    _contact = json['contact'] != null ? Contact.fromJson(json['contact']) : null;
  }
  Header? _header;
  List<Guest>? _guest;
  List<Beds>? _beds;
  Contact? _contact;
Data copyWith({  Header? header,
  List<Guest>? guest,
  List<Beds>? beds,
  Contact? contact,
}) => Data(  header: header ?? _header,
  guest: guest ?? _guest,
  beds: beds ?? _beds,
  contact: contact ?? _contact,
);
  Header? get header => _header;
  List<Guest>? get guest => _guest;
  List<Beds>? get beds => _beds;
  Contact? get contact => _contact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_header != null) {
      map['header'] = _header?.toJson();
    }
    if (_guest != null) {
      map['Guest'] = _guest?.map((v) => v.toJson()).toList();
    }
    if (_beds != null) {
      map['beds'] = _beds?.map((v) => v.toJson()).toList();
    }
    if (_contact != null) {
      map['contact'] = _contact?.toJson();
    }
    return map;
  }

}

class Contact {
  Contact({
      String? title, 
      String? firstName, 
      String? lastName, 
      String? mobilePhone, 
      String? email, 
      String? remark, 
      String? id, 
      String? idAccomodation, 
      String? updatedAt, 
      String? createdAt,}){
    _title = title;
    _firstName = firstName;
    _lastName = lastName;
    _mobilePhone = mobilePhone;
    _email = email;
    _remark = remark;
    _id = id;
    _idAccomodation = idAccomodation;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  Contact.fromJson(dynamic json) {
    _title = json['Title'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _mobilePhone = json['MobilePhone'];
    _email = json['Email'];
    _remark = json['Remark'];
    _id = json['id'];
    _idAccomodation = json['id_accomodation'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }
  String? _title;
  String? _firstName;
  String? _lastName;
  String? _mobilePhone;
  String? _email;
  String? _remark;
  String? _id;
  String? _idAccomodation;
  String? _updatedAt;
  String? _createdAt;
Contact copyWith({  String? title,
  String? firstName,
  String? lastName,
  String? mobilePhone,
  String? email,
  String? remark,
  String? id,
  String? idAccomodation,
  String? updatedAt,
  String? createdAt,
}) => Contact(  title: title ?? _title,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  mobilePhone: mobilePhone ?? _mobilePhone,
  email: email ?? _email,
  remark: remark ?? _remark,
  id: id ?? _id,
  idAccomodation: idAccomodation ?? _idAccomodation,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
);
  String? get title => _title;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get mobilePhone => _mobilePhone;
  String? get email => _email;
  String? get remark => _remark;
  String? get id => _id;
  String? get idAccomodation => _idAccomodation;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Title'] = _title;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['MobilePhone'] = _mobilePhone;
    map['Email'] = _email;
    map['Remark'] = _remark;
    map['id'] = _id;
    map['id_accomodation'] = _idAccomodation;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }

}

class Beds {
  Beds({
      String? index, 
      String? countAdult, 
      String? requestChildBed, 
      String? type, 
      String? id, 
      String? idAccomodation, 
      String? updatedAt, 
      String? createdAt,}){
    _index = index;
    _countAdult = countAdult;
    _requestChildBed = requestChildBed;
    _type = type;
    _id = id;
    _idAccomodation = idAccomodation;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  Beds.fromJson(dynamic json) {
    _index = json['Index'];
    _countAdult = json['CountAdult'];
    _requestChildBed = json['RequestChildBed'];
    _type = json['Type'];
    _id = json['id'];
    _idAccomodation = json['id_accomodation'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }
  String? _index;
  String? _countAdult;
  String? _requestChildBed;
  String? _type;
  String? _id;
  String? _idAccomodation;
  String? _updatedAt;
  String? _createdAt;
Beds copyWith({  String? index,
  String? countAdult,
  String? requestChildBed,
  String? type,
  String? id,
  String? idAccomodation,
  String? updatedAt,
  String? createdAt,
}) => Beds(  index: index ?? _index,
  countAdult: countAdult ?? _countAdult,
  requestChildBed: requestChildBed ?? _requestChildBed,
  type: type ?? _type,
  id: id ?? _id,
  idAccomodation: idAccomodation ?? _idAccomodation,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
);
  String? get index => _index;
  String? get countAdult => _countAdult;
  String? get requestChildBed => _requestChildBed;
  String? get type => _type;
  String? get id => _id;
  String? get idAccomodation => _idAccomodation;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Index'] = _index;
    map['CountAdult'] = _countAdult;
    map['RequestChildBed'] = _requestChildBed;
    map['Type'] = _type;
    map['id'] = _id;
    map['id_accomodation'] = _idAccomodation;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }

}

class Guest {
  Guest({
      String? index, 
      String? title, 
      String? firstName, 
      String? lastName, 
      String? mobilePhone, 
      String? email, 
      String? age, 
      String? type, 
      String? assignedRoom, 
      String? orderInRoom, 
      String? id, 
      String? idAccomodation, 
      String? updatedAt, 
      String? createdAt,}){
    _index = index;
    _title = title;
    _firstName = firstName;
    _lastName = lastName;
    _mobilePhone = mobilePhone;
    _email = email;
    _age = age;
    _type = type;
    _assignedRoom = assignedRoom;
    _orderInRoom = orderInRoom;
    _id = id;
    _idAccomodation = idAccomodation;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  Guest.fromJson(dynamic json) {
    _index = json['Index'];
    _title = json['Title'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _mobilePhone = json['MobilePhone'];
    _email = json['Email'];
    _age = json['Age'];
    _type = json['Type'];
    _assignedRoom = json['AssignedRoom'];
    _orderInRoom = json['OrderInRoom'];
    _id = json['id'];
    _idAccomodation = json['id_accomodation'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }
  String? _index;
  String? _title;
  String? _firstName;
  String? _lastName;
  String? _mobilePhone;
  String? _email;
  String? _age;
  String? _type;
  String? _assignedRoom;
  String? _orderInRoom;
  String? _id;
  String? _idAccomodation;
  String? _updatedAt;
  String? _createdAt;
Guest copyWith({  String? index,
  String? title,
  String? firstName,
  String? lastName,
  String? mobilePhone,
  String? email,
  String? age,
  String? type,
  String? assignedRoom,
  String? orderInRoom,
  String? id,
  String? idAccomodation,
  String? updatedAt,
  String? createdAt,
}) => Guest(  index: index ?? _index,
  title: title ?? _title,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  mobilePhone: mobilePhone ?? _mobilePhone,
  email: email ?? _email,
  age: age ?? _age,
  type: type ?? _type,
  assignedRoom: assignedRoom ?? _assignedRoom,
  orderInRoom: orderInRoom ?? _orderInRoom,
  id: id ?? _id,
  idAccomodation: idAccomodation ?? _idAccomodation,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
);
  String? get index => _index;
  String? get title => _title;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get mobilePhone => _mobilePhone;
  String? get email => _email;
  String? get age => _age;
  String? get type => _type;
  String? get assignedRoom => _assignedRoom;
  String? get orderInRoom => _orderInRoom;
  String? get id => _id;
  String? get idAccomodation => _idAccomodation;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Index'] = _index;
    map['Title'] = _title;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['MobilePhone'] = _mobilePhone;
    map['Email'] = _email;
    map['Age'] = _age;
    map['Type'] = _type;
    map['AssignedRoom'] = _assignedRoom;
    map['OrderInRoom'] = _orderInRoom;
    map['id'] = _id;
    map['id_accomodation'] = _idAccomodation;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }

}

class Header {
  Header({
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
      dynamic correlationId, 
      dynamic hotelKey, 
      dynamic roomKey, 
      String? createdAt, 
      int? createdBy, 
      String? codeStatusDoc, 
      String? id, 
      String? updatedAt,}){
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
    _correlationId = correlationId;
    _hotelKey = hotelKey;
    _roomKey = roomKey;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _codeStatusDoc = codeStatusDoc;
    _id = id;
    _updatedAt = updatedAt;
}

  Header.fromJson(dynamic json) {
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
    _correlationId = json['CorrelationId'];
    _hotelKey = json['HotelKey'];
    _roomKey = json['RoomKey'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _codeStatusDoc = json['code_status_doc'];
    _id = json['id'];
    _updatedAt = json['updated_at'];
  }
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
  dynamic _correlationId;
  dynamic _hotelKey;
  dynamic _roomKey;
  String? _createdAt;
  int? _createdBy;
  String? _codeStatusDoc;
  String? _id;
  String? _updatedAt;
Header copyWith({  String? idRequestTrip,
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
  dynamic correlationId,
  dynamic hotelKey,
  dynamic roomKey,
  String? createdAt,
  int? createdBy,
  String? codeStatusDoc,
  String? id,
  String? updatedAt,
}) => Header(  idRequestTrip: idRequestTrip ?? _idRequestTrip,
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
  correlationId: correlationId ?? _correlationId,
  hotelKey: hotelKey ?? _hotelKey,
  roomKey: roomKey ?? _roomKey,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  id: id ?? _id,
  updatedAt: updatedAt ?? _updatedAt,
);
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
  dynamic get correlationId => _correlationId;
  dynamic get hotelKey => _hotelKey;
  dynamic get roomKey => _roomKey;
  String? get createdAt => _createdAt;
  int? get createdBy => _createdBy;
  String? get codeStatusDoc => _codeStatusDoc;
  String? get id => _id;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    map['CorrelationId'] = _correlationId;
    map['HotelKey'] = _hotelKey;
    map['RoomKey'] = _roomKey;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['code_status_doc'] = _codeStatusDoc;
    map['id'] = _id;
    map['updated_at'] = _updatedAt;
    return map;
  }

}