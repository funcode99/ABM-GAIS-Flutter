/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"hotel_name":"JW Marriot Hotel","address":"Jl. Embong Malang. Surabaya","id_type_hotel":1,"id_city":1,"email":"jw@marriot.com","phone_number":"0812345671","rating":4,"created_at":null,"created_by":null,"updated_at":null,"updated_by":null,"city_name":"Surabaya","city_code":"SBY","type_accomodation":"Hotel"},{"id":2,"hotel_name":"sad","address":"asd","id_type_hotel":2,"id_city":2,"email":"asda@gmail.com","phone_number":"123123312","rating":null,"created_at":"2023-05-19 07:50:13","created_by":"1","updated_at":"2023-05-19 07:50:13","updated_by":null,"city_name":"Jakarta","city_code":"JKT","type_accomodation":"Camp"}]

class GetHotelModel {
  GetHotelModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetHotelModel.fromJson(dynamic json) {
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
GetHotelModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetHotelModel(  success: success ?? _success,
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
/// hotel_name : "JW Marriot Hotel"
/// address : "Jl. Embong Malang. Surabaya"
/// id_type_hotel : 1
/// id_city : 1
/// email : "jw@marriot.com"
/// phone_number : "0812345671"
/// rating : 4
/// created_at : null
/// created_by : null
/// updated_at : null
/// updated_by : null
/// city_name : "Surabaya"
/// city_code : "SBY"
/// type_accomodation : "Hotel"

class Data {
  Data({
      num? id, 
      String? hotelName, 
      String? address, 
      num? idTypeHotel, 
      num? idCity, 
      String? email, 
      String? phoneNumber, 
      num? rating, 
      dynamic createdAt, 
      dynamic createdBy, 
      dynamic updatedAt, 
      dynamic updatedBy, 
      String? cityName, 
      String? cityCode, 
      String? typeAccomodation,}){
    _id = id;
    _hotelName = hotelName;
    _address = address;
    _idTypeHotel = idTypeHotel;
    _idCity = idCity;
    _email = email;
    _phoneNumber = phoneNumber;
    _rating = rating;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _cityName = cityName;
    _cityCode = cityCode;
    _typeAccomodation = typeAccomodation;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _hotelName = json['hotel_name'];
    _address = json['address'];
    _idTypeHotel = json['id_type_hotel'];
    _idCity = json['id_city'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
    _rating = json['rating'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _cityName = json['city_name'];
    _cityCode = json['city_code'];
    _typeAccomodation = json['type_accomodation'];
  }
  dynamic _id;
  String? _hotelName;
  String? _address;
  num? _idTypeHotel;
  num? _idCity;
  String? _email;
  String? _phoneNumber;
  num? _rating;
  dynamic _createdAt;
  dynamic _createdBy;
  dynamic _updatedAt;
  dynamic _updatedBy;
  String? _cityName;
  String? _cityCode;
  String? _typeAccomodation;
Data copyWith({  num? id,
  String? hotelName,
  String? address,
  num? idTypeHotel,
  num? idCity,
  String? email,
  String? phoneNumber,
  num? rating,
  dynamic createdAt,
  dynamic createdBy,
  dynamic updatedAt,
  dynamic updatedBy,
  String? cityName,
  String? cityCode,
  String? typeAccomodation,
}) => Data(  id: id ?? _id,
  hotelName: hotelName ?? _hotelName,
  address: address ?? _address,
  idTypeHotel: idTypeHotel ?? _idTypeHotel,
  idCity: idCity ?? _idCity,
  email: email ?? _email,
  phoneNumber: phoneNumber ?? _phoneNumber,
  rating: rating ?? _rating,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  cityName: cityName ?? _cityName,
  cityCode: cityCode ?? _cityCode,
  typeAccomodation: typeAccomodation ?? _typeAccomodation,
);
  dynamic get id => _id;
  String? get hotelName => _hotelName;
  String? get address => _address;
  num? get idTypeHotel => _idTypeHotel;
  num? get idCity => _idCity;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  num? get rating => _rating;
  dynamic get createdAt => _createdAt;
  dynamic get createdBy => _createdBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;
  String? get cityName => _cityName;
  String? get cityCode => _cityCode;
  String? get typeAccomodation => _typeAccomodation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['hotel_name'] = _hotelName;
    map['address'] = _address;
    map['id_type_hotel'] = _idTypeHotel;
    map['id_city'] = _idCity;
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    map['rating'] = _rating;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['city_name'] = _cityName;
    map['city_code'] = _cityCode;
    map['type_accomodation'] = _typeAccomodation;
    return map;
  }

}