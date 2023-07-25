/// success : true
/// message : "Success Get Data"
/// data : [{"id":86,"id_employee":1,"type_ca":1,"no_ca":"CA/TEST/DUMMY/01","id_request_trip":1,"id_currency":1,"grand_total":"72000","is_paid":0,"is_journal":0,"code_status_doc":0,"created_at":"2023-05-24 02:00:10","updated_at":"2023-05-24 02:00:10","remarks":"note","no_request_trip":null,"employee_name":"John Doe","sn_employee":"12345","currency_name":null,"currency_symbol":null,"currency_code":null,"code":0,"status":"Draft","item_count":2}]

class GetCashAdvanceByidModel {
  GetCashAdvanceByidModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetCashAdvanceByidModel.fromJson(dynamic json) {
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
GetCashAdvanceByidModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetCashAdvanceByidModel(  success: success ?? _success,
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

/// id : 86
/// id_employee : 1
/// type_ca : 1
/// no_ca : "CA/TEST/DUMMY/01"
/// id_request_trip : 1
/// id_currency : 1
/// grand_total : "72000"
/// is_paid : 0
/// is_journal : 0
/// code_status_doc : 0
/// created_at : "2023-05-24 02:00:10"
/// updated_at : "2023-05-24 02:00:10"
/// remarks : "note"
/// no_request_trip : null
/// employee_name : "John Doe"
/// sn_employee : "12345"
/// currency_name : null
/// currency_symbol : null
/// currency_code : null
/// code : 0
/// status : "Draft"
/// item_count : 2

class Data {
  Data({
      num? id, 
      num? idEmployee, 
      num? typeCa, 
      String? noCa, 
      num? idRequestTrip, 
      num? idCurrency, 
      String? grandTotal, 
      num? isPaid, 
      num? isJournal, 
      num? codeStatusDoc, 
      String? createdAt, 
      String? updatedAt, 
      String? remarks, 
      dynamic noRequestTrip, 
      String? employeeName, 
      String? snEmployee, 
      dynamic currencyName, 
      dynamic currencySymbol, 
      dynamic currencyCode, 
      num? code, 
      String? status, 
      num? itemCount,}){
    _id = id;
    _idEmployee = idEmployee;
    _typeCa = typeCa;
    _noCa = noCa;
    _idRequestTrip = idRequestTrip;
    _idCurrency = idCurrency;
    _grandTotal = grandTotal;
    _isPaid = isPaid;
    _isJournal = isJournal;
    _codeStatusDoc = codeStatusDoc;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _remarks = remarks;
    _noRequestTrip = noRequestTrip;
    _employeeName = employeeName;
    _snEmployee = snEmployee;
    _currencyName = currencyName;
    _currencySymbol = currencySymbol;
    _currencyCode = currencyCode;
    _code = code;
    _status = status;
    _itemCount = itemCount;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idEmployee = json['id_employee'];
    _typeCa = json['type_ca'];
    _noCa = json['no_ca'];
    _idRequestTrip = json['id_request_trip'];
    _idCurrency = json['id_currency'];
    _grandTotal = json['grand_total'];
    _isPaid = json['is_paid'];
    _isJournal = json['is_journal'];
    _codeStatusDoc = json['code_status_doc'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _remarks = json['remarks'];
    _noRequestTrip = json['no_request_trip'];
    _employeeName = json['employee_name'];
    _snEmployee = json['sn_employee'];
    _currencyName = json['currency_name'];
    _currencySymbol = json['currency_symbol'];
    _currencyCode = json['currency_code'];
    _code = json['code'];
    _status = json['status'];
    _itemCount = json['item_count'];
  }
  dynamic _id;
  num? _idEmployee;
  num? _typeCa;
  String? _noCa;
  dynamic _idRequestTrip;
  num? _idCurrency;
  String? _grandTotal;
  num? _isPaid;
  num? _isJournal;
  num? _codeStatusDoc;
  String? _createdAt;
  String? _updatedAt;
  String? _remarks;
  dynamic _noRequestTrip;
  String? _employeeName;
  String? _snEmployee;
  dynamic _currencyName;
  dynamic _currencySymbol;
  dynamic _currencyCode;
  num? _code;
  String? _status;
  num? _itemCount;
Data copyWith({  num? id,
  num? idEmployee,
  num? typeCa,
  String? noCa,
  num? idRequestTrip,
  num? idCurrency,
  String? grandTotal,
  num? isPaid,
  num? isJournal,
  num? codeStatusDoc,
  String? createdAt,
  String? updatedAt,
  String? remarks,
  dynamic noRequestTrip,
  String? employeeName,
  String? snEmployee,
  dynamic currencyName,
  dynamic currencySymbol,
  dynamic currencyCode,
  num? code,
  String? status,
  num? itemCount,
}) => Data(  id: id ?? _id,
  idEmployee: idEmployee ?? _idEmployee,
  typeCa: typeCa ?? _typeCa,
  noCa: noCa ?? _noCa,
  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  idCurrency: idCurrency ?? _idCurrency,
  grandTotal: grandTotal ?? _grandTotal,
  isPaid: isPaid ?? _isPaid,
  isJournal: isJournal ?? _isJournal,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  remarks: remarks ?? _remarks,
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
  employeeName: employeeName ?? _employeeName,
  snEmployee: snEmployee ?? _snEmployee,
  currencyName: currencyName ?? _currencyName,
  currencySymbol: currencySymbol ?? _currencySymbol,
  currencyCode: currencyCode ?? _currencyCode,
  code: code ?? _code,
  status: status ?? _status,
  itemCount: itemCount ?? _itemCount,
);
  dynamic get id => _id;
  num? get idEmployee => _idEmployee;
  num? get typeCa => _typeCa;
  String? get noCa => _noCa;
  num? get idRequestTrip => _idRequestTrip;
  num? get idCurrency => _idCurrency;
  String? get grandTotal => _grandTotal;
  num? get isPaid => _isPaid;
  num? get isJournal => _isJournal;
  num? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get remarks => _remarks;
  dynamic get noRequestTrip => _noRequestTrip;
  String? get employeeName => _employeeName;
  String? get snEmployee => _snEmployee;
  dynamic get currencyName => _currencyName;
  dynamic get currencySymbol => _currencySymbol;
  dynamic get currencyCode => _currencyCode;
  num? get code => _code;
  String? get status => _status;
  num? get itemCount => _itemCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_employee'] = _idEmployee;
    map['type_ca'] = _typeCa;
    map['no_ca'] = _noCa;
    map['id_request_trip'] = _idRequestTrip;
    map['id_currency'] = _idCurrency;
    map['grand_total'] = _grandTotal;
    map['is_paid'] = _isPaid;
    map['is_journal'] = _isJournal;
    map['code_status_doc'] = _codeStatusDoc;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['remarks'] = _remarks;
    map['no_request_trip'] = _noRequestTrip;
    map['employee_name'] = _employeeName;
    map['sn_employee'] = _snEmployee;
    map['currency_name'] = _currencyName;
    map['currency_symbol'] = _currencySymbol;
    map['currency_code'] = _currencyCode;
    map['code'] = _code;
    map['status'] = _status;
    map['item_count'] = _itemCount;
    return map;
  }

}