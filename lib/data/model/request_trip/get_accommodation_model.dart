/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"id_request_trip":2,"id_type_accomodation":1,"check_in_date":"2023-01-01","check_out_date":"2023-02-02","id_vendor":1,"use_gl":1,"id_city":1,"sharing_w_name":"1","remarks":"1","price":"1000000","code_hotel":"1","code_status_doc":0,"created_at":"2023-05-19 05:44:19","created_by":"2","updated_at":"2023-05-19 05:44:19","updated_by":null,"no_request_trip":"REQ/ABM/123","type_accomodation":"Hotel","city_name":"Surabaya","vendor":"Antavaya"}]

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

/// id : 1
/// id_request_trip : 2
/// id_type_accomodation : 1
/// check_in_date : "2023-01-01"
/// check_out_date : "2023-02-02"
/// id_vendor : 1
/// use_gl : 1
/// id_city : 1
/// sharing_w_name : "1"
/// remarks : "1"
/// price : "1000000"
/// code_hotel : "1"
/// code_status_doc : 0
/// created_at : "2023-05-19 05:44:19"
/// created_by : "2"
/// updated_at : "2023-05-19 05:44:19"
/// updated_by : null
/// no_request_trip : "REQ/ABM/123"
/// type_accomodation : "Hotel"
/// city_name : "Surabaya"
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
      String? sharingWName, 
      String? remarks, 
      String? price, 
      String? codeHotel, 
      num? codeStatusDoc, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      dynamic updatedBy, 
      String? noRequestTrip, 
      String? typeAccomodation, 
      String? cityName, 
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
    _cityName = cityName;
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
    _cityName = json['city_name'];
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
  String? _sharingWName;
  String? _remarks;
  String? _price;
  String? _codeHotel;
  num? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
  String? _noRequestTrip;
  String? _typeAccomodation;
  String? _cityName;
  String? _vendor;
Data copyWith({  num? id,
  num? idRequestTrip,
  num? idTypeAccomodation,
  String? checkInDate,
  String? checkOutDate,
  num? idVendor,
  num? useGl,
  num? idCity,
  String? sharingWName,
  String? remarks,
  String? price,
  String? codeHotel,
  num? codeStatusDoc,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  dynamic updatedBy,
  String? noRequestTrip,
  String? typeAccomodation,
  String? cityName,
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
  cityName: cityName ?? _cityName,
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
  String? get sharingWName => _sharingWName;
  String? get remarks => _remarks;
  String? get price => _price;
  String? get codeHotel => _codeHotel;
  num? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  String? get noRequestTrip => _noRequestTrip;
  String? get typeAccomodation => _typeAccomodation;
  String? get cityName => _cityName;
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
    map['city_name'] = _cityName;
    map['vendor'] = _vendor;
    return map;
  }

}