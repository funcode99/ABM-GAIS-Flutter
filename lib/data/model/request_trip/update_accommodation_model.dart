class UpdateAccommodationModel {
  UpdateAccommodationModel({
    bool? success,
    String? message,
    Data? data,
  }) {
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

  UpdateAccommodationModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      UpdateAccommodationModel(
        success: success ?? _success,
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
    ContactGuest? contact,
    List<GuestModel>? guest,
    List<BedsModel>? beds,
  }) {
    _header = header;
    _contact = contact;
    _guest = guest;
    _beds = beds;
  }

  Data.fromJson(dynamic json) {
    _header = json['header'] != null ? Header.fromJson(json['header']) : null;
    _contact = json['Contact'] != null ? ContactGuest.fromJson(json['Contact']) : null;
    if (json['Guest'] != null) {
      _guest = [];
      json['Guest'].forEach((v) {
        _guest?.add(GuestModel.fromJson(v));
      });
    }
    if (json['Beds'] != null) {
      _beds = [];
      json['Beds'].forEach((v) {
        _beds?.add(BedsModel.fromJson(v));
      });
    }
  }

  Header? _header;
  ContactGuest? _contact;
  List<GuestModel>? _guest;
  List<BedsModel>? _beds;

  Data copyWith({
    Header? header,
    ContactGuest? contact,
    List<GuestModel>? guest,
    List<BedsModel>? beds,
  }) =>
      Data(
        header: header ?? _header,
        contact: contact ?? _contact,
        guest: guest ?? _guest,
        beds: beds ?? _beds,
      );

  Header? get header => _header;

  ContactGuest? get contact => _contact;

  List<GuestModel>? get guest => _guest;

  List<BedsModel>? get beds => _beds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_header != null) {
      map['header'] = _header?.toJson();
    }
    if (_contact != null) {
      map['Contact'] = _contact?.toJson();
    }
    if (_guest != null) {
      map['Guest'] = _guest?.map((v) => v.toJson()).toList();
    }
    if (_beds != null) {
      map['Beds'] = _beds?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class BedsModel {
  BedsModel({
    String? index,
    String? countAdult,
    String? requestChildBed,
    String? type,
    String? id,
    String? idAccomodation,
    String? updatedAt,
    String? createdAt,
  }) {
    _index = index;
    _countAdult = countAdult;
    _requestChildBed = requestChildBed;
    _type = type;
    _id = id;
    _idAccomodation = idAccomodation;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
  }

  BedsModel.fromJson(dynamic json) {
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

  BedsModel copyWith({
    String? index,
    String? countAdult,
    String? requestChildBed,
    String? type,
    String? id,
    String? idAccomodation,
    String? updatedAt,
    String? createdAt,
  }) =>
      BedsModel(
        index: index ?? _index,
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

class GuestModel {
  GuestModel({
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
    String? createdAt,
  }) {
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

  GuestModel.fromJson(dynamic json) {
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

  GuestModel copyWith({
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
    String? createdAt,
  }) =>
      GuestModel(
        index: index ?? _index,
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

class ContactGuest {
  ContactGuest({
    String? title,
    String? firstName,
    String? lastName,
    String? mobilePhone,
    String? email,
    String? remark,
    String? id,
    String? idAccomodation,
    String? updatedAt,
    String? createdAt,
  }) {
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

  ContactGuest.fromJson(dynamic json) {
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

  ContactGuest copyWith({
    String? title,
    String? firstName,
    String? lastName,
    String? mobilePhone,
    String? email,
    String? remark,
    String? id,
    String? idAccomodation,
    String? updatedAt,
    String? createdAt,
  }) =>
      ContactGuest(
        title: title ?? _title,
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

class Header {
  Header({
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
    String? hotelFare,
    String? correlationId,
    String? hotelKey,
    String? roomKey,
    dynamic confirmationId,
    dynamic hotelName,
    dynamic address,
    dynamic roomName,
    dynamic countGuest,
    dynamic totalPrice,
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
    _correlationId = correlationId;
    _hotelKey = hotelKey;
    _roomKey = roomKey;
    _confirmationId = confirmationId;
    _hotelName = hotelName;
    _address = address;
    _roomName = roomName;
    _countGuest = countGuest;
    _totalPrice = totalPrice;
  }

  Header.fromJson(dynamic json) {
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
    _correlationId = json['CorrelationId'];
    _hotelKey = json['HotelKey'];
    _roomKey = json['RoomKey'];
    _confirmationId = json['ConfirmationId'];
    _hotelName = json['HotelName'];
    _address = json['Address'];
    _roomName = json['RoomName'];
    _countGuest = json['CountGuest'];
    _totalPrice = json['TotalPrice'];
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
  String? _correlationId;
  String? _hotelKey;
  String? _roomKey;
  dynamic _confirmationId;
  dynamic _hotelName;
  dynamic _address;
  dynamic _roomName;
  dynamic _countGuest;
  dynamic _totalPrice;

  Header copyWith({
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
    String? hotelFare,
    String? correlationId,
    String? hotelKey,
    String? roomKey,
    dynamic confirmationId,
    dynamic hotelName,
    dynamic address,
    dynamic roomName,
    dynamic countGuest,
    dynamic totalPrice,
  }) =>
      Header(
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
        correlationId: correlationId ?? _correlationId,
        hotelKey: hotelKey ?? _hotelKey,
        roomKey: roomKey ?? _roomKey,
        confirmationId: confirmationId ?? _confirmationId,
        hotelName: hotelName ?? _hotelName,
        address: address ?? _address,
        roomName: roomName ?? _roomName,
        countGuest: countGuest ?? _countGuest,
        totalPrice: totalPrice ?? _totalPrice,
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

  String? get correlationId => _correlationId;

  String? get hotelKey => _hotelKey;

  String? get roomKey => _roomKey;

  dynamic get confirmationId => _confirmationId;

  dynamic get hotelName => _hotelName;

  dynamic get address => _address;

  dynamic get roomName => _roomName;

  dynamic get countGuest => _countGuest;

  dynamic get totalPrice => _totalPrice;

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
    map['CorrelationId'] = _correlationId;
    map['HotelKey'] = _hotelKey;
    map['RoomKey'] = _roomKey;
    map['ConfirmationId'] = _confirmationId;
    map['HotelName'] = _hotelName;
    map['Address'] = _address;
    map['RoomName'] = _roomName;
    map['CountGuest'] = _countGuest;
    map['TotalPrice'] = _totalPrice;
    return map;
  }
}
