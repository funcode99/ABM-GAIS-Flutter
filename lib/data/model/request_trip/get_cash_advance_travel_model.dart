/// success : true
/// message : "Success Get Data"
/// data : [{"id":173,"id_employee":1,"type_ca":1,"no_ca":"3000/CAT/0036/06.2023","event":null,"date":null,"grand_total":"100000","is_paid":0,"is_journal":0,"code_status_doc":0,"created_at":"2023-06-02 04:20:34","updated_at":"2023-06-02 04:20:34","no_request_trip":"RTRIP-2023-23-06/021/TRV-3000/06/2023","employee_name":"John Doe","sn_employee":"12345","code":0,"currency_name":"Indonesia Rupiah","currency_symbol":"Rp","currency_code":"IDR","status":"Draft","item_count":1}]

class GetCashAdvanceTravelModel {
  GetCashAdvanceTravelModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetCashAdvanceTravelModel.fromJson(dynamic json) {
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
GetCashAdvanceTravelModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetCashAdvanceTravelModel(  success: success ?? _success,
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

/// id : 173
/// id_employee : 1
/// type_ca : 1
/// no_ca : "3000/CAT/0036/06.2023"
/// event : null
/// date : null
/// grand_total : "100000"
/// is_paid : 0
/// is_journal : 0
/// code_status_doc : 0
/// created_at : "2023-06-02 04:20:34"
/// updated_at : "2023-06-02 04:20:34"
/// no_request_trip : "RTRIP-2023-23-06/021/TRV-3000/06/2023"
/// employee_name : "John Doe"
/// sn_employee : "12345"
/// code : 0
/// currency_name : "Indonesia Rupiah"
/// currency_symbol : "Rp"
/// currency_code : "IDR"
/// status : "Draft"
/// item_count : 1

class Data {
  Data({
      num? id, 
      num? idEmployee, 
      num? typeCa, 
      String? noCa, 
      dynamic event, 
      dynamic date, 
      String? grandTotal, 
      num? isPaid, 
      num? isJournal, 
      num? codeStatusDoc, 
      String? createdAt, 
      String? updatedAt, 
      String? noRequestTrip, 
      String? employeeName, 
      String? snEmployee, 
      num? code, 
      String? currencyName, 
      String? currencySymbol, 
      String? currencyCode, 
      String? status, 
      num? itemCount,}){
    _id = id;
    _idEmployee = idEmployee;
    _typeCa = typeCa;
    _noCa = noCa;
    _event = event;
    _date = date;
    _grandTotal = grandTotal;
    _isPaid = isPaid;
    _isJournal = isJournal;
    _codeStatusDoc = codeStatusDoc;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _noRequestTrip = noRequestTrip;
    _employeeName = employeeName;
    _snEmployee = snEmployee;
    _code = code;
    _currencyName = currencyName;
    _currencySymbol = currencySymbol;
    _currencyCode = currencyCode;
    _status = status;
    _itemCount = itemCount;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idEmployee = json['id_employee'];
    _typeCa = json['type_ca'];
    _noCa = json['no_ca'];
    _event = json['event'];
    _date = json['date'];
    _grandTotal = json['grand_total'];
    _isPaid = json['is_paid'];
    _isJournal = json['is_journal'];
    _codeStatusDoc = json['code_status_doc'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _noRequestTrip = json['no_request_trip'];
    _employeeName = json['employee_name'];
    _snEmployee = json['sn_employee'];
    _code = json['code'];
    _currencyName = json['currency_name'];
    _currencySymbol = json['currency_symbol'];
    _currencyCode = json['currency_code'];
    _status = json['status'];
    _itemCount = json['item_count'];
  }
  num? _id;
  num? _idEmployee;
  num? _typeCa;
  String? _noCa;
  dynamic _event;
  dynamic _date;
  String? _grandTotal;
  num? _isPaid;
  num? _isJournal;
  num? _codeStatusDoc;
  String? _createdAt;
  String? _updatedAt;
  String? _noRequestTrip;
  String? _employeeName;
  String? _snEmployee;
  num? _code;
  String? _currencyName;
  String? _currencySymbol;
  String? _currencyCode;
  String? _status;
  num? _itemCount;
Data copyWith({  num? id,
  num? idEmployee,
  num? typeCa,
  String? noCa,
  dynamic event,
  dynamic date,
  String? grandTotal,
  num? isPaid,
  num? isJournal,
  num? codeStatusDoc,
  String? createdAt,
  String? updatedAt,
  String? noRequestTrip,
  String? employeeName,
  String? snEmployee,
  num? code,
  String? currencyName,
  String? currencySymbol,
  String? currencyCode,
  String? status,
  num? itemCount,
}) => Data(  id: id ?? _id,
  idEmployee: idEmployee ?? _idEmployee,
  typeCa: typeCa ?? _typeCa,
  noCa: noCa ?? _noCa,
  event: event ?? _event,
  date: date ?? _date,
  grandTotal: grandTotal ?? _grandTotal,
  isPaid: isPaid ?? _isPaid,
  isJournal: isJournal ?? _isJournal,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
  employeeName: employeeName ?? _employeeName,
  snEmployee: snEmployee ?? _snEmployee,
  code: code ?? _code,
  currencyName: currencyName ?? _currencyName,
  currencySymbol: currencySymbol ?? _currencySymbol,
  currencyCode: currencyCode ?? _currencyCode,
  status: status ?? _status,
  itemCount: itemCount ?? _itemCount,
);
  num? get id => _id;
  num? get idEmployee => _idEmployee;
  num? get typeCa => _typeCa;
  String? get noCa => _noCa;
  dynamic get event => _event;
  dynamic get date => _date;
  String? get grandTotal => _grandTotal;
  num? get isPaid => _isPaid;
  num? get isJournal => _isJournal;
  num? get codeStatusDoc => _codeStatusDoc;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get noRequestTrip => _noRequestTrip;
  String? get employeeName => _employeeName;
  String? get snEmployee => _snEmployee;
  num? get code => _code;
  String? get currencyName => _currencyName;
  String? get currencySymbol => _currencySymbol;
  String? get currencyCode => _currencyCode;
  String? get status => _status;
  num? get itemCount => _itemCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_employee'] = _idEmployee;
    map['type_ca'] = _typeCa;
    map['no_ca'] = _noCa;
    map['event'] = _event;
    map['date'] = _date;
    map['grand_total'] = _grandTotal;
    map['is_paid'] = _isPaid;
    map['is_journal'] = _isJournal;
    map['code_status_doc'] = _codeStatusDoc;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['no_request_trip'] = _noRequestTrip;
    map['employee_name'] = _employeeName;
    map['sn_employee'] = _snEmployee;
    map['code'] = _code;
    map['currency_name'] = _currencyName;
    map['currency_symbol'] = _currencySymbol;
    map['currency_code'] = _currencyCode;
    map['status'] = _status;
    map['item_count'] = _itemCount;
    return map;
  }

}