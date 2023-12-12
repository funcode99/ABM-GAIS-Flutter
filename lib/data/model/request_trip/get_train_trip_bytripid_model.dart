class GetTrainTripBytripidModel {
  GetTrainTripBytripidModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetTrainTripBytripidModel.fromJson(dynamic json) {
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

  GetTrainTripBytripidModel copyWith({
    bool? success,
    String? message,
    List<Data>? data,
  }) =>
      GetTrainTripBytripidModel(
        success: success ?? _success,
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
    String? createdBy,
    String? updatedBy,
    String? pnrid,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
    dynamic travelerName,
    String? codeStation,
    String? nameStation,
    String? departDate,
    int? adult,
    int? child,
    String? codeStationTo,
    String? nameStationTo,
    int? idVendor,
    dynamic price,
    dynamic trainName,
    dynamic travelersObject,
  }) {
    _id = id;
    _idRequestTrip = idRequestTrip;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _pnrid = pnrid;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _travelerName = travelerName;
    _codeStation = codeStation;
    _nameStation = nameStation;
    _departDate = departDate;
    _adult = adult;
    _child = child;
    _codeStationTo = codeStationTo;
    _nameStationTo = nameStationTo;
    _idVendor = idVendor;
    _price = price;
    _trainName = trainName;
    _travelersObject = travelersObject;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idRequestTrip = json['id_request_trip'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _pnrid = json['pnrid'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _travelerName = json['traveler_name'];
    _codeStation = json['code_station'];
    _nameStation = json['name_station'];
    _departDate = json['depart_date'];
    _adult = json['adult'];
    _child = json['child'];
    _codeStationTo = json['code_station_to'];
    _nameStationTo = json['name_station_to'];
    _idVendor = json['id_vendor'];
    _price = json['price'];
    _trainName = json['train_name'];
    _travelersObject = json['travelers_object'];
  }

  String? _id;
  String? _idRequestTrip;
  String? _createdBy;
  String? _updatedBy;
  String? _pnrid;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  dynamic _travelerName;
  String? _codeStation;
  String? _nameStation;
  String? _departDate;
  int? _adult;
  int? _child;
  String? _codeStationTo;
  String? _nameStationTo;
  int? _idVendor;
  dynamic _price;
  dynamic _trainName;
  dynamic _travelersObject;

  Data copyWith({
    String? id,
    String? idRequestTrip,
    String? createdBy,
    String? updatedBy,
    String? pnrid,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
    dynamic travelerName,
    String? codeStation,
    String? nameStation,
    String? departDate,
    int? adult,
    int? child,
    String? codeStationTo,
    String? nameStationTo,
    int? idVendor,
    dynamic price,
    dynamic trainName,
    dynamic travelersObject
  }) =>
      Data(
        id: id ?? _id,
        idRequestTrip: idRequestTrip ?? _idRequestTrip,
        createdBy: createdBy ?? _createdBy,
        updatedBy: updatedBy ?? _updatedBy,
        pnrid: pnrid ?? _pnrid,
        deletedAt: deletedAt ?? _deletedAt,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        travelerName: travelerName ?? _travelerName,
        codeStation: codeStation ?? _codeStation,
        nameStation: nameStation ?? _nameStation,
        departDate: departDate ?? _departDate,
        adult: adult ?? _adult,
        child: child ?? _child,
        codeStationTo: codeStationTo ?? _codeStationTo,
        nameStationTo: nameStationTo ?? _nameStationTo,
        idVendor: idVendor ?? _idVendor,
        price: price ?? _price,
        trainName: trainName ?? _trainName,
        travelersObject: travelersObject ?? _travelersObject,
      );

  String? get id => _id;

  String? get idRequestTrip => _idRequestTrip;

  String? get createdBy => _createdBy;

  String? get updatedBy => _updatedBy;

  String? get pnrid => _pnrid;

  dynamic get deletedAt => _deletedAt;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  dynamic get travelerName => _travelerName;

  String? get codeStation => _codeStation;

  String? get nameStation => _nameStation;

  String? get departDate => _departDate;

  int? get adult => _adult;

  int? get child => _child;

  String? get codeStationTo => _codeStationTo;

  String? get nameStationTo => _nameStationTo;

  int? get idVendor => _idVendor;

  dynamic get price => _price;

  dynamic get trainName => _trainName;

  dynamic get travelersObject => _travelersObject;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_request_trip'] = _idRequestTrip;
    map['created_by'] = _createdBy;
    map['updated_by'] = _updatedBy;
    map['pnrid'] = _pnrid;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['traveler_name'] = _travelerName;
    map['code_station'] = _codeStation;
    map['name_station'] = _nameStation;
    map['depart_date'] = _departDate;
    map['adult'] = _adult;
    map['child'] = _child;
    map['code_station_to'] = _codeStationTo;
    map['name_station_to'] = _nameStationTo;
    map['id_vendor'] = _idVendor;
    map['price'] = _price;
    map['train_name'] = _trainName;
    map['travelers_object'] = _travelersObject;
    return map;
  }
}
