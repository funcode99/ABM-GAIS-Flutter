class SaveTransportationModel {
  SaveTransportationModel({
    bool? success,
    String? message,
    String? error,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _error = error;
    _data = data;
  }

  SaveTransportationModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _error = json['error'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _success;
  String? _message;
  String? _error;
  Data? _data;

  SaveTransportationModel copyWith({
    bool? success,
    String? message,
    String? error,
    Data? data,
  }) =>
      SaveTransportationModel(
        success: success ?? _success,
        message: message ?? _message,
        error: error ?? _error,
        data: data ?? _data,
      );

  bool? get success => _success;

  String? get message => _message;

  String? get error => _error;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['error'] = _error;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    String? idRequestTrip,
    String? amount,
    String? accountName,
    String? remarks,
    String? idDepartureCity,
    String? idArrivalCity,
    String? date,
    String? idTypeTransportation,
    String? fromDate,
    String? toDate,
    String? idCity,
    String? qty,
    String? idCompany,
    String? idSite,
    int? createdBy,
    String? codeStatusDoc,
    String? id,
    String? updatedAt,
    String? createdAt,
  }) {
    _idRequestTrip = idRequestTrip;
    _amount = amount;
    _accountName = accountName;
    _remarks = remarks;
    _idDepartureCity = idDepartureCity;
    _idArrivalCity = idArrivalCity;
    _date = date;
    _idTypeTransportation = idTypeTransportation;
    _fromDate = fromDate;
    _toDate = toDate;
    _idCity = idCity;
    _qty = qty;
    _idCompany = idCompany;
    _idSite = idSite;
    _createdBy = createdBy;
    _codeStatusDoc = codeStatusDoc;
    _id = id;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
  }

  Data.fromJson(dynamic json) {
    _idRequestTrip = json['id_request_trip'];
    _amount = json['amount'];
    _accountName = json['account_name'];
    _remarks = json['remarks'];
    _idDepartureCity = json['id_departure_city'];
    _idArrivalCity = json['id_arrival_city'];
    _date = json['date'];
    _idTypeTransportation = json['id_type_transportation'];
    _fromDate = json['from_date'];
    _toDate = json['to_date'];
    _idCity = json['id_city'];
    _qty = json['qty'];
    _idCompany = json['id_company'];
    _idSite = json['id_site'];
    _createdBy = json['created_by'];
    _codeStatusDoc = json['code_status_doc'];
    _id = json['id'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }

  String? _idRequestTrip;
  String? _amount;
  String? _accountName;
  String? _remarks;
  String? _idDepartureCity;
  String? _idArrivalCity;
  String? _date;
  String? _idTypeTransportation;
  String? _fromDate;
  String? _toDate;
  String? _idCity;
  String? _qty;
  String? _idCompany;
  String? _idSite;
  int? _createdBy;
  String? _codeStatusDoc;
  String? _id;
  String? _updatedAt;
  String? _createdAt;

  Data copyWith({
    String? idRequestTrip,
    String? amount,
    String? accountName,
    String? remarks,
    String? idDepartureCity,
    String? idArrivalCity,
    String? date,
    String? idTypeTransportation,
    String? fromDate,
    String? toDate,
    String? idCity,
    String? qty,
    String? idCompany,
    String? idSite,
    int? createdBy,
    String? codeStatusDoc,
    String? id,
    String? updatedAt,
    String? createdAt,
  }) =>
      Data(
        idRequestTrip: idRequestTrip ?? _idRequestTrip,
        amount: amount ?? _amount,
        accountName: accountName ?? _accountName,
        remarks: remarks ?? _remarks,
        idDepartureCity: idDepartureCity ?? _idDepartureCity,
        idArrivalCity: idArrivalCity ?? _idArrivalCity,
        date: date ?? _date,
        idTypeTransportation: idTypeTransportation ?? _idTypeTransportation,
        fromDate: fromDate ?? _fromDate,
        toDate: toDate ?? _toDate,
        idCity: idCity ?? _idCity,
        qty: qty ?? _qty,
        idCompany: idCompany ?? _idCompany,
        idSite: idSite ?? _idSite,
        createdBy: createdBy ?? _createdBy,
        codeStatusDoc: codeStatusDoc ?? _codeStatusDoc,
        id: id ?? _id,
        updatedAt: updatedAt ?? _updatedAt,
        createdAt: createdAt ?? _createdAt,
      );

  String? get idRequestTrip => _idRequestTrip;

  String? get amount => _amount;

  String? get accountName => _accountName;

  String? get remarks => _remarks;

  String? get idDepartureCity => _idDepartureCity;

  String? get idArrivalCity => _idArrivalCity;

  String? get date => _date;

  String? get idTypeTransportation => _idTypeTransportation;

  String? get fromDate => _fromDate;

  String? get toDate => _toDate;

  String? get idCity => _idCity;

  String? get qty => _qty;

  String? get idCompany => _idCompany;

  String? get idSite => _idSite;

  int? get createdBy => _createdBy;

  String? get codeStatusDoc => _codeStatusDoc;

  String? get id => _id;

  String? get updatedAt => _updatedAt;

  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_request_trip'] = _idRequestTrip;
    map['amount'] = _amount;
    map['account_name'] = _accountName;
    map['remarks'] = _remarks;
    map['id_departure_city'] = _idDepartureCity;
    map['id_arrival_city'] = _idArrivalCity;
    map['date'] = _date;
    map['id_type_transportation'] = _idTypeTransportation;
    map['from_date'] = _fromDate;
    map['to_date'] = _toDate;
    map['id_city'] = _idCity;
    map['qty'] = _qty;
    map['id_company'] = _idCompany;
    map['id_site'] = _idSite;
    map['created_by'] = _createdBy;
    map['code_status_doc'] = _codeStatusDoc;
    map['id'] = _id;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }
}
