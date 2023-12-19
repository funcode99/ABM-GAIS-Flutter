/// success : true
/// message : "Success Create Menu"
/// data : {"id_employee":"1","id_request_trip":"1","id_company":"1","company":"1","id_type_traveller":"1","nik":"1","contact_no":"1","departement":"1","hotel_fare":10000,"id_flight_class":"1","notes":"1","gender":"L","name_guest":null,"created_at":"2023-05-22T19:54:53.000000Z","created_by":2,"code_status_doc":"0","updated_at":"2023-05-22T19:54:53.000000Z","id":7}

class SaveTravellerGuestModel {
  SaveTravellerGuestModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveTravellerGuestModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveTravellerGuestModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveTravellerGuestModel(  success: success ?? _success,
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

/// id_employee : "1"
/// id_request_trip : "1"
/// id_company : "1"
/// company : "1"
/// id_type_traveller : "1"
/// nik : "1"
/// contact_no : "1"
/// departement : "1"
/// hotel_fare : 10000
/// id_flight_class : "1"
/// notes : "1"
/// gender : "L"
/// name_guest : null
/// created_at : "2023-05-22T19:54:53.000000Z"
/// created_by : 2
/// code_status_doc : "0"
/// updated_at : "2023-05-22T19:54:53.000000Z"
/// id : 7

class Data {
  Data({
      String? idEmployee, 
      String? idRequestTrip, 
      String? idCompany, 
      String? company, 
      String? idTypeTraveller, 
      String? nik, 
      String? contactNo, 
      String? departement, 
      num? hotelFare, 
      String? idFlightClass, 
      String? notes, 
      String? gender, 
      dynamic nameGuest, 
      String? createdAt, 
      num? createdBy, 
      String? codeStatusDoc, 
      String? updatedAt, 
      num? id,}){
    _idEmployee = idEmployee;
    _idRequestTrip = idRequestTrip;
    _idCompany = idCompany;
    _company = company;
    _idTypeTraveller = idTypeTraveller;
    _nik = nik;
    _contactNo = contactNo;
    _departement = departement;
    _hotelFare = hotelFare;
    _idFlightClass = idFlightClass;
    _notes = notes;
    _gender = gender;
    _nameGuest = nameGuest;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _codeStatusDoc = codeStatusDoc;
    _updatedAt = updatedAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _idEmployee = json['id_employee'];
    _idRequestTrip = json['id_request_trip'];
    _idCompany = json['id_company'];
    _company = json['company'];
    _idTypeTraveller = json['id_type_traveller'];
    _nik = json['nik'];
    _contactNo = json['contact_no'];
    _departement = json['departement'];
    _hotelFare = json['hotel_fare'];
    _idFlightClass = json['id_flight_class'];
    _notes = json['notes'];
    _gender = json['gender'];
    _nameGuest = json['name_guest'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _codeStatusDoc = json['code_status_doc'];
    _updatedAt = json['updated_at'];
    _id = json['id'];
  }
  String? _idEmployee;
  String? _idRequestTrip;
  String? _idCompany;
  String? _company;
  String? _idTypeTraveller;
  String? _nik;
  String? _contactNo;
  String? _departement;
  num? _hotelFare;
  String? _idFlightClass;
  String? _notes;
  String? _gender;
  dynamic _nameGuest;
  String? _createdAt;
  num? _createdBy;
  String? _codeStatusDoc;
  String? _updatedAt;
  dynamic _id;
Data copyWith({  String? idEmployee,
  String? idRequestTrip,
  String? idCompany,
  String? company,
  String? idTypeTraveller,
  String? nik,
  String? contactNo,
  String? departement,
  num? hotelFare,
  String? idFlightClass,
  String? notes,
  String? gender,
  dynamic nameGuest,
  String? createdAt,
  num? createdBy,
  String? codeStatusDoc,
  String? updatedAt,
  num? id,
}) => Data(  idEmployee: idEmployee ?? _idEmployee,
  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  idCompany: idCompany ?? _idCompany,
  company: company ?? _company,
  idTypeTraveller: idTypeTraveller ?? _idTypeTraveller,
  nik: nik ?? _nik,
  contactNo: contactNo ?? _contactNo,
  departement: departement ?? _departement,
  hotelFare: hotelFare ?? _hotelFare,
  idFlightClass: idFlightClass ?? _idFlightClass,
  notes: notes ?? _notes,
  gender: gender ?? _gender,
  nameGuest: nameGuest ?? _nameGuest,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  updatedAt: updatedAt ?? _updatedAt,
  id: id ?? _id,
);
  String? get idEmployee => _idEmployee;
  String? get idRequestTrip => _idRequestTrip;
  String? get idCompany => _idCompany;
  String? get company => _company;
  String? get idTypeTraveller => _idTypeTraveller;
  String? get nik => _nik;
  String? get contactNo => _contactNo;
  String? get departement => _departement;
  num? get hotelFare => _hotelFare;
  String? get idFlightClass => _idFlightClass;
  String? get notes => _notes;
  String? get gender => _gender;
  dynamic get nameGuest => _nameGuest;
  String? get createdAt => _createdAt;
  num? get createdBy => _createdBy;
  String? get codeStatusDoc => _codeStatusDoc;
  String? get updatedAt => _updatedAt;
  dynamic get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_employee'] = _idEmployee;
    map['id_request_trip'] = _idRequestTrip;
    map['id_company'] = _idCompany;
    map['company'] = _company;
    map['id_type_traveller'] = _idTypeTraveller;
    map['nik'] = _nik;
    map['contact_no'] = _contactNo;
    map['departement'] = _departement;
    map['hotel_fare'] = _hotelFare;
    map['id_flight_class'] = _idFlightClass;
    map['notes'] = _notes;
    map['gender'] = _gender;
    map['name_guest'] = _nameGuest;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['code_status_doc'] = _codeStatusDoc;
    map['updated_at'] = _updatedAt;
    map['id'] = _id;
    return map;
  }

}