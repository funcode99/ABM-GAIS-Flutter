/// success : true
/// message : "Success Get Data"
/// data : [{"id":14,"id_request_trip":80,"id_type_transportation":1,"from_date":"2023-06-01","to_date":"2023-06-03","id_city":10,"qty":2,"remarks":null,"code_status_doc":0,"created_at":"2023-06-01 07:48:22","created_by":"2","updated_at":"2023-06-01 07:48:22","updated_by":null,"no_request_trip":"RTRIP-2023-23-06/017/TRV-3000/06/2023","type_transportation":"RWA HO Office Car","city_name":"Bekasi","code":0,"status":"Draft","employee_name":"John Doe"},{"id":12,"id_request_trip":43,"id_type_transportation":6,"from_date":"2023-05-31","to_date":"2023-06-03","id_city":36,"qty":1,"remarks":null,"code_status_doc":0,"created_at":"2023-05-29 05:01:27","created_by":"1","updated_at":"2023-05-29 05:01:27","updated_by":null,"no_request_trip":"1","type_transportation":"SSB Pool Car (SSB)","city_name":"Batam Tengah","code":0,"status":"Draft","employee_name":"Admin"},{"id":13,"id_request_trip":54,"id_type_transportation":2,"from_date":"2023-05-30","to_date":"2023-05-30","id_city":8,"qty":1,"remarks":"tester add ot","code_status_doc":1,"created_at":"2023-05-29 21:56:05","created_by":"2","updated_at":"2023-05-29 21:56:05","updated_by":null,"no_request_trip":"RTRIP-2023-23-05/004/TRV-3000/05/2023","type_transportation":"Rent Car","city_name":"Depok","code":1,"status":"Submit","employee_name":"John Doe"}]

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

/// id : 14
/// id_request_trip : 80
/// id_type_transportation : 1
/// from_date : "2023-06-01"
/// to_date : "2023-06-03"
/// id_city : 10
/// qty : 2
/// remarks : null
/// code_status_doc : 0
/// created_at : "2023-06-01 07:48:22"
/// created_by : "2"
/// updated_at : "2023-06-01 07:48:22"
/// updated_by : null
/// no_request_trip : "RTRIP-2023-23-06/017/TRV-3000/06/2023"
/// type_transportation : "RWA HO Office Car"
/// city_name : "Bekasi"
/// code : 0
/// status : "Draft"
/// employee_name : "John Doe"

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
      dynamic updatedBy, 
      String? noRequestTrip, 
      String? typeTransportation, 
      String? cityName, 
      num? code, 
      String? status, 
      String? employeeName,}){
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
    _employeeName = employeeName;
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
    _employeeName = json['employee_name'];
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
  dynamic _updatedBy;
  String? _noRequestTrip;
  String? _typeTransportation;
  String? _cityName;
  num? _code;
  String? _status;
  String? _employeeName;
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
  dynamic updatedBy,
  String? noRequestTrip,
  String? typeTransportation,
  String? cityName,
  num? code,
  String? status,
  String? employeeName,
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
  employeeName: employeeName ?? _employeeName,
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
  dynamic get updatedBy => _updatedBy;
  String? get noRequestTrip => _noRequestTrip;
  String? get typeTransportation => _typeTransportation;
  String? get cityName => _cityName;
  num? get code => _code;
  String? get status => _status;
  String? get employeeName => _employeeName;

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
    map['employee_name'] = _employeeName;
    return map;
  }

}