class SaveActualTripModel {
  SaveActualTripModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveActualTripModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveActualTripModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveActualTripModel(  success: success ?? _success,
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
      String? noAct, 
      dynamic purpose, 
      dynamic totalTlk, 
      dynamic notes, 
      List<ArrayTrip>? arrayTrip, 
      List<ArrayActivities>? arrayActivities,}){
    _id = id;
    _idRequestTrip = idRequestTrip;
    _noAct = noAct;
    _purpose = purpose;
    _totalTlk = totalTlk;
    _notes = notes;
    _arrayTrip = arrayTrip;
    _arrayActivities = arrayActivities;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _idRequestTrip = json['id_request_trip'];
    _noAct = json['no_act'];
    _purpose = json['purpose'];
    _totalTlk = json['total_tlk'];
    _notes = json['notes'];
    if (json['array_trip'] != null) {
      _arrayTrip = [];
      json['array_trip'].forEach((v) {
        _arrayTrip?.add(ArrayTrip.fromJson(v));
      });
    }
    if (json['array_activities'] != null) {
      _arrayActivities = [];
      json['array_activities'].forEach((v) {
        _arrayActivities?.add(ArrayActivities.fromJson(v));
      });
    }
  }
  String? _id;
  String? _idRequestTrip;
  String? _noAct;
  dynamic _purpose;
  dynamic _totalTlk;
  dynamic _notes;
  List<ArrayTrip>? _arrayTrip;
  List<ArrayActivities>? _arrayActivities;
Data copyWith({  String? id,
  String? idRequestTrip,
  String? noAct,
  dynamic purpose,
  dynamic totalTlk,
  dynamic notes,
  List<ArrayTrip>? arrayTrip,
  List<ArrayActivities>? arrayActivities,
}) => Data(  id: id ?? _id,
  idRequestTrip: idRequestTrip ?? _idRequestTrip,
  noAct: noAct ?? _noAct,
  purpose: purpose ?? _purpose,
  totalTlk: totalTlk ?? _totalTlk,
  notes: notes ?? _notes,
  arrayTrip: arrayTrip ?? _arrayTrip,
  arrayActivities: arrayActivities ?? _arrayActivities,
);
  String? get id => _id;
  String? get idRequestTrip => _idRequestTrip;
  String? get noAct => _noAct;
  dynamic get purpose => _purpose;
  dynamic get totalTlk => _totalTlk;
  dynamic get notes => _notes;
  List<ArrayTrip>? get arrayTrip => _arrayTrip;
  List<ArrayActivities>? get arrayActivities => _arrayActivities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_request_trip'] = _idRequestTrip;
    map['no_act'] = _noAct;
    map['purpose'] = _purpose;
    map['total_tlk'] = _totalTlk;
    map['notes'] = _notes;
    if (_arrayTrip != null) {
      map['array_trip'] = _arrayTrip?.map((v) => v.toJson()).toList();
    }
    if (_arrayActivities != null) {
      map['array_activities'] = _arrayActivities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ArrayActivities {
  ArrayActivities({
      String? id, 
      String? idAct, 
      dynamic actDate, 
      dynamic activities,}){
    _id = id;
    _idAct = idAct;
    _actDate = actDate;
    _activities = activities;
}

  ArrayActivities.fromJson(dynamic json) {
    _id = json['id'];
    _idAct = json['id_act'];
    _actDate = json['act_date'];
    _activities = json['activities'];
  }
  String? _id;
  String? _idAct;
  dynamic _actDate;
  dynamic _activities;
ArrayActivities copyWith({  String? id,
  String? idAct,
  dynamic actDate,
  dynamic activities,
}) => ArrayActivities(  id: id ?? _id,
  idAct: idAct ?? _idAct,
  actDate: actDate ?? _actDate,
  activities: activities ?? _activities,
);
  String? get id => _id;
  String? get idAct => _idAct;
  dynamic get actDate => _actDate;
  dynamic get activities => _activities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_act'] = _idAct;
    map['act_date'] = _actDate;
    map['activities'] = _activities;
    return map;
  }

}

class ArrayTrip {
  ArrayTrip({
      String? id, 
      String? idAct, 
      dynamic dateDeparture, 
      dynamic dateArrival, 
      String? idCityFrom, 
      String? idCityTo,}){
    _id = id;
    _idAct = idAct;
    _dateDeparture = dateDeparture;
    _dateArrival = dateArrival;
    _idCityFrom = idCityFrom;
    _idCityTo = idCityTo;
}

  ArrayTrip.fromJson(dynamic json) {
    _id = json['id'];
    _idAct = json['id_act'];
    _dateDeparture = json['date_departure'];
    _dateArrival = json['date_arrival'];
    _idCityFrom = json['id_city_from'];
    _idCityTo = json['id_city_to'];
  }
  String? _id;
  String? _idAct;
  dynamic _dateDeparture;
  dynamic _dateArrival;
  String? _idCityFrom;
  String? _idCityTo;
ArrayTrip copyWith({  String? id,
  String? idAct,
  dynamic dateDeparture,
  dynamic dateArrival,
  String? idCityFrom,
  String? idCityTo,
}) => ArrayTrip(  id: id ?? _id,
  idAct: idAct ?? _idAct,
  dateDeparture: dateDeparture ?? _dateDeparture,
  dateArrival: dateArrival ?? _dateArrival,
  idCityFrom: idCityFrom ?? _idCityFrom,
  idCityTo: idCityTo ?? _idCityTo,
);
  String? get id => _id;
  String? get idAct => _idAct;
  dynamic get dateDeparture => _dateDeparture;
  dynamic get dateArrival => _dateArrival;
  String? get idCityFrom => _idCityFrom;
  String? get idCityTo => _idCityTo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_act'] = _idAct;
    map['date_departure'] = _dateDeparture;
    map['date_arrival'] = _dateArrival;
    map['id_city_from'] = _idCityFrom;
    map['id_city_to'] = _idCityTo;
    return map;
  }

}