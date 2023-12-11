class GetGuestBytripModel {
  GetGuestBytripModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetGuestBytripModel.fromJson(dynamic json) {
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

  GetGuestBytripModel copyWith({
    bool? success,
    String? message,
    List<Data>? data,
  }) =>
      GetGuestBytripModel(
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
    dynamic idEmployee,
    String? nameGuest,
    String? idRequestTrip,
    dynamic idCompany,
    String? company,
    int? codeStatusDoc,
    int? idTypeTraveller,
    String? nik,
    String? gender,
    String? contactNo,
    String? departement,
    String? hotelFare,
    int? idFlightClass,
    dynamic notes,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    dynamic updatedBy,
    String? typeTraveller,
    String? flightClass,
    String? birthDate,
    String? email,
    String? firstName,
    String? lastName,
    String? snEmployee,
    String? title,
    String? genderCode,
    num? isGuest,
  }) {
    _id = id;
    _idEmployee = idEmployee;
    _nameGuest = nameGuest;
    _idRequestTrip = idRequestTrip;
    _idCompany = idCompany;
    _company = company;
    _codeStatusDoc = codeStatusDoc;
    _idTypeTraveller = idTypeTraveller;
    _nik = nik;
    _gender = gender;
    _contactNo = contactNo;
    _departement = departement;
    _hotelFare = hotelFare;
    _idFlightClass = idFlightClass;
    _notes = notes;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _typeTraveller = typeTraveller;
    _flightClass = flightClass;
    _birthDate = birthDate;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _snEmployee = snEmployee;
    _title = title;
    _genderCode = genderCode;
    _isGuest = isGuest;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idEmployee = json['id_employee'];
    _nameGuest = json['name_guest'];
    _idRequestTrip = json['id_request_trip'];
    _idCompany = json['id_company'];
    _company = json['company'];
    _codeStatusDoc = json['code_status_doc'];
    _idTypeTraveller = json['id_type_traveller'];
    _nik = json['nik'];
    _gender = json['gender'];
    _contactNo = json['contact_no'];
    _departement = json['departement'];
    _hotelFare = json['hotel_fare'];
    _idFlightClass = json['id_flight_class'];
    _notes = json['notes'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _typeTraveller = json['type_traveller'];
    _flightClass = json['flight_class'];
    _birthDate = json['birth_date'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _snEmployee = json['sn_employee'];
    _title = json['title'];
    _genderCode = json['gender_code'];
    _isGuest = json['is_guest'];
  }

  String? _id;
  dynamic _idEmployee;
  String? _nameGuest;
  String? _idRequestTrip;
  dynamic _idCompany;
  String? _company;
  int? _codeStatusDoc;
  int? _idTypeTraveller;
  String? _nik;
  String? _gender;
  String? _contactNo;
  String? _departement;
  String? _hotelFare;
  int? _idFlightClass;
  dynamic _notes;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  String? _typeTraveller;
  String? _flightClass;
  String? _birthDate;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _snEmployee;
  String? _title;
  String? _genderCode;
  num? _isGuest;

  Data copyWith({
    String? id,
    dynamic idEmployee,
    String? nameGuest,
    String? idRequestTrip,
    dynamic idCompany,
    String? company,
    int? codeStatusDoc,
    int? idTypeTraveller,
    String? nik,
    String? gender,
    String? contactNo,
    String? departement,
    String? hotelFare,
    int? idFlightClass,
    dynamic notes,
    String? createdAt,
    String? createdBy,
    String? updatedAt,
    dynamic updatedBy,
    String? typeTraveller,
    String? flightClass,
    String? birthDate,
    String? email,
    String? firstName,
    String? lastName,
    String? snEmployee,
    String? title,
    String? genderCode,
    num? isGuest,
  }) =>
      Data(
        id: id ?? _id,
        idEmployee: idEmployee ?? _idEmployee,
        nameGuest: nameGuest ?? _nameGuest,
        idRequestTrip: idRequestTrip ?? _idRequestTrip,
        idCompany: idCompany ?? _idCompany,
        company: company ?? _company,
        codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
        idTypeTraveller: idTypeTraveller ?? _idTypeTraveller,
        nik: nik ?? _nik,
        gender: gender ?? _gender,
        contactNo: contactNo ?? _contactNo,
        departement: departement ?? _departement,
        hotelFare: hotelFare ?? _hotelFare,
        idFlightClass: idFlightClass ?? _idFlightClass,
        notes: notes ?? _notes,
        createdAt: createdAt ?? _createdAt,
        createdBy: createdBy ?? _createdBy,
        updatedAt: updatedAt ?? _updatedAt,
        updatedBy: updatedBy ?? _updatedBy,
        typeTraveller: typeTraveller ?? _typeTraveller,
        flightClass: flightClass ?? _flightClass,
        birthDate: birthDate ?? _birthDate,
        email: email ?? _email,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        snEmployee: snEmployee ?? _snEmployee,
        title: title ?? _title,
        genderCode: genderCode ?? _genderCode,
        isGuest: isGuest ?? _isGuest,
      );

  String? get id => _id;

  dynamic get idEmployee => _idEmployee;

  String? get nameGuest => _nameGuest;

  String? get idRequestTrip => _idRequestTrip;

  dynamic get idCompany => _idCompany;

  String? get company => _company;

  int? get codeStatusDoc => _codeStatusDoc;

  int? get idTypeTraveller => _idTypeTraveller;

  String? get nik => _nik;

  String? get gender => _gender;

  String? get contactNo => _contactNo;

  String? get departement => _departement;

  String? get hotelFare => _hotelFare;

  int? get idFlightClass => _idFlightClass;

  dynamic get notes => _notes;

  String? get createdAt => _createdAt;

  String? get createdBy => _createdBy;

  String? get updatedAt => _updatedAt;

  dynamic get updatedBy => _updatedBy;

  String? get typeTraveller => _typeTraveller;

  String? get flightClass => _flightClass;

  String? get birthDate => _birthDate;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get snEmployee => _snEmployee;
  String? get title => _title;
  String? get genderCode => _genderCode;

  num? get isGuest => _isGuest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_employee'] = _idEmployee;
    map['name_guest'] = _nameGuest;
    map['id_request_trip'] = _idRequestTrip;
    map['id_company'] = _idCompany;
    map['company'] = _company;
    map['code_status_doc'] = _codeStatusDoc;
    map['id_type_traveller'] = _idTypeTraveller;
    map['nik'] = _nik;
    map['gender'] = _gender;
    map['contact_no'] = _contactNo;
    map['departement'] = _departement;
    map['hotel_fare'] = _hotelFare;
    map['id_flight_class'] = _idFlightClass;
    map['notes'] = _notes;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['type_traveller'] = _typeTraveller;
    map['flight_class'] = _flightClass;
    map['birth_date'] = _birthDate;
    map['email'] = _email;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['sn_employee'] = _snEmployee;
    map['title'] = _title;
    map['gender_code'] = _genderCode;
    map['is_guest'] = _isGuest;
    return map;
  }
}
