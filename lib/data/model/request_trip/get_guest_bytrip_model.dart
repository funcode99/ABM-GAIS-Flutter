/// success : true
/// message : "Success Get Data"
/// data : [{"id":6,"id_employee":1,"name_guest":null,"id_request_trip":1,"id_company":1,"company":"1","code_status_doc":0,"id_type_traveller":1,"nik":"1","gender":"L","contact_no":"1","departement":"1","hotel_fare":"10000","id_flight_class":1,"notes":"1","created_at":"2023-05-22 18:48:45","created_by":"2","updated_at":"2023-05-22 18:48:45","updated_by":null,"no_request_trip":"REQ/ABM/123","type_traveller":"Interrviewee","employee_name":"Jhon Doe","company_name":"PT. Testing","flight_class":null},{"id":5,"id_employee":1,"name_guest":null,"id_request_trip":4,"id_company":1,"company":null,"code_status_doc":0,"id_type_traveller":1,"nik":"123","gender":"L","contact_no":"08123","departement":"1","hotel_fare":"700000","id_flight_class":1,"notes":null,"created_at":"2023-05-21 06:44:53","created_by":"2","updated_at":"2023-05-21 06:44:53","updated_by":null,"no_request_trip":"REQ/ABM/123","type_traveller":"Interrviewee","employee_name":"Jhon Doe","company_name":"PT. Testing","flight_class":null},{"id":1,"id_employee":1,"name_guest":null,"id_request_trip":3,"id_company":1,"company":"1","code_status_doc":0,"id_type_traveller":1,"nik":"123","gender":"P","contact_no":"08123","departement":"1","hotel_fare":"700000","id_flight_class":1,"notes":"notes","created_at":"2023-05-19 07:55:01","created_by":"2","updated_at":"2023-05-19 08:02:06","updated_by":"2","no_request_trip":"REQ/ABM/123","type_traveller":"Interrviewee","employee_name":"Jhon Doe","company_name":"PT. Testing","flight_class":null},{"id":4,"id_employee":1,"name_guest":null,"id_request_trip":3,"id_company":1,"company":null,"code_status_doc":0,"id_type_traveller":1,"nik":"123","gender":"L","contact_no":"08123","departement":"1","hotel_fare":"700000","id_flight_class":1,"notes":null,"created_at":"2023-05-21 05:49:58","created_by":"2","updated_at":"2023-05-21 05:49:58","updated_by":null,"no_request_trip":"REQ/ABM/123","type_traveller":"Interrviewee","employee_name":"Jhon Doe","company_name":"PT. Testing","flight_class":null},{"id":2,"id_employee":1,"name_guest":null,"id_request_trip":2,"id_company":1,"company":"1","code_status_doc":0,"id_type_traveller":1,"nik":"123","gender":"P","contact_no":"08123","departement":"1","hotel_fare":"700000","id_flight_class":1,"notes":null,"created_at":"2023-05-20 10:17:39","created_by":"2","updated_at":"2023-05-20 10:18:03","updated_by":"2","no_request_trip":"REQ/ABM/123","type_traveller":"Interrviewee","employee_name":"Jhon Doe","company_name":"PT. Testing","flight_class":null},{"id":3,"id_employee":2,"name_guest":null,"id_request_trip":2,"id_company":1,"company":null,"code_status_doc":0,"id_type_traveller":1,"nik":"234","gender":"P","contact_no":"08234","departement":"1","hotel_fare":"700000","id_flight_class":1,"notes":null,"created_at":"2023-05-20 11:35:12","created_by":"2","updated_at":"2023-05-20 11:35:12","updated_by":null,"no_request_trip":"REQ/ABM/123","type_traveller":"Interrviewee","employee_name":null,"company_name":"PT. Testing","flight_class":null}]

