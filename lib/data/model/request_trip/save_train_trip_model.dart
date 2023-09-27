class SaveTrainTripModel {
  SaveTrainTripModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveTrainTripModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveTrainTripModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveTrainTripModel(  success: success ?? _success,
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
      String? idRequestTrip, 
      String? pnrid, 
      String? idVendor, 
      String? codeStation, 
      String? nameStation, 
      String? codeStationTo, 
      String? nameStationTo, 
      String? departDate, 
      String? adult, 
      String? child, 
      int? createdBy, 
      String? id, 
      String? updatedAt, 
      String? createdAt,}){
    _idRequestTrip = idRequestTrip;
    _pnrid = pnrid;
    _idVendor = idVendor;
    _codeStation = codeStation;
    _nameStation = nameStation;
    _codeStationTo = codeStationTo;
    _nameStationTo = nameStationTo;
    _departDate = departDate;
    _adult = adult;
    _child = child;
    _createdBy = createdBy;
    _id = id;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _idRequestTrip = json['id_request_trip'];
    _pnrid = json['pnrid'];
    _idVendor = json['id_vendor'];
    _codeStation = json['code_station'];
    _nameStation = json['name_station'];
    _codeStationTo = json['code_station_to'];
    _nameStationTo = json['name_station_to'];
    _departDate = json['depart_date'];
    _adult = json['adult'];
    _child = json['child'];
    _createdBy = json['created_by'];
    _id = json['id'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }
  String? _idRequestTrip;
  String? _pnrid;
  String? _idVendor;
  String? _codeStation;
  String? _nameStation;
  String? _codeStationTo;
  String? _nameStationTo;
  String? _departDate;
  String? _adult;
  String? _child;
  int? _createdBy;
  String? _id;
  String? _updatedAt;
  String? _createdAt;
Data copyWith({  String? idRequestTrip,
  String? pnrid,
  String? idVendor,
  String? codeStation,
  String? nameStation,
  String? codeStationTo,
  String? nameStationTo,
  String? departDate,
  String? adult,
  String? child,
  int? createdBy,
  String? id,
  String? updatedAt,
  String? createdAt,
}) => Data(  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  pnrid: pnrid ?? _pnrid,
  idVendor: idVendor ?? _idVendor,
  codeStation: codeStation ?? _codeStation,
  nameStation: nameStation ?? _nameStation,
  codeStationTo: codeStationTo ?? _codeStationTo,
  nameStationTo: nameStationTo ?? _nameStationTo,
  departDate: departDate ?? _departDate,
  adult: adult ?? _adult,
  child: child ?? _child,
  createdBy: createdBy ?? _createdBy,
  id: id ?? _id,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
);
  String? get idRequestTrip => _idRequestTrip;
  String? get pnrid => _pnrid;
  String? get idVendor => _idVendor;
  String? get codeStation => _codeStation;
  String? get nameStation => _nameStation;
  String? get codeStationTo => _codeStationTo;
  String? get nameStationTo => _nameStationTo;
  String? get departDate => _departDate;
  String? get adult => _adult;
  String? get child => _child;
  int? get createdBy => _createdBy;
  String? get id => _id;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_request_trip'] = _idRequestTrip;
    map['pnrid'] = _pnrid;
    map['id_vendor'] = _idVendor;
    map['code_station'] = _codeStation;
    map['name_station'] = _nameStation;
    map['code_station_to'] = _codeStationTo;
    map['name_station_to'] = _nameStationTo;
    map['depart_date'] = _departDate;
    map['adult'] = _adult;
    map['child'] = _child;
    map['created_by'] = _createdBy;
    map['id'] = _id;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }

}