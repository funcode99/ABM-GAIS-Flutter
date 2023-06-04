/// success : true
/// message : "Success Update Data"
/// data : {"id":21,"id_employee":null,"name_guest":"charlie","id_request_trip":"1","id_company":"1","company":"1","code_status_doc":0,"id_type_traveller":"1","nik":"1","gender":"L","contact_no":"1","departement":"1","hotel_fare":700000,"id_flight_class":"1","notes":"1","created_at":"2023-05-29T21:38:54.000000Z","created_by":"2","updated_at":"2023-05-29T21:46:38.000000Z","updated_by":2}

class UpdateTravellerGuestModel {
  UpdateTravellerGuestModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdateTravellerGuestModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UpdateTravellerGuestModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UpdateTravellerGuestModel(  success: success ?? _success,
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

/// id : 21
/// id_employee : null
/// name_guest : "charlie"
/// id_request_trip : "1"
/// id_company : "1"
/// company : "1"
/// code_status_doc : 0
/// id_type_traveller : "1"
/// nik : "1"
/// gender : "L"
/// contact_no : "1"
/// departement : "1"
/// hotel_fare : 700000
/// id_flight_class : "1"
/// notes : "1"
/// created_at : "2023-05-29T21:38:54.000000Z"
/// created_by : "2"
/// updated_at : "2023-05-29T21:46:38.000000Z"
/// updated_by : 2

class Data {
  Data({
      num? id, 
      dynamic idEmployee, 
      String? nameGuest, 
      String? idRequestTrip, 
      String? idCompany, 
      String? company, 
      num? codeStatusDoc, 
      String? idTypeTraveller, 
      String? nik, 
      String? gender, 
      String? contactNo, 
      String? departement, 
      num? hotelFare, 
      String? idFlightClass, 
      String? notes, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      num? updatedBy,}){
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
  }
  num? _id;
  dynamic _idEmployee;
  String? _nameGuest;
  String? _idRequestTrip;
  String? _idCompany;
  String? _company;
  num? _codeStatusDoc;
  String? _idTypeTraveller;
  String? _nik;
  String? _gender;
  String? _contactNo;
  String? _departement;
  num? _hotelFare;
  String? _idFlightClass;
  String? _notes;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  num? _updatedBy;
Data copyWith({  num? id,
  dynamic idEmployee,
  String? nameGuest,
  String? idRequestTrip,
  String? idCompany,
  String? company,
  num? codeStatusDoc,
  String? idTypeTraveller,
  String? nik,
  String? gender,
  String? contactNo,
  String? departement,
  num? hotelFare,
  String? idFlightClass,
  String? notes,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  num? updatedBy,
}) => Data(  id: id ?? _id,
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
);
  num? get id => _id;
  dynamic get idEmployee => _idEmployee;
  String? get nameGuest => _nameGuest;
  String? get idRequestTrip => _idRequestTrip;
  String? get idCompany => _idCompany;
  String? get company => _company;
  num? get codeStatusDoc => _codeStatusDoc;
  String? get idTypeTraveller => _idTypeTraveller;
  String? get nik => _nik;
  String? get gender => _gender;
  String? get contactNo => _contactNo;
  String? get departement => _departement;
  num? get hotelFare => _hotelFare;
  String? get idFlightClass => _idFlightClass;
  String? get notes => _notes;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  num? get updatedBy => _updatedBy;

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
    return map;
  }

}