class GetGuestBytripModel {
  GetGuestBytripModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
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
GetGuestBytripModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetGuestBytripModel(  success: success ?? _success,
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

/// id : 6
/// id_employee : 1
/// name_guest : null
/// id_request_trip : 1
/// id_company : 1
/// company : "1"
/// code_status_doc : 0
/// id_type_traveller : 1
/// nik : "1"
/// gender : "L"
/// contact_no : "1"
/// departement : "1"
/// hotel_fare : "10000"
/// id_flight_class : 1
/// notes : "1"
/// created_at : "2023-05-22 18:48:45"
/// created_by : "2"
/// updated_at : "2023-05-22 18:48:45"
/// updated_by : null
/// no_request_trip : "REQ/ABM/123"
/// type_traveller : "Interrviewee"
/// employee_name : "Jhon Doe"
/// company_name : "PT. Testing"
/// flight_class : null

class Data {
  Data({
      num? id, 
      num? idEmployee, 
      dynamic nameGuest, 
      num? idRequestTrip, 
      num? idCompany, 
      String? company, 
      num? codeStatusDoc, 
      num? idTypeTraveller, 
      String? nik, 
      String? gender, 
      String? contactNo, 
      String? departement, 
      String? hotelFare, 
      num? idFlightClass, 
      String? notes, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      String? noRequestTrip, 
      String? typeTraveller, 
      String? employeeName, 
      String? companyName, 
      dynamic flightClass,}){
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
    _noRequestTrip = noRequestTrip;
    _typeTraveller = typeTraveller;
    _employeeName = employeeName;
    _companyName = companyName;
    _flightClass = flightClass;
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
    _noRequestTrip = json['no_request_trip'];
    _typeTraveller = json['type_traveller'];
    _employeeName = json['employee_name'];
    _companyName = json['company_name'];
    _flightClass = json['flight_class'];
  }
  num? _id;
  num? _idEmployee;
  dynamic _nameGuest;
  num? _idRequestTrip;
  num? _idCompany;
  String? _company;
  num? _codeStatusDoc;
  num? _idTypeTraveller;
  String? _nik;
  String? _gender;
  String? _contactNo;
  String? _departement;
  String? _hotelFare;
  num? _idFlightClass;
  String? _notes;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  String? _noRequestTrip;
  String? _typeTraveller;
  String? _employeeName;
  String? _companyName;
  dynamic _flightClass;
Data copyWith({  num? id,
  num? idEmployee,
  dynamic nameGuest,
  num? idRequestTrip,
  num? idCompany,
  String? company,
  num? codeStatusDoc,
  num? idTypeTraveller,
  String? nik,
  String? gender,
  String? contactNo,
  String? departement,
  String? hotelFare,
  num? idFlightClass,
  String? notes,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
  String? noRequestTrip,
  String? typeTraveller,
  String? employeeName,
  String? companyName,
  dynamic flightClass,
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
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
  typeTraveller: typeTraveller ?? _typeTraveller,
  employeeName: employeeName ?? _employeeName,
  companyName: companyName ?? _companyName,
  flightClass: flightClass ?? _flightClass,
);
  num? get id => _id;
  num? get idEmployee => _idEmployee;
  dynamic get nameGuest => _nameGuest;
  num? get idRequestTrip => _idRequestTrip;
  num? get idCompany => _idCompany;
  String? get company => _company;
  num? get codeStatusDoc => _codeStatusDoc;
  num? get idTypeTraveller => _idTypeTraveller;
  String? get nik => _nik;
  String? get gender => _gender;
  String? get contactNo => _contactNo;
  String? get departement => _departement;
  String? get hotelFare => _hotelFare;
  num? get idFlightClass => _idFlightClass;
  String? get notes => _notes;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  String? get noRequestTrip => _noRequestTrip;
  String? get typeTraveller => _typeTraveller;
  String? get employeeName => _employeeName;
  String? get companyName => _companyName;
  dynamic get flightClass => _flightClass;

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
    map['no_request_trip'] = _noRequestTrip;
    map['type_traveller'] = _typeTraveller;
    map['employee_name'] = _employeeName;
    map['company_name'] = _companyName;
    map['flight_class'] = _flightClass;
    return map;
  }

}