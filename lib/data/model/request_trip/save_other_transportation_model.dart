/// success : true
/// message : "Success Create Menu"
/// data : {"id_request_trip":"2","id_type_transportation":"1","from_date":"01-01-2023","to_date":"02-02-2023","id_city":"1","qty":"10","remarks":"1","created_at":"2023-05-15T22:35:36.000000Z","created_by":1,"code_status_doc":"0","updated_at":"2023-05-15T22:35:36.000000Z","id":1}

class SaveOtherTransportationModel {
  SaveOtherTransportationModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveOtherTransportationModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveOtherTransportationModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveOtherTransportationModel(  success: success ?? _success,
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

/// id_request_trip : "2"
/// id_type_transportation : "1"
/// from_date : "01-01-2023"
/// to_date : "02-02-2023"
/// id_city : "1"
/// qty : "10"
/// remarks : "1"
/// created_at : "2023-05-15T22:35:36.000000Z"
/// created_by : 1
/// code_status_doc : "0"
/// updated_at : "2023-05-15T22:35:36.000000Z"
/// id : 1

class Data {
  Data({
      String? idRequestTrip, 
      String? idTypeTransportation, 
      String? fromDate, 
      String? toDate, 
      String? idCity, 
      String? qty, 
      String? remarks, 
      String? createdAt, 
      num? createdBy, 
      String? codeStatusDoc,
      String? updatedAt, 
      num? id,}){
    _idRequestTrip = idRequestTrip;
    _idTypeTransportation = idTypeTransportation;
    _fromDate = fromDate;
    _toDate = toDate;
    _idCity = idCity;
    _qty = qty;
    _remarks = remarks;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _codeStatusDoc = codeStatusDoc;
    _updatedAt = updatedAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _idRequestTrip = json['id_request_trip'];
    _idTypeTransportation = json['id_type_transportation'];
    _fromDate = json['from_date'];
    _toDate = json['to_date'];
    _idCity = json['id_city'];
    _qty = json['qty'];
    _remarks = json['remarks'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _codeStatusDoc = json['code_status_doc'];
    _updatedAt = json['updated_at'];
    _id = json['id'];
  }
  String? _idRequestTrip;
  String? _idTypeTransportation;
  String? _fromDate;
  String? _toDate;
  String? _idCity;
  String? _qty;
  String? _remarks;
  String? _createdAt;
  num? _createdBy;
  String? _codeStatusDoc;
  String? _updatedAt;
  dynamic _id;
Data copyWith({  String? idRequestTrip,
  String? idTypeTransportation,
  String? fromDate,
  String? toDate,
  String? idCity,
  String? qty,
  String? remarks,
  String? createdAt,
  num? createdBy,
  String? codeStatusDoc,
  String? updatedAt,
  num? id,
}) => Data(  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  idTypeTransportation: idTypeTransportation ?? _idTypeTransportation,
  fromDate: fromDate ?? _fromDate,
  toDate: toDate ?? _toDate,
  idCity: idCity ?? _idCity,
  qty: qty ?? _qty,
  remarks: remarks ?? _remarks,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  updatedAt: updatedAt ?? _updatedAt,
  id: id ?? _id,
);
  String? get idRequestTrip => _idRequestTrip;
  String? get idTypeTransportation => _idTypeTransportation;
  String? get fromDate => _fromDate;
  String? get toDate => _toDate;
  String? get idCity => _idCity;
  String? get qty => _qty;
  String? get remarks => _remarks;
  String? get createdAt => _createdAt;
  num? get createdBy => _createdBy;
  String? get codeStatusDoc => _codeStatusDoc;
  String? get updatedAt => _updatedAt;
  dynamic get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_request_trip'] = _idRequestTrip;
    map['id_type_transportation'] = _idTypeTransportation;
    map['from_date'] = _fromDate;
    map['to_date'] = _toDate;
    map['id_city'] = _idCity;
    map['qty'] = _qty;
    map['remarks'] = _remarks;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['code_status_doc'] = _codeStatusDoc;
    map['updated_at'] = _updatedAt;
    map['id'] = _id;
    return map;
  }

}