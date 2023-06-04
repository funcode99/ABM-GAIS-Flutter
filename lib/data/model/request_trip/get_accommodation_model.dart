/// success : true
/// message : "Success Get Data"
/// data : [{"id":7,"id_request_trip":25,"id_type_accomodation":2,"check_in_date":"2023-05-24","check_out_date":"2023-05-24","id_vendor":1,"use_gl":0,"id_city":3,"sharing_w_name":null,"remarks":null,"price":"899990","code_hotel":"1","code_status_doc":0,"created_at":"2023-05-24 03:52:46","created_by":"2","updated_at":"2023-05-24 03:52:46","updated_by":null,"no_request_trip":"REQ/ABM/123","type_accomodation":"Camp","code":0,"status":"Draft","city_name":"Jakarta","hotel_name":"JW Marriot","address":"Surabaya","employee_name":"Jhon Doe","vendor":"Antavaya"},{"id":5,"id_request_trip":12,"id_type_accomodation":1,"check_in_date":"2023-05-23","check_out_date":"2023-05-24","id_vendor":1,"use_gl":1,"id_city":1,"sharing_w_name":null,"remarks":null,"price":"899990","code_hotel":"1","code_status_doc":0,"created_at":"2023-05-22 18:43:27","created_by":"2","updated_at":"2023-05-22 18:43:27","updated_by":null,"no_request_trip":"REQ/ABM/123","type_accomodation":"Hotel","code":0,"status":"Draft","city_name":"Bandung","hotel_name":"JW Marriot","address":"Surabaya","employee_name":"Jhon Doe","vendor":"Antavaya"},{"id":6,"id_request_trip":15,"id_type_accomodation":1,"check_in_date":"2023-05-23","check_out_date":"2023-05-25","id_vendor":1,"use_gl":0,"id_city":1,"sharing_w_name":null,"remarks":null,"price":"899990","code_hotel":"1","code_status_doc":1,"created_at":"2023-05-22 21:26:14","created_by":"2","updated_at":"2023-05-22 21:26:14","updated_by":null,"no_request_trip":"REQ/ABM/123","type_accomodation":"Hotel","code":1,"status":"Submit","city_name":"Bandung","hotel_name":"JW Marriot","address":"Surabaya","employee_name":"Jhon Doe","vendor":"Antavaya"}]

class GetAccommodationModel {
  GetAccommodationModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
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
GetAccommodationModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetAccommodationModel(  success: success ?? _success,
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

/// id : 7
/// id_request_trip : 25
/// id_type_accomodation : 2
/// check_in_date : "2023-05-24"
/// check_out_date : "2023-05-24"
/// id_vendor : 1
/// use_gl : 0
/// id_city : 3
/// sharing_w_name : null
/// remarks : null
/// price : "899990"
/// code_hotel : "1"
/// code_status_doc : 0
/// created_at : "2023-05-24 03:52:46"
/// created_by : "2"
/// updated_at : "2023-05-24 03:52:46"
/// updated_by : null
/// no_request_trip : "REQ/ABM/123"
/// type_accomodation : "Camp"
/// code : 0
/// status : "Draft"
/// city_name : "Jakarta"
/// hotel_name : "JW Marriot"
/// address : "Surabaya"
/// employee_name : "Jhon Doe"
/// vendor : "Antavaya"

class Data {
  Data({
      num? id, 
      num? idRequestTrip, 
      num? idTypeAccomodation, 
      String? checkInDate, 
      String? checkOutDate, 
      num? idVendor, 
      num? useGl, 
      num? idCity, 
      dynamic sharingWName, 
      dynamic remarks, 
      String? price, 
      String? codeHotel, 
      num? codeStatusDoc, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      String? noRequestTrip, 
      String? typeAccomodation, 
      num? code, 
      String? status, 
      String? cityName, 
      String? hotelName, 
      String? address, 
      String? employeeName, 
      String? vendor,}){
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
  num? _id;
  num? _idRequestTrip;
  num? _idTypeAccomodation;
  String? _checkInDate;
  String? _checkOutDate;
  num? _idVendor;
  num? _useGl;
  num? _idCity;
  dynamic _sharingWName;
  dynamic _remarks;
  String? _price;
  String? _codeHotel;
  num? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  String? _noRequestTrip;
  String? _typeAccomodation;
  num? _code;
  String? _status;
  String? _cityName;
  String? _hotelName;
  String? _address;
  String? _employeeName;
  String? _vendor;
Data copyWith({  num? id,
  num? idRequestTrip,
  num? idTypeAccomodation,
  String? checkInDate,
  String? checkOutDate,
  num? idVendor,
  num? useGl,
  num? idCity,
  dynamic sharingWName,
  dynamic remarks,
  String? price,
  String? codeHotel,
  num? codeStatusDoc,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
  String? noRequestTrip,
  String? typeAccomodation,
  num? code,
  String? status,
  String? cityName,
  String? hotelName,
  String? address,
  String? employeeName,
  String? vendor,
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
  num? get id => _id;
  num? get idRequestTrip => _idRequestTrip;
  num? get idTypeAccomodation => _idTypeAccomodation;
  String? get checkInDate => _checkInDate;
  String? get checkOutDate => _checkOutDate;
  num? get idVendor => _idVendor;
  num? get useGl => _useGl;
  num? get idCity => _idCity;
  dynamic get sharingWName => _sharingWName;
  dynamic get remarks => _remarks;
  String? get price => _price;
  String? get codeHotel => _codeHotel;
  num? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  String? get noRequestTrip => _noRequestTrip;
  String? get typeAccomodation => _typeAccomodation;
  num? get code => _code;
  String? get status => _status;
  String? get cityName => _cityName;
  String? get hotelName => _hotelName;
  String? get address => _address;
  String? get employeeName => _employeeName;
  String? get vendor => _vendor;

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