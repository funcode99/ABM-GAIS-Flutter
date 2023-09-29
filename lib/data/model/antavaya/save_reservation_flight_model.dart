class SaveReservationFlightModel {
  SaveReservationFlightModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  SaveReservationFlightModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
SaveReservationFlightModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => SaveReservationFlightModel(  success: success ?? _success,
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
      String? pnrid,}){
    _pnrid = pnrid;
}

  Data.fromJson(dynamic json) {
    _pnrid = json['pnrid'];
  }
  String? _pnrid;
Data copyWith({  String? pnrid,
}) => Data(  pnrid: pnrid ?? _pnrid,
);
  String? get pnrid => _pnrid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pnrid'] = _pnrid;
    return map;
  }

}