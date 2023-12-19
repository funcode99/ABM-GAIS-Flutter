class GetTransportationModel {
  GetTransportationModel({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetTransportationModel.fromJson(dynamic json) {
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
GetTransportationModel copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetTransportationModel(  success: success ?? _success,
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

class Data {
  Data({
      String? id, 
      String? idRequestTrip, 
      int? idTypeTransportation, 
      String? fromDate, 
      String? toDate, 
      int? idCity, 
      int? qty, 
      String? remarks, 
      int? idCompany, 
      int? idSite, 
      String? date, 
      int? idDepartureCity, 
      int? idArrivalCity, 
      String? amount, 
      String? accountName, 
      int? codeStatusDoc, 
      int? createdBy, 
      dynamic updatedBy, 
      String? createdAt, 
      String? updatedAt, 
      String? noRequestTrip, 
      String? typeTransportation, 
      dynamic cityName, 
      int? code, 
      String? status, 
      String? employeeName, 
      dynamic nameDepartureCity, 
      dynamic nameArrivalCity,}){
    _id = id;
    _idRequestTrip = idRequestTrip;
    _idTypeTransportation = idTypeTransportation;
    _fromDate = fromDate;
    _toDate = toDate;
    _idCity = idCity;
    _qty = qty;
    _remarks = remarks;
    _idCompany = idCompany;
    _idSite = idSite;
    _date = date;
    _idDepartureCity = idDepartureCity;
    _idArrivalCity = idArrivalCity;
    _amount = amount;
    _accountName = accountName;
    _codeStatusDoc = codeStatusDoc;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _noRequestTrip = noRequestTrip;
    _typeTransportation = typeTransportation;
    _cityName = cityName;
    _code = code;
    _status = status;
    _employeeName = employeeName;
    _nameDepartureCity = nameDepartureCity;
    _nameArrivalCity = nameArrivalCity;
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
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
    _date = json['date'];
    _idDepartureCity = json['id_departure_city'];
    _idArrivalCity = json['id_arrival_city'];
    _amount = json['amount'];
    _accountName = json['account_name'];
    _codeStatusDoc = json['code_status_doc'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _noRequestTrip = json['no_request_trip'];
    _typeTransportation = json['type_transportation'];
    _cityName = json['city_name'];
    _code = json['code'];
    _status = json['status'];
    _employeeName = json['employee_name'];
    _nameDepartureCity = json['name_departure_city'];
    _nameArrivalCity = json['name_arrival_city'];
  }
  String? _id;
  String? _idRequestTrip;
  int? _idTypeTransportation;
  String? _fromDate;
  String? _toDate;
  int? _idCity;
  int? _qty;
  String? _remarks;
  int? _idCompany;
  int? _idSite;
  String? _date;
  int? _idDepartureCity;
  int? _idArrivalCity;
  String? _amount;
  String? _accountName;
  int? _codeStatusDoc;
  int? _createdBy;
  dynamic _updatedBy;
  String? _createdAt;
  String? _updatedAt;
  String? _noRequestTrip;
  String? _typeTransportation;
  dynamic _cityName;
  int? _code;
  String? _status;
  String? _employeeName;
  dynamic _nameDepartureCity;
  dynamic _nameArrivalCity;
Data copyWith({  String? id,
  String? idRequestTrip,
  int? idTypeTransportation,
  String? fromDate,
  String? toDate,
  int? idCity,
  int? qty,
  String? remarks,
  int? idCompany,
  int? idSite,
  String? date,
  int? idDepartureCity,
  int? idArrivalCity,
  String? amount,
  String? accountName,
  int? codeStatusDoc,
  int? createdBy,
  dynamic updatedBy,
  String? createdAt,
  String? updatedAt,
  String? noRequestTrip,
  String? typeTransportation,
  dynamic cityName,
  int? code,
  String? status,
  String? employeeName,
  dynamic nameDepartureCity,
  dynamic nameArrivalCity,
}) => Data(  id: id ?? _id,
  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  idTypeTransportation: idTypeTransportation ?? _idTypeTransportation,
  fromDate: fromDate ?? _fromDate,
  toDate: toDate ?? _toDate,
  idCity: idCity ?? _idCity,
  qty: qty ?? _qty,
  remarks: remarks ?? _remarks,
  idCompany: idCompany ?? _idCompany,
  idSite: idSite ?? _idSite,
  date: date ?? _date,
  idDepartureCity: idDepartureCity ?? _idDepartureCity,
  idArrivalCity: idArrivalCity ?? _idArrivalCity,
  amount: amount ?? _amount,
  accountName: accountName ?? _accountName,
  codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
  createdBy: createdBy ?? _createdBy,
  updatedBy: updatedBy ?? _updatedBy,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  noRequestTrip: noRequestTrip ?? _noRequestTrip,
  typeTransportation: typeTransportation ?? _typeTransportation,
  cityName: cityName ?? _cityName,
  code: code ?? _code,
  status: status ?? _status,
  employeeName: employeeName ?? _employeeName,
  nameDepartureCity: nameDepartureCity ?? _nameDepartureCity,
  nameArrivalCity: nameArrivalCity ?? _nameArrivalCity,
);
  String? get id => _id;
  String? get idRequestTrip => _idRequestTrip;
  int? get idTypeTransportation => _idTypeTransportation;
  String? get fromDate => _fromDate;
  String? get toDate => _toDate;
  int? get idCity => _idCity;
  int? get qty => _qty;
  String? get remarks => _remarks;
  int? get idCompany => _idCompany;
  int? get idSite => _idSite;
  String? get date => _date;
  int? get idDepartureCity => _idDepartureCity;
  int? get idArrivalCity => _idArrivalCity;
  String? get amount => _amount;
  String? get accountName => _accountName;
  int? get codeStatusDoc => _codeStatusDoc;
  int? get createdBy => _createdBy;
  dynamic get updatedBy => _updatedBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get noRequestTrip => _noRequestTrip;
  String? get typeTransportation => _typeTransportation;
  dynamic get cityName => _cityName;
  int? get code => _code;
  String? get status => _status;
  String? get employeeName => _employeeName;
  dynamic get nameDepartureCity => _nameDepartureCity;
  dynamic get nameArrivalCity => _nameArrivalCity;

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
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    map['date'] = _date;
    map['id_departure_city'] = _idDepartureCity;
    map['id_arrival_city'] = _idArrivalCity;
    map['amount'] = _amount;
    map['account_name'] = _accountName;
    map['code_status_doc'] = _codeStatusDoc;
    map['created_by'] = _createdBy;
    map['updated_by'] = _updatedBy;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['no_request_trip'] = _noRequestTrip;
    map['type_transportation'] = _typeTransportation;
    map['city_name'] = _cityName;
    map['code'] = _code;
    map['status'] = _status;
    map['employee_name'] = _employeeName;
    map['name_departure_city'] = _nameDepartureCity;
    map['name_arrival_city'] = _nameArrivalCity;
    return map;
  }

}