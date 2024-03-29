/// success : true
/// message : "Success Get Data"
/// data : {"id":1,"id_request_trip":2,"id_type_accomodation":1,"check_in_date":"2023-01-01","check_out_date":"2023-02-02","id_vendor":1,"use_gl":1,"id_city":1,"sharing_w_name":"1","remarks":"1","price":"1000000","code_hotel":"1","code_status_doc":0,"created_at":"2023-05-16T00:53:50.000000Z","created_by":"1","updated_at":"2023-05-16T00:53:50.000000Z","updated_by":null}

class GetAccommodationByidModel {
  GetAccommodationByidModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetAccommodationByidModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
GetAccommodationByidModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => GetAccommodationByidModel(  success: success ?? _success,
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
/// created_at : "2023-05-16T00:53:50.000000Z"
/// created_by : "1"
/// updated_at : "2023-05-16T00:53:50.000000Z"
/// updated_by : null

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
      dynamic updatedBy,}){
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
  }
  dynamic _id;
  dynamic _idRequestTrip;
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
);
  dynamic get id => _id;
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
    return map;
  }

}