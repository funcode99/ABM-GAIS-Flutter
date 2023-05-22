/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"id_request_trip":2,"id_type_transportation":2,"from_date":"2023-05-20","to_date":"2023-05-23","id_city":1,"qty":2,"remarks":null,"code_status_doc":0,"created_at":"2023-05-20 11:40:35","created_by":"2","updated_at":"2023-05-20 12:33:18","updated_by":"2","no_request_trip":"REQ/ABM/123","type_transportation":"Rent Car","city_name":"Bandung","code":0,"status":"Draft"}]

class GetOtherTransportModel {
  GetOtherTransportModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetOtherTransportModel.fromJson(dynamic json) {
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
GetOtherTransportModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetOtherTransportModel(  success: success ?? _success,
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
/// id_type_transportation : 2
/// from_date : "2023-05-20"
/// to_date : "2023-05-23"
/// id_city : 1
/// qty : 2
/// remarks : null
/// code_status_doc : 0
/// created_at : "2023-05-20 11:40:35"
/// created_by : "2"
/// updated_at : "2023-05-20 12:33:18"
/// updated_by : "2"
/// no_request_trip : "REQ/ABM/123"
/// type_transportation : "Rent Car"
/// city_name : "Bandung"
/// code : 0
/// status : "Draft"

class Data {
  Data({
      num? id, 
      num? idRequestTrip, 
      num? idTypeTransportation, 
      String? fromDate, 
      String? toDate, 
      num? idCity, 
      num? qty, 
      dynamic remarks, 
      num? codeStatusDoc, 
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      String? updatedBy, 
      String? noRequestTrip, 
      String? typeTransportation, 
      String? cityName, 
      num? code, 
      String? status,}){
    _id = id;
    _idRequestTrip = idRequestTrip;
    _idTypeTransportation = idTypeTransportation;
    _fromDate = fromDate;
    _toDate = toDate;
    _idCity = idCity;
    _qty = qty;
    _remarks = remarks;
    _codeStatusDoc = codeStatusDoc;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
    _noRequestTrip = noRequestTrip;
    _typeTransportation = typeTransportation;
    _cityName = cityName;
    _code = code;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idRequestTrip = json['id_request_trip'];
    _idTypeTransportation = json['id_type_transportation'];
    _fromDate = json['from_date'];
    _toDate = json['to_date'];
    _idCity = json['id_city'];
    _qty = json['qty'];
    _remarks = json['remarks'];
    _codeStatusDoc = json['code_status_doc'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
    _noRequestTrip = json['no_request_trip'];
    _typeTransportation = json['type_transportation'];
    _cityName = json['city_name'];
    _code = json['code'];
    _status = json['status'];
  }
  num? _id;
  num? _idRequestTrip;
  num? _idTypeTransportation;
  String? _fromDate;
  String? _toDate;
  num? _idCity;
  num? _qty;
  dynamic _remarks;
  num? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  String? _updatedBy;
  String? _noRequestTrip;
  String? _typeTransportation;
  String? _cityName;
  num? _code;
  String? _status;
Data copyWith({  num? id,
  num? idRequestTrip,
  num? idTypeTransportation,
  String? fromDate,
  String? toDate,
  num? idCity,
  num? qty,
  dynamic remarks,
  num? codeStatusDoc,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  String? updatedBy,
  String? noRequestTrip,
  String? typeTransportation,
  String? cityName,
  num? code,
  String? status,
}) => Data(  id: id ?? _id,
  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  idTypeTransportation: idTypeTransportation ?? _idTypeTransportation,
  fromDate: fromDate ?? _fromDate,
  toDate: toDate ?? _toDate,
  idCity: idCity ?? _idCity,
  qty: qty ?? _qty,
  remarks: remarks ?? _remarks,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
  typeTransportation: typeTransportation ?? _typeTransportation,
  cityName: cityName ?? _cityName,
  code: code ?? _code,
  status: status ?? _status,
);
  num? get id => _id;
  num? get idRequestTrip => _idRequestTrip;
  num? get idTypeTransportation => _idTypeTransportation;
  String? get fromDate => _fromDate;
  String? get toDate => _toDate;
  num? get idCity => _idCity;
  num? get qty => _qty;
  dynamic get remarks => _remarks;
  num? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  String? get updatedBy => _updatedBy;
  String? get noRequestTrip => _noRequestTrip;
  String? get typeTransportation => _typeTransportation;
  String? get cityName => _cityName;
  num? get code => _code;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_request_trip'] = _idRequestTrip;
    map['id_type_transportation'] = _idTypeTransportation;
    map['from_date'] = _fromDate;
    map['to_date'] = _toDate;
    map['id_city'] = _idCity;
    map['qty'] = _qty;
    map['remarks'] = _remarks;
    map['code_status_doc'] = _codeStatusDoc;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    map['no_request_trip'] = _noRequestTrip;
    map['type_transportation'] = _typeTransportation;
    map['city_name'] = _cityName;
    map['code'] = _code;
    map['status'] = _status;
    return map;
  }

}