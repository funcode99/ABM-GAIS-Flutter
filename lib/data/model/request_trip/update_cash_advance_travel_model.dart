/// success : true
/// message : "Success Update Data"
/// data : {"id":175,"id_employee":"2","no_ca":null,"event":null,"date":"2023-06-02","type_ca":"1","id_request_trip":"1","id_currency":"1","remarks":"note update","grand_total":"1000","code_status_doc":null,"is_paid":0,"is_journal":0,"created_at":"2023-06-02T07:37:39.000000Z","created_by":1,"updated_at":"2023-06-02T07:37:39.000000Z","updated_by":null}

class UpdateCashAdvanceTravelModel {
  UpdateCashAdvanceTravelModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdateCashAdvanceTravelModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UpdateCashAdvanceTravelModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UpdateCashAdvanceTravelModel(  success: success ?? _success,
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

/// id : 175
/// id_employee : "2"
/// no_ca : null
/// event : null
/// date : "2023-06-02"
/// type_ca : "1"
/// id_request_trip : "1"
/// id_currency : "1"
/// remarks : "note update"
/// grand_total : "1000"
/// code_status_doc : null
/// is_paid : 0
/// is_journal : 0
/// created_at : "2023-06-02T07:37:39.000000Z"
/// created_by : 1
/// updated_at : "2023-06-02T07:37:39.000000Z"
/// updated_by : null

class Data {
  Data({
      num? id, 
      String? idEmployee, 
      dynamic noCa, 
      dynamic event, 
      String? date, 
      String? typeCa, 
      String? idRequestTrip, 
      String? idCurrency, 
      String? remarks, 
      String? grandTotal, 
      dynamic codeStatusDoc, 
      num? isPaid, 
      num? isJournal, 
      String? createdAt, 
      num? createdBy, 
      String? updatedAt, 
      dynamic updatedBy,}){
    _id = id;
    _idEmployee = idEmployee;
    _noCa = noCa;
    _event = event;
    _date = date;
    _typeCa = typeCa;
    _idRequestTrip = idRequestTrip;
    _idCurrency = idCurrency;
    _remarks = remarks;
    _grandTotal = grandTotal;
    _codeStatusDoc = codeStatusDoc;
    _isPaid = isPaid;
    _isJournal = isJournal;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idEmployee = json['id_employee'];
    _noCa = json['no_ca'];
    _event = json['event'];
    _date = json['date'];
    _typeCa = json['type_ca'];
    _idRequestTrip = json['id_request_trip'];
    _idCurrency = json['id_currency'];
    _remarks = json['remarks'];
    _grandTotal = json['grand_total'];
    _codeStatusDoc = json['code_status_doc'];
    _isPaid = json['is_paid'];
    _isJournal = json['is_journal'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }
  num? _id;
  String? _idEmployee;
  dynamic _noCa;
  dynamic _event;
  String? _date;
  String? _typeCa;
  String? _idRequestTrip;
  String? _idCurrency;
  String? _remarks;
  String? _grandTotal;
  dynamic _codeStatusDoc;
  num? _isPaid;
  num? _isJournal;
  String? _createdAt;
  num? _createdBy;
  String? _updatedAt;
  dynamic _updatedBy;
Data copyWith({  num? id,
  String? idEmployee,
  dynamic noCa,
  dynamic event,
  String? date,
  String? typeCa,
  String? idRequestTrip,
  String? idCurrency,
  String? remarks,
  String? grandTotal,
  dynamic codeStatusDoc,
  num? isPaid,
  num? isJournal,
  String? createdAt,
  num? createdBy,
  String? updatedAt,
  dynamic updatedBy,
}) => Data(  id: id ?? _id,
  idEmployee: idEmployee ?? _idEmployee,
  noCa: noCa ?? _noCa,
  event: event ?? _event,
  date: date ?? _date,
  typeCa: typeCa ?? _typeCa,
  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  idCurrency: idCurrency ?? _idCurrency,
  remarks: remarks ?? _remarks,
  grandTotal: grandTotal ?? _grandTotal,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  isPaid: isPaid ?? _isPaid,
  isJournal: isJournal ?? _isJournal,
  createdAt: createdAt ?? _createdAt,
  createdBy: createdBy ?? _createdBy,
  updatedAt: updatedAt ?? _updatedAt,
  updatedBy: updatedBy ?? _updatedBy,
);
  num? get id => _id;
  String? get idEmployee => _idEmployee;
  dynamic get noCa => _noCa;
  dynamic get event => _event;
  String? get date => _date;
  String? get typeCa => _typeCa;
  String? get idRequestTrip => _idRequestTrip;
  String? get idCurrency => _idCurrency;
  String? get remarks => _remarks;
  String? get grandTotal => _grandTotal;
  dynamic get codeStatusDoc => _codeStatusDoc;
  num? get isPaid => _isPaid;
  num? get isJournal => _isJournal;
  String? get createdAt => _createdAt;
  num? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_employee'] = _idEmployee;
    map['no_ca'] = _noCa;
    map['event'] = _event;
    map['date'] = _date;
    map['type_ca'] = _typeCa;
    map['id_request_trip'] = _idRequestTrip;
    map['id_currency'] = _idCurrency;
    map['remarks'] = _remarks;
    map['grand_total'] = _grandTotal;
    map['code_status_doc'] = _codeStatusDoc;
    map['is_paid'] = _isPaid;
    map['is_journal'] = _isJournal;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }

}