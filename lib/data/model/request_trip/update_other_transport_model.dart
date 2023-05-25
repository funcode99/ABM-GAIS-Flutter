/// success : true
/// message : "Success Update Data"
/// data : {"id":3,"id_request_trip":"1","id_type_transportation":"1","from_date":"01-01-2023","to_date":"02-02-2023","id_city":"2","qty":"10","remarks":"1","code_status_doc":"0","created_at":"2023-05-16T00:21:27.000000Z","created_by":"2","updated_at":"2023-05-16T00:31:49.000000Z","updated_by":1}

class UpdateOtherTransportModel {
  UpdateOtherTransportModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdateOtherTransportModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UpdateOtherTransportModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UpdateOtherTransportModel(  success: success ?? _success,
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

/// id : 3
/// id_request_trip : "1"
/// id_type_transportation : "1"
/// from_date : "01-01-2023"
/// to_date : "02-02-2023"
/// id_city : "2"
/// qty : "10"
/// remarks : "1"
/// code_status_doc : "0"
/// created_at : "2023-05-16T00:21:27.000000Z"
/// created_by : "2"
/// updated_at : "2023-05-16T00:31:49.000000Z"
/// updated_by : 1

class Data {
  Data({
      num? id, 
      String? idRequestTrip, 
      String? idTypeTransportation, 
      String? fromDate, 
      String? toDate, 
      String? idCity, 
      String? qty, 
      String? remarks, 
      String? codeStatusDoc,
      String? createdAt, 
      String? createdBy, 
      String? updatedAt, 
      num? updatedBy,}){
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
  }
  num? _id;
  String? _idRequestTrip;
  String? _idTypeTransportation;
  String? _fromDate;
  String? _toDate;
  String? _idCity;
  String? _qty;
  String? _remarks;
  String? _codeStatusDoc;
  String? _createdAt;
  String? _createdBy;
  String? _updatedAt;
  num? _updatedBy;
Data copyWith({  num? id,
  String? idRequestTrip,
  String? idTypeTransportation,
  String? fromDate,
  String? toDate,
  String? idCity,
  String? qty,
  String? remarks,
  String? codeStatusDoc,
  String? createdAt,
  String? createdBy,
  String? updatedAt,
  num? updatedBy,
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
);
  num? get id => _id;
  String? get idRequestTrip => _idRequestTrip;
  String? get idTypeTransportation => _idTypeTransportation;
  String? get fromDate => _fromDate;
  String? get toDate => _toDate;
  String? get idCity => _idCity;
  String? get qty => _qty;
  String? get remarks => _remarks;
  String? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  num? get updatedBy => _updatedBy;

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
    return map;
  }

}