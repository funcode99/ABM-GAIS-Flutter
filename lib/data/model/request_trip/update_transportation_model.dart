class UpdateTransportationModel {
  UpdateTransportationModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UpdateTransportationModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UpdateTransportationModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UpdateTransportationModel(  success: success ?? _success,
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

class Data {
  Data({
      String? id, 
      String? idRequestTrip, 
      String? idTypeTransportation, 
      String? fromDate, 
      String? toDate, 
      String? idCity, 
      String? qty, 
      String? remarks, 
      int? idCompany, 
      int? idSite, 
      String? date, 
      String? idDepartureCity, 
      String? idArrivalCity, 
      String? amount, 
      String? accountName, 
      String? codeStatusDoc, 
      int? createdBy, 
      int? updatedBy, 
      String? createdAt, 
      String? updatedAt,}){
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
  }
  String? _id;
  String? _idRequestTrip;
  String? _idTypeTransportation;
  String? _fromDate;
  String? _toDate;
  String? _idCity;
  String? _qty;
  String? _remarks;
  int? _idCompany;
  int? _idSite;
  String? _date;
  String? _idDepartureCity;
  String? _idArrivalCity;
  String? _amount;
  String? _accountName;
  String? _codeStatusDoc;
  int? _createdBy;
  int? _updatedBy;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  String? id,
  String? idRequestTrip,
  String? idTypeTransportation,
  String? fromDate,
  String? toDate,
  String? idCity,
  String? qty,
  String? remarks,
  int? idCompany,
  int? idSite,
  String? date,
  String? idDepartureCity,
  String? idArrivalCity,
  String? amount,
  String? accountName,
  String? codeStatusDoc,
  int? createdBy,
  int? updatedBy,
  String? createdAt,
  String? updatedAt,
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
);
  String? get id => _id;
  String? get idRequestTrip => _idRequestTrip;
  String? get idTypeTransportation => _idTypeTransportation;
  String? get fromDate => _fromDate;
  String? get toDate => _toDate;
  String? get idCity => _idCity;
  String? get qty => _qty;
  String? get remarks => _remarks;
  int? get idCompany => _idCompany;
  int? get idSite => _idSite;
  String? get date => _date;
  String? get idDepartureCity => _idDepartureCity;
  String? get idArrivalCity => _idArrivalCity;
  String? get amount => _amount;
  String? get accountName => _accountName;
  String? get codeStatusDoc => _codeStatusDoc;
  int? get createdBy => _createdBy;
  int? get updatedBy => _updatedBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

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
    return map;
  }

}